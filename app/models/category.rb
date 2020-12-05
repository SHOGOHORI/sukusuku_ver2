class Category < ApplicationRecord
  has_one :consultation
  validates :category, length: { maximum: 10 }

  ITEM = Category.all

end
