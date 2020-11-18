require 'rails_helper'

RSpec.describe 'UserEdits', type: :system do
  scenario '有効な編集' do
    user = create(:user)
    log_in_as(user)
    visit edit_user_registration_path(user)
    fill_in 'お名前', with: 'テスト'
    fill_in '自己紹介', with: 'テスト'
    fill_in 'メールアドレス', with: 'foo@invalid'
    click_button '更新する'
    expect(current_path).to eq user_path(user)
  end
end
