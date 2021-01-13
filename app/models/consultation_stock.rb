class ConsultationStock < ApplicationRecord
  belongs_to :consultation
  belongs_to :user
  validates_uniqueness_of :consultation_id, scope: :user_id
  scope :recently, -> { order(created_at: :desc) }
end
