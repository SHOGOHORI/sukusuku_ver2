require 'rails_helper'

RSpec.describe Consultation, type: :model do
  describe '相談' do
    let!(:user) { create(:user) }
    let!(:category) { create(:category) }
    let(:consultation) do
      build(:consultation, title: title,
                           content: content,
                           category_id: category_id,
                           user_id: user_id)
    end
    subject { consultation }
    context '有効な相談' do
      let(:user_id) { user.id }
      let(:category_id) { category.id }
      let(:title) { '困っています' }
      let(:content) { '子供が泣き止みません' }
      it { is_expected.to be_valid }
    end

    context 'ユーザーID無し' do
      let(:user_id) { nil }
      let(:category_id) { category.id }
      let(:title) { '困っています' }
      let(:content) { '子供が泣き止みません' }
      it { is_expected.to_not be_valid }
    end

    context 'content無し' do
      let(:user_id) { user.id }
      let(:category_id) { category.id }
      let(:title) { '困っています' }
      let(:content) { '  ' }
      it { is_expected.to_not be_valid }
    end

    context 'title無し' do
      let(:user_id) { user.id }
      let(:category_id) { category.id }
      let(:title) { '   ' }
      let(:content) { '子供が泣き止みません' }
      it { is_expected.to_not be_valid }
    end

    context 'category無し' do
      let(:user_id) { user.id }
      let(:category_id) { nil }
      let(:title) { '困っています' }
      let(:content) { '子供が泣き止みません' }
      it { is_expected.to_not be_valid }
    end

    context 'titleが長すぎる' do
      let(:user_id) { user.id }
      let(:category_id) { category.id }
      let(:title) { 'a' * 301 }
      let(:content) { '子供が泣き止みません' }
      it { is_expected.to_not be_valid }
    end
  end
end
