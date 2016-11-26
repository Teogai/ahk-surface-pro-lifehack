;init:
#NoEnv
#SingleInstance, Force
#Persistent
#InstallKeybdHook
#UseHook
#KeyHistory, 0
#HotKeyInterval 1
#MaxHotkeysPerInterval 127

;traytip, Sharpshooter %version%, Running in background!, 5, 1
;Menu, tray, NoStandard
;Menu, tray, Tip, Sharpshooter %version%
;Menu, tray, Add, Sharpshooter %version%, return
;Menu, tray, Add
;Menu, tray, Add, Help, info
;Menu, tray, Add, Exit, exit

Class SharpShooter
{
	static IsRunning = false
	
	Run()
	{
		SetKeyDelay,-1, 1
		SetControlDelay, -1
		SetMouseDelay, -1
		SetWinDelay,-1
		SendMode, InputThenPlay
		SetBatchLines,-1
		ListLines, Off
		CoordMode, Pixel, Screen, RGB
		CoordMode, Mouse, Screen
		PID := DllCall("GetCurrentProcessId")
		Process, Priority, %PID%, High
		 
		EMCol := 0xD82A22
		ColVn := 64
		AntiShakeX := (A_ScreenHeight // 160)
		AntiShakeY := (A_ScreenHeight // 128)
		ZeroX := (A_ScreenWidth // 2)
		ZeroY := (A_ScreenHeight // 2)
		CFovX := (A_ScreenWidth // 8)
		CFovY := (A_ScreenHeight // 64)
		ScanL := ZeroX - CFovX
		ScanT := ZeroY
		ScanR := ZeroX + CFovX
		ScanB := ZeroY + CFovY
		NearAimScanL := ZeroX - AntiShakeX
		NearAimScanT := ZeroY - AntiShakeY
		NearAimScanR := ZeroX + AntiShakeX
		NearAimScanB := ZeroY + AntiShakeY
		
		AimSpeed := 3
		
		if( !WinActive("Overwatch") )
		{
			UI.ShowText("Sharp Shooter - ERROR `nOverwatch not running", 1000)
			return
		}
		
		UI.ShowText("Sharp Shooter - ON", 1000)
		
		this.IsRunning := true
		while( WinActive("Overwatch") )
		{
			if(this.IsRunning = true)
			{
				KeyWait, LButton, D
				PixelSearch, AimPixelX, AimPixelY, NearAimScanL, NearAimScanT, NearAimScanR, NearAimScanB, EMCol, ColVn, Fast RGB
				if (!ErrorLevel=0) {
					loop, 10 {
						PixelSearch, AimPixelX, AimPixelY, ScanL, ScanT, ScanR, ScanB, EMCol, ColVn, Fast RGB
						AimX := AimPixelX - ZeroX
						AimY := AimPixelY - ZeroY
						DirX := -1
						DirY := -1
						If ( AimX > 0 ) {
							DirX := 1
						}
						If ( AimY > 0 ) {
							DirY := 1
						}
						AimOffsetX := AimX * DirX
						AimOffsetY := AimY * DirY
						MoveX := Floor(( AimOffsetX ** ( 1 / 2 ))) * DirX
						MoveY := Floor(( AimOffsetY ** ( 1 / 2 ))) * DirY
						DllCall("mouse_event", uint, 1, int, MoveX * AimSpeed, int, MoveY, uint, 0, int, 0)
					}
				}
			}
			else
			{
				Sleep, 1000
			}
		}
		this.IsRunning := false
		UI.ShowText("Sharp Shooter - OFF", 1000)
	}
	
	Toggle()
	{
		if( !WinActive("Overwatch") )
		{
			UI.ShowText("Sharp Shooter - ERROR `nOverwatch not running", 1000)
			return
		}
		
		this.IsRunning := !this.IsRunning
		if(this.IsRunning = true)
			UI.ShowText("Sharp Shooter - Resume", 1000)
		else
			UI.ShowText("Sharp Shooter - Paused", 1000)
		return
	}
}