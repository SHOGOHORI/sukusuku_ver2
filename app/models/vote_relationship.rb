class VoteRelationship < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :vote_item, optional: true
  has_many :vote_relationships, dependent: :destroy
  validates :user_id, presence: true
  validates :vote_item_id, presence: true
  validates_uniqueness_of :vote_item_id, scope: :user_id
end
