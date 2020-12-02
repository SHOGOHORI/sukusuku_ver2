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
    age = (Date.today.strftime('%Y%m%d').to_i - birthday.strftime('%Y%m%d').to_i) / 10000
    moon_age = (Date.today.strftime('%m%d').to_i - birthday.strftime('%m%d').to_i) / 100
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
      "生まれるまで後#{(birthday - Date.today).to_i}日"
    end
  end
end
