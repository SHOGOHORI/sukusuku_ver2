class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable
  has_many :consultations, dependent: :destroy
  has_many :children, dependent: :destroy
  has_many :consultation_comments, dependent: :destroy
  validates :name, length: { maximum: 10 }
  validates :introduction, length: { maximum: 200 }
  accepts_nested_attributes_for :children, allow_destroy: true
  mount_uploader :avatar, AvatarUploader
end
