# frozen_string_literal: true

FactoryBot.define do
  factory :category do
    sequence(:name) { |n| "Category_#{n}" }
    sequence(:description) { 'String' }
  end
end
