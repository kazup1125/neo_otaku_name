require 'rails_helper'

RSpec.describe LineBot, type: :model do
  describe 'convertingメソッド' do

    # factories/otaku_words.rb 内で定義したotaku_wordを生成
    before do
      create(:otaku_word)
    end

    # オタク用語と標準語のフラグを用意
    SELECT_OTAKU = 0
    SELECT_STANDARD = 1

    context 'オタク用語のフラグが渡ってきた場合' do
      it '該当するオタク用語があったので、その値を返す' do
        text = 'word_1'
        selection = SELECT_OTAKU
        expect(LineBot.converting(text, selection)).to eq 'meaning_1'
      end
      it '該当するオタク用語がなかったので、"該当のオタク用語が見つかりませんでした。"と返す' do
        text = 'no_word'
        selection = SELECT_OTAKU
        expect(LineBot.converting(text, selection)).to eq '該当のオタク用語が見つかりませんでした。'
      end
    end

    context '標準語のフラグが渡ってきた場合' do
      it '該当する標準語があったので、その値を返す' do
        text = 'meaning_1'
        selection = SELECT_STANDARD
        expect(LineBot.converting(text, selection)).to eq 'word_1'
      end
      it '該当する標準語がなかったので、"該当の標準語が見つかりませんでした"と返す' do
        text = 'no_word'
        selection = SELECT_STANDARD
        expect(LineBot.converting(text, selection)).to eq '該当の標準語が見つかりませんでした。'
      end
    end
  end
end
