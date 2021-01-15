class Child < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :child_number, presence: true
  validates :nick_name, presence: true, length: { maximum: 10 }
  validates :birthday, presence: true
  validate :child_birthday
  validates :comment, length: { maximum: 200 }
  mount_uploader :avatar, AvatarUploader

  def child_birthday
    errors.add(:birthday, 'は3歳までのお子さん及び出産予定日を入力してください。') if
    birthday < Date.today.next_year || birthday > Date.today.ago(3.years)
  end
end
