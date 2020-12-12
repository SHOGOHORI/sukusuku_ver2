require 'rails_helper'

RSpec.describe ConsultationComment, type: :model do
  describe '相談コメント' do
    let!(:user) { create(:user) }
    let!(:category) { create(:category) }
    let!(:consultation) do
      create(:consultation, title: 'title',
                            content: 'content',
                            category_id: category.id,
                            user_id: user.id)
    end
    let(:consultation_comment) do
      build(:consultation_comment, content: content,
                                   consultation_id: consultation_id,
                                   user_id: user_id)
    end
    subject { consultation_comment }
    context '有効なコメント' do
      let(:user_id) { user.id }
      let(:consultation_id) { consultation.id }
      let(:content) { '子供が泣き止みません' }
      it { is_expected.to be_valid }
    end

    context 'ユーザーID無し' do
      let(:user_id) { nil }
      let(:consultation_id) { consultation.id }
      let(:content) { '子供が泣き止みません' }
      it { is_expected.to_not be_valid }
    end

    context '相談ID無し' do
      let(:user_id) { user.id }
      let(:consultation_id) { nil }
      let(:content) { '子供が泣き止みません' }
      it { is_expected.to_not be_valid }
    end

    context '本文無し' do
      let(:user_id) { user.id }
      let(:consultation_id) { consultation.id }
      let(:content) { nil }
      it { is_expected.to_not be_valid }
    end

    context '本文が長すぎる' do
      let(:user_id) { user.id }
      let(:consultation_id) { consultation.id }
      let(:content) { 'a' * 501 }
      it { is_expected.to_not be_valid }
    end
  end
end
