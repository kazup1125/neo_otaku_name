class LineBotController < ApplicationController
  require 'line/bot'
  protect_from_forgery :except => [:callback]
  require_relative '../models/line_bot'

  def client
    @client ||= Line::Bot::Client.new { |config|
      config.channel_secret = ENV["LINE_CHANNEL_SECRET"]
      config.channel_token = ENV["LINE_CHANNEL_TOKEN"]
    }
  end

  def callback
    body = request.body.read
    line_bot = LineBot.new

    signature = request.env['HTTP_X_LINE_SIGNATURE']
    unless client.validate_signature(body, signature)
      head :bad_request
    end

    ## ここでevents内にJSONオブジェクトが入る
    events = client.parse_events_from(body)

    events.each do |event|
      case event
      when Line::Bot::Event::Message
        case event.type
        when Line::Bot::Event::MessageType::Text
          ## 送られてきたテキストメッセージ
          text = event.message['text']
          ## テキストをここで標準語に変換し、contentに格納
          content = line_bot.converting_otaku(text)
          ## contentを雛形に当てはめ、送信
          client.reply_message(event['replyToken'], line_bot.messages_template(content))
        end
      end
    end
    head :ok
  end
end
