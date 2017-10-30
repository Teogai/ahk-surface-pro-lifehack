SetTitleMatchMode, 2
#IfWinActive, Unreal
^LButton::RButton
#IfWinActive

^!+W::
	WinGetTitle, Title, A
	MsgBox, The active window is "%Title%".
Return