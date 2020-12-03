class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable
  validates :name, length: { maximum: 10 }
  validates :introduction, length: { maximum: 200 }
  has_many :children, dependent: :destroy, inverse_of: :user
  accepts_nested_attributes_for :children, reject_if: :all_blank, allow_destroy: true
  mount_uploader :avatar, AvatarUploader
  has_many :microposts
end
