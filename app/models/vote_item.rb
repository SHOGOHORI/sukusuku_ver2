class VoteItem < ApplicationRecord
  belongs_to :vote
  has_many :vote_relationships
  has_many :users, through: :vote_relationships
  validates :item, presence: true, length: { maximum: 30 }
  validates :item_number, presence: true
  accepts_nested_attributes_for :vote_relationships, allow_destroy: true
end
