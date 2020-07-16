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
      selection = SELECT_OTAKU
      it '該当するオタク用語があったので、その値を返す' do
        text = 'word_1'
        expect(LineBot.converting(text, selection)).to eq 'meaning_1'
      end
      it '該当するオタク用語がなかったので、"該当のオタク用語が見つかりませんでした。"と返す' do
        text = 'no_word'
        expect(LineBot.converting(text, selection)).to eq '該当のオタク用語が見つかりませんでした。'
      end
    end

    context '標準語のフラグが渡ってきた場合' do
      selection = SELECT_STANDARD
      it '該当する標準語があったので、その値を返す' do
        text = 'meaning_1'
        expect(LineBot.converting(text, selection)).to eq 'word_1'
      end
      it '該当する標準語がなかったので、"該当の標準語が見つかりませんでした"と返す' do
        text = 'no_word'
        expect(LineBot.converting(text, selection)).to eq '該当の標準語が見つかりませんでした。'
      end
    end
  end

  describe 'text_only_messageメソッド' do
    context '引数に"こんにちは"を渡した時' do
      message = LineBot.text_only_message('こんにちは')
      it 'typeは"text"が入っている' do
        expect(message[:type]).to eq 'text'
      end
      it 'textには"こんにちは"が入っている' do
        expect(message[:text]).to eq 'こんにちは'
      end
    end
  end
end
