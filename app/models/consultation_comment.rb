class ConsultationComment < ApplicationRecord
  belongs_to :user
  belongs_to :consultation
  mount_uploaders :image, ImageUploader
  validates :user_id, presence: true
  validates :consultation_id, presence: true
  validates :content, presence: true, length: { maximum: 1000 }
end
