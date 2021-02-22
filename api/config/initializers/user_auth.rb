module UserAuth
  # tokenの有効期限: 2週間
  mattr_accessor :token_lifetime
  self.token_lifetime = 2.week
  # tokenの発行先（受信者）を指定
  mattr_accessor :token_audience
  self.token_audience = -> {
    ENV["API_DOMAIN"]
  }

  # 署名アルゴリズムを指定: HS256
  mattr_accessor :token_signature_algorithm
  self.token_signature_algorithm = "HS256"

  # 署名に使用する鍵を指定: Railsのシークレットキーを使用
  mattr_accessor :token_secret_signature_key
  self.token_secret_signature_key = -> {
    Rails.application.credentials.secret_key_base
  }

  # 公開鍵を指定: HS256の場合は公開鍵を使わない
  mattr_accessor :token_public_key
  self.token_public_key = nil

  # Cookieに保存するときのオブジェクトキーを指定
  mattr_accessor :token_access_key
  self.token_access_key = :access_token

  # Railの例外を指定: ログインユーザーが見当たらないときは 'RecordNotFound' を返す
  mattr_accessor :not_found_exception_class
  self.not_found_exception_class = ActiveRecord::RecordNotFound

end
