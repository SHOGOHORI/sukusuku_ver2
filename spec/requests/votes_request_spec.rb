require 'rails_helper'

RSpec.describe 'Votes', type: :request do
  let!(:user) { create(:user) }
  let!(:vote) { create(:vote) }
  describe 'GET /new' do
    it 'returns http success' do
      sign_in user
      get '/votes/new'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      sign_in user
      get '/votes/show'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /edit' do
    it 'returns http success' do
      get '/votes/edit'
      expect(response).to have_http_status(:success)
    end
  end
end