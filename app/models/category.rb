class Category < ApplicationRecord
  validates :category, length: { maximum: 10 }
end
