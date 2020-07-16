class LineBotController < ApplicationController
  require 'line/bot'
  protect_from_forgery :except => [:callback]
  require_relative '../models/line_bot'

  ## LineBotモデルで宣言した定数を呼び出し
  SELECT_OTAKU = LineBot::SELECT_OTAKU
  SELECT_STANDARD = LineBot::SELECT_STANDARD

  def client
    @client ||= Line::Bot::Client.new { |config|
      config.channel_secret = ENV["LINE_CHANNEL_SECRET"]
      config.channel_token = ENV["LINE_CHANNEL_TOKEN"]
    }
  end

  def callback
    body = request.body.read

    signature = request.env['HTTP_X_LINE_SIGNATURE']
    unless client.validate_signature(body, signature)
      head :bad_request
    end

    ## ここでevents内にJSONオブジェクトが入る
    events = client.parse_events_from(body)

    ## ここにLINEで送られてきたイベントを検出する
    events.each do |event|
      ## 受信したテキスト
      received_text = event.message['text']

      case event
      when Line::Bot::Event::Message
        case event.type
        ## テキストが送られてきたときの挙動
        when Line::Bot::Event::MessageType::Text
          ## contentを雛形に当てはめ、送信
          if OtakuWord.pluck(:meaning).include?(received_text)
            content = OtakuWord.find_by(meaning: received_text).word
          elsif OtakuWord.pluck(:word).include?(received_text)
            content = OtakuWord.find_by(word: received_text).meaning
          else
            content = '該当の単語が見つかりませんでした'
          end
          client.reply_message(event['replyToken'], LineBot.text_only_message(content))
        end
      end
    end
    head :ok
  end
end
