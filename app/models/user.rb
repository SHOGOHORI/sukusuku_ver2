class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable
  validates :name, length: { maximum: 10 }
  validates :introduction, length: { maximum: 200 }
  has_many :children, dependent: :destroy, inverse_of: :user
  accepts_nested_attributes_for :children, allow_destroy: true
end
