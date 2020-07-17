require 'rails_helper'

RSpec.describe LineBot, type: :model do
  describe 'convertingメソッド' do
    # factories/otaku_words.rb 内で定義したotaku_wordを生成
    before do
      create(:otaku_word)
    end

    context '単語が送られてきた時' do
      it '該当するオタク用語があったので、その値を返す' do
        text = 'word_1'
        expect(LineBot.converting(text)).to eq 'meaning_1'
      end
      it '該当するオタク用語があったので、その値を返す' do
        text = 'meaning_1'
        expect(LineBot.converting(text)).to eq 'word_1'
      end
      it '該当する単語がなかったので、"該当のオタク用語が見つかりませんでした。"と返す' do
        text = 'no_match'
        expect(LineBot.converting(text)).to eq '該当の単語が見つかりませんでした。'
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
