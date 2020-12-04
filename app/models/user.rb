class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable
  has_many :consultations, dependent: :destroy
  has_many :children, dependent: :destroy, inverse_of: :user
  validates :name, length: { maximum: 10 }
  validates :introduction, length: { maximum: 200 }
  accepts_nested_attributes_for :children, reject_if: :all_blank, allow_destroy: true
  mount_uploader :avatar, AvatarUploader
end
