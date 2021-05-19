# Seiichi Ariga <seiichi.ariga@gmail.com>

import httpclient, json
import common/utils

import common/private
# API Keyはcommon/private.nimからimport
let API_KEY = OPEN_WEATHER_API_KEY

proc httpGetWeather(): string =
  ## OpenWeather API からデータを取得
  ## Errorの場合""を返す
  
  let client = newHttpClient()
  let request = "http://api.openweathermap.org/data/2.5/weather?q=Tokyo&appid=" & API_KEY
  let res = try: client.getContent(request)
            except: ""
  return res

proc parseJsonWeather(data: string): string =
  ## OpenWeatherからのJSONを解析して天気だけ返す
  ## Open Weather Jsonサンプル
  #[
    {"coord":{"lon":139.6917,"lat":35.6895},"weather":[{"id":500,"main":"Rain","description":"light rain","icon":"10d"}],"base":"stations","main":{"temp":290.77,"feels_like":290.81,"temp_min":289.29,"temp_max":292.43,"pressure":1011,"humidity":85},"visibility":7000,"wind":{"speed":0.45,"deg":116,"gust":1.34},"rain":{"1h":0.12},"clouds":{"all":75},"dt":1621386365,"sys":{"type":2,"id":2001249,"country":"JP","sunrise":1621366416,"sunset":1621417322},"timezone":32400,"id":1850144,"name":"Tokyo","cod":200}
  ]#

  let jsonNode = parseJson(data)

  let weather =  jsonNode{"weather"}[0]{"main"}.getStr()
  return weather

proc parseJsonWeatherIcon(data: string): string =
  ## OpenWeatherの天気アイコンを返す
  ## 
  let jsonNode = parseJson(data)

  let icon = jsonNode{"weather"}[0]{"icon"}.getStr()
  return icon

proc getOpenWeatherData*() =
  let data = httpGetWeather()

  if data != "":
    echo parseJsonWeather(data)
    let filename = "openweather-" & timeString() & ".txt"
    echo "output file: ", filename
    try:
      writeFile(filename, data)
    except IOError:
      echo("IO error")
