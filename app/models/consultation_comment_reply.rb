class ConsultationCommentReply < ApplicationRecord
  belongs_to :user
  belongs_to :consultation_comment
  mount_uploaders :image, ImageUploader
  validates :user_id, presence: true
  validates :consultation_comment_id, presence: true
  validates :content, presence: true, length: { maximum: 1000 }
end
