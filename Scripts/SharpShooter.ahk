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
		if(!ProcessExist, Overwatch.exe){
			Msgbox Overwatch is not Running
			return
		}
		
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
		
		Msgbox SS Start
		
		this.IsRunning := true
		while(this.IsRunning = true and ProcessExist, Overwatch.exe)
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
					DllCall("mouse_event", uint, 1, int, MoveX * 4, int, MoveY, uint, 0, int, 0)
				}
			}
		}
		Msgbox SS End
	}
	
	Stop()
	{
		this.IsRunning := false
	}
}