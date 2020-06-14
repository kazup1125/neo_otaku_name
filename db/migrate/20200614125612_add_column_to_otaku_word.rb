class AddColumnToOtakuWord < ActiveRecord::Migration[6.0]
  def change
    add_column :otaku_words, :description, :text
    change_column :otaku_words, :meaning, :string
  end
end
