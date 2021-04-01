class Work < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user
  acts_as_taggable_on :tags

  validates :title, presence: true
end
