class Category < ApplicationRecord
  has_one :consultation
  validates :category, length: { maximum: 10 }

  ITEM = [ ['教育',1], ['健康',2], ['食事',3], ['安全',4] ]

end
