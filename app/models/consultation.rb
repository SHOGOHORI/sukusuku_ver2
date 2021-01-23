class Consultation < ApplicationRecord
  attr_accessor :age, :moon_age

  belongs_to :user
  belongs_to :category
  has_many :consultation_comments, dependent: :destroy
  has_many :consultation_stocks, dependent: :destroy
  has_many :stocked_users, through: :consultation_stocks, source: :user
  mount_uploaders :image, ImageUploader
  validates :title, presence: true, length: { maximum: 30 }
  validates :content, presence: true, length: { maximum: 1000 }
  validates :user_id, presence: true
  validates :category_id, presence: true
  scope :recently, -> { order(created_at: :desc) }
  is_impressionable counter_cache: true
end
