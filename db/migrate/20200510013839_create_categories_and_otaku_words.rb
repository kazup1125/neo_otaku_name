class CreateCategoriesAndOtakuWords < ActiveRecord::Migration[6.0]
  def change
    create_table :categories_and_otaku_words do |t|
      t.references :otaku_word, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
