Class SurfaceProLifeHacker
{
	Setup()
	{
		Menu, Tray, Icon, %A_ScriptDir%\teogai.ico 
		Menu, Tray, NoStandard
		Menu, Tray, Add, Exit, SurfaceProLifeHacker.ExitScript
		Menu, Tray, Tip, Surface Pro Life Hacker
	}
	
	Run()
	{
		Loop
		{
			SurfaceProLifeHacker.HandleOverwatch()
		}
	}
	
	HandleOverwatch()
	{
		Process, Wait, Overwatch.exe
		Sleep, 2000
		MonitorManager.ChangeToLowestResolution()
		PowerPlanManager.SetPowerSaverPlan()
		
		Process, WaitClose, Overwatch.exe
		MonitorManager.ChangeToHighestResolution()
		PowerPlanManager.SetBalancedPlan()
	}
	
	LaunchTimelie()
	{
		Run shell:Appsfolder\senior-project_gmxa5rbgwx94a!App
	}
	
	ExitScript()
	{
		ExitApp
	}
}

SurfaceProLifeHacker.Setup()
SurfaceProLifeHacker.Run()

#Include Scripts/HotKey.ahk
#Include Scripts/PowerPlanManager.ahk
#Include Scripts/MonitorManager.ahk

