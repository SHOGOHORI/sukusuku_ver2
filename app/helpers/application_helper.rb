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
    age += 12 if age.negative?
    moon_age = (Date.today.strftime('%m%d').to_i - birthday.strftime('%m%d').to_i) / 100
    moon_age += 12 if moon_age.negative?
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

  def select_pregnant(boolean)
    case boolean
    when 0
      'いいえ'
    when 1
      'はい'
    else
      '選択'
    end
  end

  def full_title(page_title = '')
    base_title = 'MC BATTLE CHANNEL'
    if page_title.empty?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end

  def full_url(path)
    domain = if Rails.env.development?
               'http://0.0.0.0:3000'
             else
               'https://mcbattle-ch.jp'
             end
    "#{domain}#{path}"
  end
end
