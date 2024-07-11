require 'rails_helper'

RSpec.describe "Spyfalls", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/spyfall/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/spyfall/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/spyfall/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/spyfall/create"
      expect(response).to have_http_status(:success)
    end
  end

end
