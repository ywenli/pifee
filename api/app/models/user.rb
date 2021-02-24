class User < ApplicationRecord
  include UserAuth::Tokenizable
  # gem bcrypt
  has_secure_password

  validates :name, presence: true,
                    length: { maximum: 30, allow_blank: true}

  VALID_PASSWORD_REGEX = /\A[\w\-]+\z/
  validates :password, presence: true,
                        length: { minimum: 8 },
                        format: {
                          with: VALID_PASSWORD_REGEX,
                          message: :invalid_password
                        },
                        allow_nil: true

  # 共通のJSONレスポンス
  def my_json
    as_json(only: [:id, :name, :email, :created_at])
  end
end
