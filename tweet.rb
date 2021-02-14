require 'date'
require 'twitter'
require 'dotenv/load'

class tweet
  
  def initialize
    # 投稿内容の初期化
    @text = ""
    # クライアントの生成
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['CONSUMER_KEY']
      config.consumer_secret     = ENV['CONSUMER_SECRET']
      config.access_token        = ENV['ACCESS_TOKEN']
      config.access_token_secret = ENV['ACCESS_TOKEN_SECRET']
    end
  end

  # Tweetの投稿処理呼び出し
  def send_tweet
    create_text
    update
  end

  # ツイート本文の生成
  def create_text
    # 投稿内容を設定
    @text = "test" 
    end
  end

  private

  # Tweet投稿処理
  def update
    begin 
      @client.update(@text)
    rescue => e
      p e # エラー時はログを出力
    end
  end
end

# ツイートを実行
if __FILE__ == $0
  Tweet.new.send_tweet
end