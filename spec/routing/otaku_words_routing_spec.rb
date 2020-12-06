require "rails_helper"

RSpec.describe OtakuWordsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/otaku_words").to route_to("otaku_words#index")
    end

    it "routes to #new" do
      expect(get: "/otaku_words/new").to route_to("otaku_words#new")
    end

    it "routes to #show" do
      expect(get: "/otaku_words/1").to route_to("otaku_words#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/otaku_words/1/edit").to route_to("otaku_words#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/otaku_words").to route_to("otaku_words#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/otaku_words/1").to route_to("otaku_words#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/otaku_words/1").to route_to("otaku_words#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/otaku_words/1").to route_to("otaku_words#destroy", id: "1")
    end
  end
end
