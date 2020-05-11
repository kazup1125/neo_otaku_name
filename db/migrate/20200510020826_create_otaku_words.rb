class CreateOtakuWords < ActiveRecord::Migration[6.0]
  def change
    create_table :otaku_words do |t|
      t.string :word
      t.string :meaning

      t.timestamps
    end
  end
end
