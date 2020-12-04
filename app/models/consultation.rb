class Consultation < ApplicationRecord
  belongs_to :user
  mount_uploaders :images, ImageUploader
  validates :title, presence: true
  validates :content, presence: true
  validates :user_id, presence: true
end
