Class NoRecoil
{
	static IsRunning = false
	static usingUlt = false
	Toggle()
	{
		this.IsRunning := !this.IsRunning
		if(this.IsRunning = true)
			UI.ShowText("No Recoil - ON", 1000)
		else
			UI.ShowText("No Recoil - OFF", 1000)
		return
	}
}
		
#If (NoRecoil.IsRunning = true) and WinActive("Overwatch")
LButton::
While GetKeyState("LButton", "P") and WinActive("Overwatch") and (NoRecoil.usingUlt = false)
{
	Random, clickTime, 350, 450
	Random, upTime, 25, 30
	
	Click down
	Sleep, %clickTime%
	Click up
	Sleep, %upTime%
}
return

#If (NoRecoil.IsRunning = true) and WinActive("Overwatch")
Q::
Send q
NoRecoil.usingUlt := true
Sleep, 8000
NoRecoil.usingUlt := false
return 

#If (NoRecoil.IsRunning = true) and WinActive("Helldivers")
LButton::
While GetKeyState("LButton", "P") and WinActive("Helldivers") and (NoRecoil.usingUlt = false)
{
	Click down
	Sleep, 50
	Click up
	Sleep, 20
}
return

#IfWinActive Helldivers
F::NoRecoil.Toggle()
#IfWinActive

^!+=::NoRecoil.Toggle()


