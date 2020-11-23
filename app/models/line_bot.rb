# frozen_string_literal: true

class LineBot
  include ActiveModel::Model

  ## オタク用語→標準語に変換する。
  def self.converting_otaku(text)
    if OtakuWord.pluck(:word).any?(text)
      OtakuWord.find_by(word: text).meaning
    else
      ## マッチする単語がなかった場合に返すテキスト
      '該当のオタク用語が見つかりませんでした。'
    end
  end

  ## 標準語→オタク用語に変換する。
  def self.converting_standard(text)
    if OtakuWord.pluck(:meaning).any?(text)
      OtakuWord.find_by(meaning: text).word
    else
      ## マッチする単語がなかった場合に返すテキスト
      '該当の標準語が見つかりませんでした。'
    end
  end

  def self.converting(text)
    if OtakuWord.pluck(:meaning).include?(text)
      OtakuWord.find_by(meaning: text).word
    elsif OtakuWord.pluck(:word).include?(text)
      OtakuWord.find_by(word: text).meaning
    else
      '該当の単語が見つかりませんでした。'
    end
  end

  ## リプライメッセージ(JSON)の雛形
  def self.text_only_message(content)
    {
      type: 'text',
      text: content.to_s
    }
  end
end
