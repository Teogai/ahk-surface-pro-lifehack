#Include Scripts/PowerPlanManager.ahk
#Include Scripts/MonitorManager.ahk
#Include Scripts/SoundManager.ahk
#Include Scripts/Launcher.ahk

;;^ => Ctrl
;;! => Alt
;;+ => Shift
;;# => Win

^!LButton::RButton
^!+LButton::MButton

;^!+F1::PowerPlanManager.SetBalancedPlan()
;^!+F2::PowerPlanManager.SetHighPerformancePlan()
;^!+F3::PowerPlanManager.SetPowerSaverPlan()
;^!+F4::
^!+F5::Reload
;^!+F6::MonitorManager.ChangeResolution(800, 450)	
;^!+F7::MonitorManager.ChangeResolution(1280, 720)
;^!+F8::MonitorManager.ChangeResolution(1920, 1080)
;^!+F9::MonitorManager.ChangeResolution(752, 500)	
;^!+F10::MonitorManager.ChangeResolution(1080, 720)
;^!+F11::MonitorManager.ChangeResolution(1624, 1080)
;^!+F12::MonitorManager.ChangeResolution(2160, 1440)

;^!+A::
;^!+B::
;^!+C::
^!+D::Run desk.cpl
^!+E::Run explorer.exe
;^!+F::
;!+G::
;^!+H::
;^!+I::
;^!+J::
;^!+K::
;^!+L::
;^!+M::
;^!+N::
;^!+O::
;^!+P::
;^!+Q::
^!+R::Run regedit
^!+S::Run shell:Startup
;^!+T::
;^!+U::
;^!+V::
;^!+W::
;^!+X::
;^!+Y::
;^!+Z::

;#A:: --Action Center
;#B::
#C::Launcher.LaunchPowershellAtCurrentDir()
;#D:: --Show Desktop
;#E:: --Explorer
;#F::
;#G::
#H::Run c:\GitProjects
;#I:: --Settings
#J::Run c:\Downloads
;#K::
;#L:: --Lock
;#M:: --Minimize
;#N::
;#P::
;#Q::
;#R:: --Run
;#S::
;#T:: --Tab
;#U::
;#V::
;#W:: --Ink Workspace
;#X:: --System Apps
;#Y::
;#Z::

^!+/::Run SnippingTool.exe
;^!+[::SharpShooter.Run()
;^!+]::SharpShooter.Toggle()

#Backspace::CtrlBreak ;Make Win+Backspace = Pause/

#IfWinActive
^!WheelUp::SoundManager.MouseWheelVolume("+1")
^!WheelDown::SoundManager.MouseWheelVolume("-1")
return

#F20::return ;Single Pen Click
#F19::Run "C:\Program Files\Adobe\Adobe Photoshop CC 2017\Photoshop.exe" ;Double Pen Click
#F18::return ;Pen Click and Hold


