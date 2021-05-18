# Copyright (c) 2021 Seiichi Ariga <seiichi.ariga@gmail.com>
# 
# This software is released under the MIT License.
# https://opensource.org/licenses/MIT

import times

proc timeString*(): string =
  ## 時間を文字列で返す。
  ## TODO 秒まで必要？
  let timeNow = now()
  return timeNow.format("yyyy-MMdd-HH-mm")