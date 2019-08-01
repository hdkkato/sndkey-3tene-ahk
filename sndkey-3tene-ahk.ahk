;---Auto-executeセクション ここから---
SetWinDelay, 0  ;なるべく高速でアクティブウィンドウの切り替えを行う
Return
;---Auto-executeセクション ここまで---

;テンキーの数字キーをホットキーに割り当てる
Numpad0::SndCtrlKey("0")
Numpad1::SndCtrlKey("1")
Numpad2::SndCtrlKey("2")
Numpad3::SndCtrlKey("3")
Numpad4::SndCtrlKey("4")
Numpad5::SndCtrlKey("5")
Numpad6::SndCtrlKey("6")
Numpad7::SndCtrlKey("7")
Numpad8::SndCtrlKey("8")
Numpad9::SndCtrlKey("9")



SndCtrlKey(Key){
    ;対象となるウィンドウにキーを送信するための関数
    Process,Exist,3tene.exe                 ;3teneが起動しているかどうかを調べる
    WinGetActiveTitle, lastATitle           ;現在のウィンドウを取得して変数に格納
    If ErrorLevel <> 0                      ;起動していた場合(ErrorLevel変数にプロセスIDが格納される)
        WinActivate,ahk_pid %ErrorLevel%    ;そのプロセスのウィンドウをアクティブにする
    DetectHiddenWindows,On                  ;非表示のウィンドウを対象に含めるようにする
    ControlSend,,%Key%,ahk_exe 3tene.exe    ;対象ウィンドウにCtrl+Nキーを送信
    WinActivate,%lastATitle%                ;直前に開いていたウィンドウに再びフォーカスを戻す
    Return                                  ;ホットキーサブルーチンを終了
}