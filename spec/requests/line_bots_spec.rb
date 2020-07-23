require 'rails_helper'

RSpec.describe "LineBots", type: :request do
  describe "POST /callback" do
    it '200が返ってくる' do
      post callback_path
      expect(response).to have_http_status(200)
    end
    it '400が返ってくる' do
      post callback_path
      expect(response).to have_http_status(400)
    end
  end
end
