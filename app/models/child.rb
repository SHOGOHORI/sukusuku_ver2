class Child < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :nick_name, presence: true, length: { maximum: 10 }
end
