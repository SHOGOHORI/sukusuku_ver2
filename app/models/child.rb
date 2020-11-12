class Child < ApplicationRecord
  belongs_to :user, optional: true
  validates :user_id, presence: true
  validates :child_number, presence: true
  validates :nick_name, presence: true, length: { maximum: 10 }
  validates :brithday, presence: true
end
