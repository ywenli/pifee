class Api::V1::UserTokenController < ApplicationController
  # not_found_exception_classが発生したときに、not_foundメソッドを実行
  rescue_from UserAuth.not_found_exception_class, with: :not_found
  before_action :delete_cookie
  before_action :authenticate, only: [:create]

  # login
  def create
    cookies[token_access_key] = cookie_token
    render json: {
      exp: auth.payload[:exp],
      user: entity.my_json
    }
  end

  # logout
  # cookieの削除は before_action で行われるので、リクエストが正しく通ったレスポンスだけ返す
  def destroy
    head(:ok)
  end

  private

    # entityが存在しない、entityのパスワードが一致しない場合に404エラーを返す
    def authenticate
      unless entity.present? && entity.authenticate(auth_params[:password])
        raise UserAuth.not_found_exception_class
      end
    end

    # NotFoundエラー発生時にヘッダーレスポンスのみを返す
    # status => Rack::Utils::SYMBOL_TO_STATUS_CODE
    def not_found
      head(:not_found)
    end

    # メールアドレスからアクティブなユーザーを返す
    def entity
      @_entity ||= User.find_activated(auth_params[:email])
    end

    def auth_params
      params.require(:auth).permit(:email, :password)
    end

    # トークンを発行する
    def auth
      @_auth ||= UserAuth::AuthToken.new(payload: { sub: entity.id })
    end

    # クッキーに保存するトークン
    def cookie_token
      {
        value: auth.token,
        expires: Time.zone.at(auth.payload[:exp]),
        # https通信飲みアクセスできるCookie: 本番環境のみ有効
        secure: Rails.env.production?,
        http_only: true
      }
    end
end
