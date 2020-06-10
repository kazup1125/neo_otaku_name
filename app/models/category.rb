class Category < ApplicationRecord
  has_many :category_and_otaku_word_relationships
  has_many :otaku_words, through: :category_and_otaku_word_relationships, dependent: :destroy
end
