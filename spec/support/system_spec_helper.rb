module SystemSpecHelper
  def log_in_as(user)
    visit user_session_path
    fill_in 'メールアドレス', with: user.email
    fill_in 'パスワード', with: user.password
    check 'パスワードを記憶'
    click_button 'ログイン'
  end
end
