class OtakuWord < ApplicationRecord
  has_many :category_and_otaku_word_relationships
  has_many :categorys, through: :category_and_otaku_word_relationships, dependent: :destroy

  accepts_nested_attributes_for :category_and_otaku_word_relationships, allow_destroy: true
end
