# Copyright (c) 2021 Seiichi Ariga <seiichi.ariga@gmail.com>

version     = "0.0.1"
author      = "Seiichi Ariga"
description = "HTTP get weather images from Tenki.jp. Json data from OpenWeather"
license     = "MIT"

srcDir = "src" # nimファイルは全部srcの中
bin = @["weathercheck"] # mainのファイル

requires "nim >= 1.4.6" # TODO もっと古くていいと思う
