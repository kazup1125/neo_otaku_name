require 'rails_helper'

RSpec.describe "otaku_words/new", type: :view do
  before(:each) do
    assign(:otaku_word, OtakuWord.new())
  end

  it "renders new otaku_word form" do
    render

    assert_select "form[action=?][method=?]", otaku_words_path, "post" do
    end
  end
end
