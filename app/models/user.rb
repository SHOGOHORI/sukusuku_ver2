class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable
  validates :introduction, length: { maximum: 200 }
  has_many :children, dependent: :destroy
  accepts_nested_attributes_for :children
end
