# データオブジェクトクラス
class WeatherInfo
  attr_accessor :description,
  :todayTelop,
  :today,
  :todayTempMin,
  :todayTempMax,

  # コンストラクタ
  def initialize()
  end

  # 本日テロップ
  def todayTelop()
    @todayTelop
  end

  # 本日テロップ
  def todayTelop=(value)
    @todayTelop = value
  end
  
  # 本日最高気温
  def todayTempMax()
    @todayTempMax
  end

  # 本日最高気温
  def todayTempMax=(value)
    @todayTempMax = value
  end

  # 本日最低気温
  def todayTempMin()
    @todayTempMin
  end

  # 本日最低気温
  def todayTempMin=(value)
    @todayTempMin = value
  end

end