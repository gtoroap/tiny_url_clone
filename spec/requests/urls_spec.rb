require 'rails_helper'

RSpec.describe "Urls", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/urls"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/urls/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /create" do
    it "returns http success" do
      post "/urls", :params => { :url => {:original => 'https://url.com' } }
      expect(response).to have_http_status(:redirect)
    end
  end

  describe "GET /details" do
    it "returns http success" do
      get "/:slug/details"
      expect(response).to have_http_status(:success)
    end
  end
end
