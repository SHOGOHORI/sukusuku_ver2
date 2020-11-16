require 'rails_helper'

RSpec.describe User, type: :model do
  it '有効なユーザー' do
    expect(build(:user)).to be_valid
  end

  describe 'メールアドレスのバリデーション' do
    let(:user) { build(:user, email: email) }
    subject { user }
    context 'ブランクの場合無効' do
      let(:email) { '       ' }
      it { is_expected.to_not be_valid }
    end
  end

  describe 'メールアドレスの一意性' do
    let!(:user) { create(:user, email: 'user@example.com') }
    it '重複しているメールアドレスは無効' do
      user = build(:user, email: 'user@example.com')
      expect(user).to_not be_valid
    end
  end

  describe 'メールアドレスを小文字で保存する' do
    let!(:user) { create(:user, email: 'ORIGINAL@EXAMPLE.COM') }
    it 'メールアドレスを小文字で保存する' do
      mixed_case_email = user.email
      expect(user.reload.email).to eq mixed_case_email.downcase
    end
  end

  describe 'パスワード' do
    let(:user) do
      build(:user, password: password,
                   password_confirmation: password_confirmation)
    end
    subject { user }

    context 'ブランクの場合無効' do
      let(:password) { ' ' * 10 }
      let(:password_confirmation) { ' ' * 10 }
      it { is_expected.to_not be_valid }
    end

    context '短すぎる場合無効' do
      let(:password) { 'a' * 5 }
      let(:password_confirmation) { 'a' * 5 }
      it { is_expected.to_not be_valid }
    end

    context 'パスワードが一致しない' do
      let(:password) { 'a' * 6 }
      let(:password_confirmation) { 'b' * 6 }
      it { is_expected.to_not be_valid }
    end
  end
end
