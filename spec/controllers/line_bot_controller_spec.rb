require 'rails_helper'

RSpec.describe LineBotController, type: :controller do
  describe 'POST #callback' do
    it '200が返ってくる' do
      post callback_path
    end
  end
end
