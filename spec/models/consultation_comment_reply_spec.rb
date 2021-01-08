require 'rails_helper'

RSpec.describe ConsultationCommentReply, type: :model do
  describe 'コメント返信' do
    let!(:user) { create(:user) }
    let!(:category) { create(:category) }
    let!(:consultation) do
      create(:consultation, category_id: category.id,
                            user_id: user.id)
    end
    let!(:consultation_comment) do
      create(:consultation_comment, consultation_id: consultation.id,
                                    user_id: user.id)
    end
    let(:consultation_comment_reply) do
      build(:consultation_comment_reply, content: content,
                                         consultation_comment_id: consultation_comment_id,
                                         user_id: user_id)
    end
    subject { consultation_comment_reply }
    context '有効なコメント返信' do
      let(:user_id) { user.id }
      let(:consultation_comment_id) { consultation_comment.id }
      let(:content) { '子供が泣き止みません' }
      it { is_expected.to be_valid }
    end

    context 'ユーザーID無し' do
      let(:user_id) { nil }
      let(:consultation_comment_id) { consultation_comment.id }
      let(:content) { '子供が泣き止みません' }
      it { is_expected.to_not be_valid }
    end

    context '相談ID無し' do
      let(:user_id) { user.id }
      let(:consultation_comment_id) { nil }
      let(:content) { '子供が泣き止みません' }
      it { is_expected.to_not be_valid }
    end

    context '本文無し' do
      let(:user_id) { user.id }
      let(:consultation_comment_id) { consultation_comment.id }
      let(:content) { nil }
      it { is_expected.to_not be_valid }
    end

    context '本文が長すぎる' do
      let(:user_id) { user.id }
      let(:consultation_comment_id) { consultation_comment.id }
      let(:content) { 'a' * 1001 }
      it { is_expected.to_not be_valid }
    end
  end
end
