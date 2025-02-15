require 'jwt'

module UserAuth
  class AuthToken
    attr_reader :token, :payload, :lifetime

    def initialize(lifetime: nil, payload: {}, token: nil, options: {})
      if token.present?
        @payload, _ = JWT.decode(token.to_s, decode_key, true, decode_options.merge(options))
        @token = token
      else
        @lifetime = lifetime || UserAuth.token_lifetime
        @payload = claims.merge(payload)
        @token = JWT.encode(@payload, secret_key, algorithm, header_fields)
      end
    end

    # subjectからユーザーを検索する
    def entity_for_user
      User.find @payload['sub']
    end

    # token_lifetimeの日本語変換を返す
    # @example
    # "2.hours".lifetime_text #=> {
    #   time = 2, period = hour = 時間 }
    def lifetime_text
      time, period = @lifetime.inspect.delete_suffix('s').split
      time + I18n.t("datetime.periods.#{period}", default: '')
    end

    private

      # エンコードキー(config/initializers/user_auth.rb)
      def secret_key
        UserAuth.token_secret_signature_key.call
      end

      # デコードキー(config/initializers/user_auth.rb)
      def decode_key
        UserAuth.token_public_key || secret_key
      end

      # オーディエンスの値がある場合にtrueを返す
      def verify_audience?
        UserAuth.token_audience.present?
      end

      # オーディエンス(config/initializers/user_auth.rb)
      def token_audience
        verify_audience? && UserAuth.token_audience.call
      end

      # アルゴリズム(config/initializers/user_auth.rb)
      def algorithm
        UserAuth.token_signature_algorithm
      end

      # トークン有効期限を秒数で返す
      def token_lifetime
        @lifetime.from_now.to_i
      end

      # デコード時のオプション
      # default: https://www.rubydoc.info/github/jwt/ruby-jwt/master/JWT/DefaultOptions
      def decode_options
        {
          aud: token_audience,
          # エンコードのaudの値とデコードのaudの値が一致しないと無効なトークンと判断される
          verify_aud: verify_audience?,
          algorithm: algorithm
        }
      end

      # デフォルトクレーム
      def claims
        _claims = {}
        _claims[:exp] = token_lifetime
        _claims[:aud] = token_audience if verify_audience?
        _claims
      end

      # エンコード時のヘッダー
      # Doc: https://openid-foundation-japan.github.io/draft-ietf-oauth-json-web-token-11.ja.html#typHdrDef
      def header_fields
        { typ: 'JWT' }
      end
  end
end
