class Vote < ApplicationRecord
  attr_accessor :age, :moon_age
  belongs_to :user
  belongs_to :category
  has_many :vote_items, dependent: :destroy
  mount_uploaders :image, ImageUploader
  validates :title, presence: true, length: { maximum: 30 }
  validates :content, presence: true, length: { maximum: 1000 }
  validates :user_id, presence: true
  validates :category_id, presence: true
  accepts_nested_attributes_for :vote_items, allow_destroy: true
  scope :recently, -> { order(created_at: :desc) }
end
