# frozen_string_literal: true

class CategoryAndOtakuWordRelationship < ApplicationRecord
  belongs_to :otaku_word
  belongs_to :category
end
