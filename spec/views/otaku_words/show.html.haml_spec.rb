require 'rails_helper'

RSpec.describe "otaku_words/show", type: :view do
  before(:each) do
    @otaku_word = assign(:otaku_word, OtakuWord.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
