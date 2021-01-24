class Vote < ApplicationRecord
  attr_accessor :age, :moon_age, :days

  belongs_to :user
  belongs_to :category
  has_many :vote_items, dependent: :destroy
  has_many :vote_comments, dependent: :destroy
  has_many :vote_stocks, dependent: :destroy
  has_many :stocked_users, through: :votes_stocks, source: :user
  mount_uploaders :image, ImageUploader
  validates :title, presence: true, length: { maximum: 30 }
  validates :content, presence: true, length: { maximum: 1000 }
  validates :user_id, presence: true
  validates :category_id, presence: true
  validates :closed_at, presence: true
  validates :days, presence: true
  accepts_nested_attributes_for :vote_items, allow_destroy: true
  scope :recently, -> { order(updated_at: :desc) }
  is_impressionable counter_cache: true
end
