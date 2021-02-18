require 'date'
require 'twitter'
require 'dotenv/load'

class Tweet  
  def initialize
    # 投稿内容の初期化
    @text = ""
    # クライアントの生成
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = "O4BM7HR45NQQrQ632Nsd4vRDB"
      config.consumer_secret     = "Yxzlxr1MYsLWsJGWEcoEVXwuO5aJr79i9q2MiAJPktDkubanIP"
      config.access_token        = "1342345802253885441-NfGtwXeUhjaZdRFEvYFoRL6eduJO5l"
      config.access_token_secret = "wnsVKDWmHHMuUnbd9pX9YRPwKnhCjMaNuOngqvieKFvyw"
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