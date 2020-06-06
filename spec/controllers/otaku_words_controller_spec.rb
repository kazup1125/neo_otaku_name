require 'rails_helper'

RSpec.describe OtakuWordsController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    before do
      @otaku_word = create(:otaku_word)
    end
    it "returns http success" do
      get :show, params: { id: @otaku_word.id }
      expect(response).to have_http_status(:success)
    end
  end
end
