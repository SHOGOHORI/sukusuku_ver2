class Consultation < ApplicationRecord
  belongs_to :user
  mount_uploaders :images, ImageUploader
  validates :title, presence: true, length: { maximum: 10 }
  validates :content, presence: true, length: { maximum: 1000 }
  validates :user_id, presence: true
end
