Class SurfaceProLifeHacker
{
	Setup()
	{
		Menu, Tray, Icon, %A_ScriptDir%\teogai.ico 
		Menu, Tray, NoStandard
		Menu, Tray, Add, Exit, SurfaceProLifeHacker.ExitScript
		Menu, Tray, Tip, Teogai Lifehacker
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
#Include Scripts/UI.ahk

#NoEnv
#SingleInstance, Force
#Persistent
#InstallKeybdHook
#UseHook
#KeyHistory, 0
#HotKeyInterval 1
#MaxHotkeysPerInterval 127
