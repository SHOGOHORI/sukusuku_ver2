class ConsultationComment < ApplicationRecord
  belongs_to :user
  belongs_to :consultation
  has_many :consultation_comment_replies, dependent: :destroy
  mount_uploaders :image, ImageUploader
  validates :user_id, presence: true
  validates :consultation_id, presence: true
  validates :content, presence: true, length: { maximum: 500 }
  scope :recently, -> { order(created_at: :desc) }
end
