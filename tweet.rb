require 'date'
require 'twitter'
require 'dotenv/load'

# require "./src/Weather"
# require "./src/WeatherInfo"

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
    @text="test2"
    # 天気情報取得
    # weatherobj = Weather.new
    # info = weatherobj.doProcess()

    # # ツイート部分
    # @tweet = "今日、#{info.today()} 東京の天気です\n"
    # @tweet += "天気は#{info.todayTelop()}\n"
    # @tweet += "最高気温は【#{info.todayTempMax()}℃】\n"
    # @tweet += "最低気温は【#{info.todayTempMin()}℃】\n"
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