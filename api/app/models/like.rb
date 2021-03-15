class Like < ApplicationRecord
  belongs_to :user
  belongs_to :work
  # 1つの投稿につき1人のユーザーが1つしかいいねできない
  # works_idとuser_idの組み合わせが1組しか存在しない
  validates :work_id, uniqueness: { scope: :user_id }
  scope :filter_by_work, -> (work_id) { where(work_id: work_id) if work_id}
end
