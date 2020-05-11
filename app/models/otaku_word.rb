class OtakuWord < ApplicationRecord
  has_many :category_and_otaku_word_relationships
  has_many :categorys, through: :category_and_otaku_word_relationships
end
