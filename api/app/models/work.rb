class Work < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  acts_as_taggable_on :tags
end
