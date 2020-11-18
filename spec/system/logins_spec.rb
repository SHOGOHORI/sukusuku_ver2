require 'rails_helper'

RSpec.describe 'Logins', type: :system do
  scenario '有効なログイン、ログアウト' do
    user = create(:user)
    visit user_session_path
    fill_in 'メールアドレス', with: user.email
    fill_in 'パスワード', with: user.password
    check 'パスワードを記憶'
    click_button 'ログイン'
    expect(current_path).to eq user_path(user)
    visit current_path
    click_link 'ログアウト'
    expect(current_path).to eq root_path
    expect(page).to have_link 'ログイン', href: user_session_path
  end

  scenario '無効なログイン' do
    visit user_session_path
    fill_in 'メールアドレス', with: '  '
    fill_in 'パスワード', with: '  '
    click_button 'ログイン'
    expect(current_path).to eq user_session_path
    expect(page).to have_content '無効なメールアドレスとパスワードの組合わせです。'
    visit root_path
    expect(page).to_not have_content '無効なメールアドレスとパスワードの組合わせです。'
  end

  scenario '有効なメールアドレスと無効なパスワード' do
    user = create(:user)
    visit user_session_path
    fill_in 'メールアドレス', with: user.email
    fill_in 'パスワード', with: 'invalid'
    click_button 'ログイン'
    expect(current_path).to eq user_session_path
    expect(page).to have_content '無効なメールアドレスとパスワードの組合わせです。'
    visit root_path
    expect(page).to_not have_content '無効なメールアドレスとパスワードの組合わせです。'
  end
end
