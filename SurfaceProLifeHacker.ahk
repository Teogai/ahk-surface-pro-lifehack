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
		Loop()
		{
			SurfaceProLifeHacker.HandleOverwatch()
		}
	}
	
	HandleOverwatch()
	{
		WinWait Overwatch
		Sleep, 4000
		MonitorManager.SaveCurrentResolution()
		MonitorManager.ChangeToLowestResolution()
		PowerPlanManager.SetPowerSaverPlan()
		
		WinWaitClose
		Sleep, 1000
		MonitorManager.RevertToSavedResolution()
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

