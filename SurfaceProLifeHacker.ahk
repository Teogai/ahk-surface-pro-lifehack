Class SurfaceProLifeHacker
{
	Setup()
	{
		Menu, Tray, Icon, %A_ScriptDir%\teogai.ico 
		Menu, Tray, NoStandard
		Menu, Tray, Add, Exit, SurfaceProLifeHacker.ExitScript
		Menu, Tray, Tip, Surface Pro Life Hacker
	}
	
	HandleOverwatch()
	{
		Process, Wait, Overwatch.exe
		Sleep, 2000
		MonitorManager.ChangeToLowestResolution()
		PowerPlanManager.SetPowerSaverPlan()
		;MouseManager.SetMouseSpeed(20)
		MouseManager.TurnOffPointerPrecision()
		
		Process, WaitClose, Overwatch.exe
		MonitorManager.ChangeToHighestResolution()
		PowerPlanManager.SetBalancedPlan()
		;MouseManager.SetMouseSpeed(20)
		MouseManager.TurnOnPointerPrecision()
	}
	
	LaunchTimelie()
	{
		Run shell:Appsfolder\senior-project_gmxa5rbgwx94a!App
	}
	
	ExitScript()
	{
		ExitApp
	}
	CheckAdmin()
	{
		if not A_IsAdmin
		{
   			Run *RunAs "%A_ScriptFullPath%"  ; Requires v1.0.92.01+
   			ExitApp
		}
	}
}

;;SurfaceProLifeHacker.CheckAdmin()
SurfaceProLifeHacker.Setup()

#Include Scripts/HotKey.ahk
#Include Scripts/PowerPlanManager.ahk
#Include Scripts/MonitorManager.ahk
#Include Scripts/MouseManager.ahk
#Include Scripts/SharpShooter.ahk
#Include Scripts/NoRecoil.ahk
#Include Scripts/UI.ahk

#Include Lib/SoundSwapper.ahk

#NoEnv
#SingleInstance, Force
#Persistent
#InstallKeybdHook
#UseHook
#KeyHistory, 0
#HotKeyInterval 1
#MaxHotkeysPerInterval 127
