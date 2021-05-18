# Copyright (c) 2021 Seiichi Ariga <seiichi.ariga@gmail.com>
# 
# This software is released under the MIT License.
# https://opensource.org/licenses/MIT

## Tenki.jpから天気図画像をダウンロードするモジュール

import httpclient
import common/utils

let
  IMAGE_URL = "http://static.tenki.jp/static-images/radar/recent/japan-detail-middle.jpg" ## Tenki.jpのトップ右下に出てくる天気図のURL

proc httpGetChart(): string =
  ## ダウンロードの実行。画像データを返す
  let client = newHttpClient()
  return client.getContent(IMAGE_URL)

proc getTenkiData*() =
  ## Tenki.jpから画像をダウンロードして保存
  let data = httpGetChart()
  # 画像データそのままなので、そのままファイルに保存
  let filename = "tenkijp-chart-" & timeString() & ".jpg"
  echo "output file: ", filename
  writeFile(filename, data)


