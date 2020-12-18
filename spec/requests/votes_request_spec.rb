require 'rails_helper'

RSpec.describe "Votes", type: :request do

  describe "GET /new" do
    it "returns http success" do
      get "/votes/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/votes/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/votes/edit"
      expect(response).to have_http_status(:success)
    end
  end

end
