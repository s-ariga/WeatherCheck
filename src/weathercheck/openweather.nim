# Seiichi Ariga <seiichi.ariga@gmail.com>

import httpclient
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

proc getOpenWeatherData*() =
  let data = httpGetWeather()

  if data != "":
    let filename = "openweather-" & timeString() & ".txt"
    echo "output file: ", filename
    try:
      writeFile(filename, data)
    except IOError:
      echo("IO error")
