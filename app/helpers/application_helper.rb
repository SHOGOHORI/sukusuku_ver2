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
    age = (Date.today.strftime('%Y%m%d').to_i - birthday.strftime('%Y%m%d').to_i)/10000
    moon_age = (Date.today.strftime('%m%d').to_i - birthday.strftime('%m%d').to_i)/100
    return "#{age}歳#{moon_age}ヶ月"
  end
end
