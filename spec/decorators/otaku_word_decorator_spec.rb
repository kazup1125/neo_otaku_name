# frozen_string_literal: true

require 'rails_helper'

RSpec.describe OtakuWordDecorator do
  let(:otaku_word) { OtakuWord.new.extend OtakuWordDecorator }
  subject { otaku_word }
  it { should be_a OtakuWord }
end
