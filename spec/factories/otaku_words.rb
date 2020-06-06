FactoryBot.define do
  factory :otaku_word do
    sequence(:word) { |n| "word_no.#{n}"}
    sequence(:meaning) { 'String' }
  end
end
