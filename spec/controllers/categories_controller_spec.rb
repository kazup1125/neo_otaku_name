require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    before do
      @category = Category.create(
        category: 'String'
        )
    end
    it "returns http success" do
      get :show, params: { id: @category.id }
      expect(response).to have_http_status(:success)
    end
  end
end
