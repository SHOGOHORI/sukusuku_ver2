class Consultation < ApplicationRecord
  belongs_to :user
  belongs_to :category
  mount_uploaders :image, ImageUploader
  validates :title, presence: true, length: { maximum: 30 }
  validates :content, presence: true, length: { maximum: 1000 }
  validates :user_id, presence: true
  validates :category_id, presence: true
end
