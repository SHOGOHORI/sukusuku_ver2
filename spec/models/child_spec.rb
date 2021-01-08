require 'rails_helper'

RSpec.describe Child, type: :model do
  let!(:user) { create(:user) }

  it '有効な子どもの情報' do
    expect(build(:child, user_id: user.id)).to be_valid
  end
end
