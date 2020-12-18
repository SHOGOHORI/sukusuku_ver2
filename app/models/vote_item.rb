class VoteItem < ApplicationRecord
  belongs_to :vote
  validates :item, presence: true, length: { maximum: 30 }
  validates :vote_id, presence: true
end
