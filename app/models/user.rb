class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable
  has_many :consultations, dependent: :destroy
  has_many :children, dependent: :destroy
  has_many :consultation_comments, dependent: :destroy
  has_many :consultation_comment_replies, dependent: :destroy
  has_many :votes, dependent: :destroy
  has_many :vote_relationships
  has_many :vote_items, through: :vote_relationships
  has_many :consultation_stocks, dependent: :destroy
  has_many :stocked_consultations, through: :consultation_stocks, source: :consultation
  has_many :vote_stocks, dependent: :destroy
  has_many :stocked_votes, through: :vote_stocks, source: :vote
  validates :name, length: { maximum: 10 }
  validates :introduction, length: { maximum: 100 }
  accepts_nested_attributes_for :children, allow_destroy: true
  mount_uploader :avatar, AvatarUploader

  def already_liked_consultation?(consultation)
    consultation_stocks.exists?(consultation_id: consultation.id)
  end

  def already_liked_vote?(vote)
    vote_stocks.exists?(vote_id: vote.id)
  end
end
