

;==============================================================
;==============================================================
;=====================   Remap Keys   =========================
;==============================================================
;==============================================================

^!F5::Reload

;;;; Power Scheme GUID: 381b4222-f694-41f0-9685-ff5bb260df2e  (Balanced)
;;;; Power Scheme GUID: 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c  (High performance)
;;;; Power Scheme GUID: a1841308-3541-4fab-bc81-f71556f20b4a  (Power saver)

^!F1::
SetScheme(0) ;Enable "Balanced" plan on pressing F1
MsgBox Change Power Plan `n0 - Balanced
Return

^!F2::
Run powercfg -setactive a1841308-3541-4fab-bc81-f71556f20b4a,,Hide
MsgBox Change Power Plan `n1 - Power Saver
Return

^!F3::
ChangeResolution(640, 360)
Return

^!F6::
ToggleAutohideTaskbar(-1)
Return

^!F7::
ToggleTabletMode(-1)
Return

^!F8::
ChangeResolution(1280, 720)
Return

^!F9::
ChangeResolution(1920, 1080)
Return

^!F10::
ChangeResolution(1080, 720)
Return

^!F11::
ChangeResolution(1624, 1080)
Return

^!F12::
ChangeResolution(2160, 1440)
Return

^!Esc::
Sleep, 200
SendMessage,0x112,0xF170,2,,Program Manager
return

^!D::
Run desk.cpl
return

^!P::
Run powercfg.cpl
return

^!R::
Run regedit
return



;==============================================================
;==============================================================
;===================   Private Functions   ====================
;==============================================================
;==============================================================

;SchemeIndex is the number you got from running the first script
SetScheme(SchemeIndex)
{
	VarSetCapacity(guid,szguid := 16)
	VarSetCapacity(desc, szdesc := 1024)
	
	Dllcall("powrprof.dll\PowerEnumerate", "ptr", 0, "ptr", 0, "ptr", 0, "uint", 16, "uint", SchemeIndex, "ptr", &guid, "uint*", 16)
	r := Dllcall("powrprof.dll\PowerSetActiveScheme", "ptr", 0, "ptr", &guid)
	if r
		Msgbox % "PowerSetActiveScheme error: " r
	r2 := Dllcall("powrprof.dll\PowerReadFriendlyName", "ptr", 0, "ptr", &guid, "ptr", 0, "ptr", 0, "str", desc, "uint*", 1024)
	;;;;;MsgBox Change Power Plan `n%SchemeIndex% - %desc% `n
}

GetResolution()
{
	SysGet, MonitorName, MonitorName, %A_Index%
    SysGet, Monitor, Monitor, %A_Index%
    SysGet, MonitorWorkArea, MonitorWorkArea, %A_Index%
}

ChangeResolution(Screen_Width := 1920, Screen_Height := 1080, Color_Depth := 32)
{
	VarSetCapacity(Device_Mode,156,0)
	NumPut(156,Device_Mode,36) 
	DllCall( "EnumDisplaySettingsA", UInt,0, UInt,-1, UInt,&Device_Mode )
	NumPut(0x5c0000,Device_Mode,40) 
	NumPut(Color_Depth,Device_Mode,104)
	NumPut(Screen_Width,Device_Mode,108)
	NumPut(Screen_Height,Device_Mode,112)
	Return DllCall( "ChangeDisplaySettingsA", UInt,&Device_Mode, UInt,0 )
}
Return

LaunchTimelie()
{
	Run shell:Appsfolder\senior-project_gmxa5rbgwx94a!App
}

ToggleAutohideTaskbar(Mode := -1)
{
	VarSetCapacity( APPBARDATA, 48, 0 )
	NumPut(48, APPBARDATA, 0, "UInt")
	bits := DllCall("Shell32.dll\SHAppBarMessage"
             ,"UInt", 4
             ,"Ptr", &APPBARDATA )
	NumPut( Mode == -1 ? (bits ^ 0x1) : Mode, APPBARDATA, 40, "UInt" )
	DllCall("Shell32.dll\SHAppBarMessage"
             ,"UInt", ( ABM_SETSTATE := 0xA )
             ,"Ptr", &APPBARDATA )
}
 

	
TabletModeController_GetMode(TabletModeController, ByRef mode) {
	return DllCall(NumGet(NumGet(TabletModeController+0),3*A_PtrSize), "Ptr", TabletModeController, "UInt*", mode)
}
 
TabletModeController_SetMode(TabletModeController, _TABLETMODESTATE, _TMCTRIGGER := 4) {
	return DllCall(NumGet(NumGet(TabletModeController+0),4*A_PtrSize), "Ptr", TabletModeController, "UInt", _TABLETMODESTATE, "UInt", _TMCTRIGGER)	
}

ToggleTabletMode(TabletMode := -1)
{	 

#NoEnv
SetBatchLines -1
ListLines Off
#NoTrayIcon	

TABLETMODESTATE_DESKTOPMODE := 0x0
TABLETMODESTATE_TABLETMODE := 0x1
 
ImmersiveShell := ComObjCreate("{C2F03A33-21F5-47FA-B4BB-156362A2F239}", "{00000000-0000-0000-C000-000000000046}")
TabletModeController := ComObjQuery(ImmersiveShell, "{4fda780a-acd2-41f7-b4f2-ebe674c9bf2a}", "{4fda780a-acd2-41f7-b4f2-ebe674c9bf2a}")
	
if (TabletModeController_GetMode(TabletModeController, mode) == 0)
{
	if(TabletMode == -1)
		TabletModeController_SetMode(TabletModeController, mode == TABLETMODESTATE_DESKTOPMODE ? TABLETMODESTATE_TABLETMODE : TABLETMODESTATE_DESKTOPMODE)
	else if(TabletMode == 0 || TabletMode == 1)
		TabletModeController_SetMode(TabletModeController, TabletMode)
}

ObjRelease(TabletModeController), TabletModeController := 0
ObjRelease(ImmersiveShell), ImmersiveShell := 0 ; Can be freed after TabletModeController is created, instead	
}

#IfWinActive ahk_class ConsoleWindowClass
^V::
Send !{Space}ep
return
#IfWinActive

;Make Win+Backspace     =Pause/Break
#Backspace::CtrlBreak

