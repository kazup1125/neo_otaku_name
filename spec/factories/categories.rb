FactoryBot.define do
  factory :category do
    sequence(:category) { |n| "Category_#{n}" }
  end
end
