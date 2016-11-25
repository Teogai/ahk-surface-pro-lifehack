;#NoEnv
;SetBatchLines -1
;ListLines Off
;#NoTrayIcon	

#Include Scripts/HotKey.ahk

LaunchTimelie()
{
	Run shell:Appsfolder\senior-project_gmxa5rbgwx94a!App
}

#IfWinActive ahk_class ConsoleWindowClass
^V::
Send !{Space}ep
return
#IfWinActive


