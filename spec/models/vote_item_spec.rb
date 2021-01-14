require 'rails_helper'

RSpec.describe VoteItem, type: :model do
  describe 'アンケート項目' do
    let!(:user) { create(:user) }
    let!(:category) { create(:category) }
    let!(:vote) do
      create(:vote, category_id: category.id,
                            user_id: user.id)
    end
    let(:vote_item) do
      build(:vote_item,  item: item,
                         item_number: item_number,
                         vote_id: vote_id)
    end
    subject { vote_item }
    context '有効なアンケート項目' do
      let(:item) { '項目１' }
      let(:item_number) { 1 }
      let(:vote_id) { vote.id }
      it { is_expected.to be_valid }
    end
  end
end
