#Include Scripts/PowerPlanManager.ahk
#Include Scripts/MonitorManager.ahk

^!+F1::PowerPlanManager.SetBalancedPlan()

^!+F2::PowerPlanManager.SetHighPerformancePlan()

^!+F3::PowerPlanManager.SetPowerSaverPlan()

^!+F4::return

^!+F5::Reload

; ===== 16:9 =====

^!+F6::MonitorManager.ChangeResolution(800, 450)	

^!+F7::MonitorManager.ChangeResolution(1280, 720)

^!+F8::MonitorManager.ChangeResolution(1920, 1080)

; ===== 3:2 =====

;^!+F10::MonitorManager.ChangeResolution(1080, 720)

^!+F9::MonitorManager.ChangeResolution(752, 500)	

^!+F10::MonitorManager.ChangeResolution(1080, 720)

^!+F11::MonitorManager.ChangeResolution(1624, 1080)

^!+F12::MonitorManager.ChangeResolution(2160, 1440)

^!+C::Run C:\Program Files\ConEmu\ConEmu64.exe

^!+E::Run explorer.exe

^!+D::Run desk.cpl

^!+P::Run powercfg.cpl

^!+R::Run regedit

^!+S::Run shell:Startup

^!+[::SharpShooter.Run()

^!+]::SharpShooter.Toggle()

#Backspace::CtrlBreak ;Make Win+Backspace = Pause/Break

^!+A::
	toggle:=!toggle ; This toggles the variable between true/false
	if toggle
	{
		Run nircmd setdefaultsounddevice "Speakers"
		soundToggleBox("Speakers")
	}
	else
	{
		Run nircmd setdefaultsounddevice "Realtek HD Audio 2nd output"
		Run nircmd setdefaultsounddevice "Headphones"
		soundToggleBox("Headphones")
	}
Return

#IfWinActive ahk_class ConsoleWindowClass
^V::Send !{Space}ep
#IfWinActive
