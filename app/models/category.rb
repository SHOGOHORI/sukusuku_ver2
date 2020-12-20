class Category < ApplicationRecord
  has_one :consultation
  has_one :vote
  validates :category, length: { maximum: 10 }
end
