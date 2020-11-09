class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable
  validates :introduction, length: { maximum: 200 }
  has_many :children, dependent: :destroy
  accepts_nested_attributes_for :children
end
