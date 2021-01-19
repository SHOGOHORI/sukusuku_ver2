class Category < ApplicationRecord
  has_one :consultation
  has_one :vote
  validates :category, presence: true, length: { maximum: 10 }, uniqueness: true
  mount_uploader :icon, IconUploader
end
