class ChageDataMeaningToOtakuWords < ActiveRecord::Migration[6.0]
  def change
    change_column :otaku_words, :meaning, :text
  end
end
