require 'rails_helper'

RSpec.describe "otaku_words/edit", type: :view do
  before(:each) do
    @otaku_word = assign(:otaku_word, OtakuWord.create!())
  end

  it "renders the edit otaku_word form" do
    render

    assert_select "form[action=?][method=?]", otaku_word_path(@otaku_word), "post" do
    end
  end
end
