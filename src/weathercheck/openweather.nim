# Seiichi Ariga <seiichi.ariga@gmail.com>

import httpclient
import common/utils

import common/private
# API Keyはcommon/private.nimからimport
let API_KEY = OPEN_WEATHER_API_KEY

proc httpGetWeather(): string =
  let client = newHttpClient()
  let request = "http://api.openweathermap.org/data/2.5/weather?q=Tokyo&appid=" & API_KEY
  return client.getContent(request)

proc getOpenWeatherData*() =
  let data = httpGetWeather()

  let filename = "openweather-" & timeString() & ".txt"
  echo "output file: ", filename
  writeFile(filename, data)
