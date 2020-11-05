require 'rails_helper'

RSpec.describe "SignUps", type: :system do
  context '有効なユーザー登録' do
    before do
      visit new_user_registration_path
      fill_in 'メールアドレス', with: 'testuser@example.com'
      fill_in 'パスワード', with: 'Aaaaaaaa1?'
      fill_in 'パスワード(確認)', with: 'Aaaaaaaa1?'
      click_button '同意して登録する'
    end
    it '登録成功' do
      expect(page) have_selector '.notice', text: 'アカウント登録を受け付けました'
    end
  end
end
