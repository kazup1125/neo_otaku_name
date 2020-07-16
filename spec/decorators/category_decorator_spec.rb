# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CategoryDecorator do
  let(:category) { Category.new.extend CategoryDecorator }
  subject { category.categories_badge }
  it 'categories_badgeメソッドを使うと、badge badge-secondaryを返す' do
    is_expected.to eq 'badge badge-secondary'
  end
end
