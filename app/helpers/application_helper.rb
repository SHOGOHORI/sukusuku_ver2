module ApplicationHelper
  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def age_and_moon_age(birthday)
    age = (Date.today.strftime('%Y%m%d').to_i - birthday.strftime('%Y%m%d').to_i) / 10_000
    age += 12 if age < 0
    moon_age = (Date.today.strftime('%m%d').to_i - birthday.strftime('%m%d').to_i) / 100
    moon_age += 12 if moon_age < 0
    if birthday < Date.today
      "#{age}歳#{moon_age}ヶ月"
    else
      'お腹の中にいます'
    end
  end

  def child_birthday(birthday)
    if birthday < Date.today
      "#{birthday}生まれ"
    else
      "予定日まであと#{(birthday - Date.today).to_i}日"
    end
  end
end
