require 'rails_helper'

RSpec.describe "otaku_words/index", type: :view do
  before(:each) do
    assign(:otaku_words, [
      OtakuWord.create!(),
      OtakuWord.create!()
    ])
  end

  it "renders a list of otaku_words" do
    render
  end
end
