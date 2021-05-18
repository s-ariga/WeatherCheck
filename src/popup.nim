# Copyright (c) 2021 Seiichi Ariga <seiichi.ariga@gmail.com>
# 
# This software is released under the MIT License.
# https://opensource.org/licenses/MIT

type
    HANDLE* = int
    HWND* = HANDLE
    UINT* = int32
    LPCSTR* = cstring

proc MessageBox*(hWnd: HWND, lpText: LPCSTR, lpCaption: LPCSTR, uType: UINT): int32 
  {.discardable, stdcall, dynlib: "user32", importc: "MessageBoxA".}

MessageBox(0, "Hello, world !", "Nim is Powerful", 0)