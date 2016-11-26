~$LButton::
While GetKeyState("LButton", "P") 
{
	Random, time, 350, 450
	Click down
	Sleep, %time%
	Click up
	Sleep, 25
}
return

Q::
Send Q
Click down
Sleep, 8000
Click up
return 

^!+=::ExitApp

