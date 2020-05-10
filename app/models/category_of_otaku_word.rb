class CategoryOfOtakuWord < ApplicationRecord
  belongs_to :word
  belongs_to :category
end
