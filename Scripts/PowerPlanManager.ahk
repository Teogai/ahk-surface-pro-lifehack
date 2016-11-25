

Class PowerPlanManager
{
	BALANCED := 0
	POWER_SAVER := 1
	
	Init()
	{
		VarSetCapacity(guid,szguid := 16)
		VarSetCapacity(desc, szdesc := 1024)
	}
	
	SetPowerPlan(PlanIndex)
	{
		Dllcall("powrprof.dll\PowerEnumerate", "ptr", 0, "ptr", 0, "ptr", 0, "uint", 16, "uint", PlanIndex, "ptr", &guid, "uint*", 16)
		r := Dllcall("powrprof.dll\PowerSetActiveScheme", "ptr", 0, "ptr", &guid)
		if r
			Msgbox % "PowerSetActiveScheme error: " r
		r2 := Dllcall("powrprof.dll\PowerReadFriendlyName", "ptr", 0, "ptr", &guid, "ptr", 0, "ptr", 0, "str", desc, "uint*", 1024)
		;;;;;MsgBox Change Power Plan `n%PlanIndex% - %desc% `n
	}
	
}


;;;; Power Scheme GUID 381b4222-f694-41f0-9685-ff5bb260df2e  (Balanced)
;;;; Power Scheme GUID 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c  (High performance)
;;;; Power Scheme GUID a1841308-3541-4fab-bc81-f71556f20b4a  (Power saver)