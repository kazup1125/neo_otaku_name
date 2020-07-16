require 'rails_helper'

RSpec.describe OtakuWordsController, type: :controller do

  describe "一覧画面" do
    it "http successが帰ってくる" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "詳細画面" do
    before do
      @otaku_word = create(:otaku_word)
    end
    it "http successが帰ってくる" do
      get :show, params: { id: @otaku_word.id }
      expect(response).to have_http_status(:success)
    end
  end
end
