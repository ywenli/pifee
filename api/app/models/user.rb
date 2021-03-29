require 'validator/email_validator'

class User < ApplicationRecord
  has_many :works, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_works, through: :likes, source: :work
  before_validation :downcase_email
  include UserAuth::Tokenizable
  # gem bcrypt
  has_secure_password

  validates :url, presence: true,
                  uniqueness: {case_sensitive: false},
                  length: { maximum: 30, allow_blank: true}
  validates :name, presence: true,
                    length: { maximum: 30, allow_blank: true}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
                    uniqueness: {case_sensitive: false},
                    length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX }
  VALID_PASSWORD_REGEX = /\A[\w\-]+\z/
  validates :password, presence: true,
                        length: { minimum: 8 },
                        format: {
                          with: VALID_PASSWORD_REGEX
                        },
                        allow_nil: true

  ## methods
  # class method #######################
  class << self
    # emailからアクティブなユーザーを返す
    def find_activated(email)
      find_by(email: email, activated: true)
    end
  end
  # class method end ###################

  # 自分以外の同じemailのアクティブなユーザーがいる場合にtrueを返す
  def email_activated?
    users = User.where.not(id: id)
    users.find_activated(email).present?
  end

  # 共通のJSONレスポンス
  def my_json
    as_json(only: [:id, :url, :name, :email, :created_at])
  end

  private

    def downcase_email
      self.email.downcase! if email
    end

end
