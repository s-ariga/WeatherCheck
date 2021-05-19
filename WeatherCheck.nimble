# Copyright (c) 2021 Seiichi Ariga <seiichi.ariga@gmail.com>
# 
# This software is released under the MIT License.
# https://opensource.org/licenses/MIT

version     = "0.0.1"
author      = "Seiichi Ariga"
description = "HTTP get weather images."
license     = "MIT"

srcDir = "src"
bin = @["weathercheck"]

requires "nim >= 1.4.6"
