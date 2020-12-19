class VoteItem < ApplicationRecord
  belongs_to :vote
  validates :item, presence: true, length: { maximum: 30 }
  validates :item_number, presence: true
  validates :vote_id, presence: true
end
