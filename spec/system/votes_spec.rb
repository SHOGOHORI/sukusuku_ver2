require 'rails_helper'

RSpec.describe "Votes", type: :system do
  scenario '有効なアンケート投稿' do
    user = create(:user)
    visit user_session_path
    fill_in 'メールアドレス', with: user.email
    fill_in 'パスワード', with: user.password
    check 'パスワードを記憶'
    click_button 'ログイン'
    expect(current_path).to eq user_path(user)
    visit current_path
    click_link 'アンケート'
    expect(current_path).to eq new_vote_path
    fill_in 'タイトル', with: 'テスト'
    fill_in 'タイトル', with: 'テスト'
  end
end
