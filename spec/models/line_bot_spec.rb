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

  describe 'selection_templateメソッド' do
    template = LineBot.selection_template

    context 'selection_templateメソッドを呼び出した時' do
      it 'typeはtemplateである' do
        expect(template[:type]).to eq 'template'
      end
      it 'テンプレートのテキストは、"どちらから変換しますか？"' do
        expect(template[:template][:text]).to eq 'どちらから変換しますか？'
      end
    end

    context '選択肢の内容' do
      choices = template[:template][:actions]
      it 'labelの一つめは"オタク用語"と"標準語"' do
        expect(choices.first[:label]).to eq 'オタク用語'
        expect(choices.second[:label]).to eq '標準語'
      end
      it '"オタク用語"を選択すると送られるテキストは"オタク用語から"' do
        expect(choices.first[:text]).to eq 'オタク用語から'
      end
      it '"標準語"を選択すると送られるテキストは"標準語から"' do
        expect(choices.second[:text]).to eq '標準語から'
      end
    end
  end
end
