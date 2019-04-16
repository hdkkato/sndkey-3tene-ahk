;---Auto-executeセクション ここから---
SetWinDelay, 0  ;なるべく高速でアクティブウィンドウの切り替えを行う
Return
;---Auto-executeセクション ここまで---

;Shift+数字キーをホットキーに割り当てる
+1::SndCtrlKey("1")
+2::SndCtrlKey("2")
+3::SndCtrlKey("3")
+4::SndCtrlKey("4")
+5::SndCtrlKey("5")
+6::SndCtrlKey("6")
+7::SndCtrlKey("7")
+8::SndCtrlKey("8")
+9::SndCtrlKey("9")
+0::SndCtrlKey("0")


SndCtrlKey(Key){
    /* 対象となるウィンドウにキーを送信するための関数 */
    ;MsgBox , , result, %Key%               ;Debug
    Process,Exist,notepad.exe               ;メモ帳が起動しているかどうかを調べる
    If ErrorLevel <> 0                      ;起動していた場合(ErrorLevel変数にプロセスIDが格納される)
        ControlSend, , %Key%, ahk_class Notepad    ;そのプロセスのウィンドウにキーを送信する
        ;ControlSend, , n, ahk_id %ntctl%
    Return
}