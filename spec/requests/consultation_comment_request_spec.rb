require 'rails_helper'

RSpec.describe 'ConsultationComments', type: :request do
  describe 'GET /new' do
    it 'returns http success' do
      get '/consultation_comment/new'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /create' do
    it 'returns http success' do
      get '/consultation_comment/create'
      expect(response).to have_http_status(:success)
    end
  end
end
