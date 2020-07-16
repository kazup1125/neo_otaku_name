class LineBot
  include ActiveModel::Model

  SELECT_OTAKU = 0
  SELECT_STANDARD = 1

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

  def self.converting(text, select)
    if select == SELECT_STANDARD
      self.converting_standard(text)
    else
      self.converting_otaku(text)
    end
  end
  
  ## リプライメッセージ(JSON)の雛形
  def self.text_only_message(content)
    {
      type: "text",
      text: "#{content}"
    }
  end

  def self.selection_template
    {
      "type": "template",
      "altText": "this is a confirm template",
      "template": {
        "type": "confirm",
        "text": "どちらから変換しますか？",
        "actions": [
          {
            "type": "message",
            # Botから送られてきたメッセージに表示される文字列です。
            "label": "オタク用語",
            # ボタンを押した時にBotに送られる文字列です。
            "text": "オタク用語から"
          },
          {
            "type": "message",
            "label": "標準語",
            "text": "標準語から"
          }
        ]
      }
    }
  end
end