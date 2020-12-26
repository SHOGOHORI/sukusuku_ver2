class VoteComment < ApplicationRecord
  belongs_to :user
  belongs_to :vote
  validates :user_id, presence: true
  validates :vote_id, presence: true
  validates :content, presence: true, length: { maximum: 500 }
  scope :recently, -> { order(created_at: :desc) }
end
