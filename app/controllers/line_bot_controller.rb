# frozen_string_literal: true

class LineBotController < ApplicationController
  require 'line/bot'
  protect_from_forgery except: [:callback]
  require_relative '../models/line_bot'

  def client
    @client ||= Line::Bot::Client.new do |config|
      config.channel_secret = ENV['LINE_CHANNEL_SECRET']
      config.channel_token = ENV['LINE_CHANNEL_TOKEN']
    end
  end

  def callback
    body = request.body.read

    signature = request.env['HTTP_X_LINE_SIGNATURE']
    head :bad_request unless client.validate_signature(body, signature)

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
          ## 送られてきた単語を変換し、送り返す
          content = LineBot.converting(received_text)
          client.reply_message(event['replyToken'], LineBot.text_only_message(content))
        end
      end
    end
    head :ok
  end
end
