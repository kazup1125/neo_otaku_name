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
    events.each do |event|
      case event
      when Line::Bot::Event::Message
        case event.type
        ## テキストが送られてきたときの挙動
        when Line::Bot::Event::MessageType::Text
          ## '変換'と送られてきたら、selection_templateを送る
          client.reply_message(event['replyToken'], LineBot.selection_template) if event.message['text'].eql?('変換')
          if event.message['text'].eql?('オタク用語から')
            client.reply_message(event['replyToken'], LineBot.text_only_message('オタク用語を入力してください'))
            ## ここでオタク用語のフラグを変数に入れる
            selection = SELECT_OTAKU
          elsif event.message['text'].eql?('標準語から')
            client.reply_message(event['replyToken'], LineBot.text_only_message('標準語を入力してください'))
            ## ここで標準語のフラグを変数に入れる
            selection = SELECT_STANDARD
          end
          ## 送られてきたテキストメッセージ
          text = event.message['text']
          ## 標準語とオタク用語を判別するフラグを渡し、テキストを変換し、contentに格納
          content = LineBot.converting(text, selection)
          ## contentを雛形に当てはめ、送信
          client.reply_message(event['replyToken'], LineBot.text_only_message(content))
        end
      end
    end
    head :ok
  end
end
