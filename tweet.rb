require 'date'
require 'twitter'
require 'dotenv/load'

require "./src/Weather"
require "./src/WeatherInfo"

class Tweet  
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
    # 天気情報取得
    weatherobj = Weather.new
    info = weatherobj.doProcess()

    # ツイート部分
    @text = "みなさんおはようございます！\n時刻は7時30分！\n"
    @text += "今日のお空はどんな空～❓\n大空お天気の時間です✨\n"
    @text += "今日の都心部は#{info.todayTelop()}、最高気温は#{info.todayTempMax()}℃です！\n"
    @text += "それでは通勤・通学気をつけて、行ってらっしゃ～い！"
  end

  private

  # Tweet投稿処理
  def update
    begin
      images = []

      range = 0..22
      range.each{|i|    
        images << File.new("./images/otenki#{i}.jpg")
      }
      @client.update_with_media(@text,images.sample)
    rescue => e
      p e # エラー時はログを出力
    end
  end
end

# ツイートを実行
if __FILE__ == $0
  Tweet.new.send_tweet
end