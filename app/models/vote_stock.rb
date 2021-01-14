class VoteStock < ApplicationRecord
  belongs_to :vote
  belongs_to :user
  validates_uniqueness_of :vote_id, scope: :user_id
  scope :recently, -> { order(created_at: :desc) }
end
