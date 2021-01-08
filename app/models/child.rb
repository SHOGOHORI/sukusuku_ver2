class Child < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :child_number, presence: true
  validates :nick_name, presence: true, length: { maximum: 10 }
  validates :birthday, presence: true
  validates :comment, length: { maximum: 200 }
  mount_uploader :avatar, AvatarUploader
end
