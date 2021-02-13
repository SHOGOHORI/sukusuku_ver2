class Child < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :child_number, presence: true
  validates :nick_name, presence: true, length: { maximum: 10 }
  validates :birthday, presence: true
  validate :child_birthday
  validates :comment, length: { maximum: 200 }
  mount_uploader :avatar, AvatarUploader

  MAX_AGE = 6

  def child_birthday
    errors.add(:birthday, "は#{MAX_AGE}歳までのお子さん及び出産予定日を入力してください。") if
    birthday.nil? || birthday > Date.today.next_year || birthday < Date.today.ago(MAX_AGE.years)
  end
end
