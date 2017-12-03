Class SoundManager
{
    static StartTime := 0
   mouseWheelVolume(step)
   {
        ElapsedTime := A_TickCount - this.StartTime
        If ElapsedTime > 1000
        {
            this.StartTime := A_TickCount
            If step > 0
                Send {Blind} {Volume_Up}
            Else
                Send {Blind} {Volume_Down}
        }
        Else
        {
            SoundSet %step%
            soundSet 0,,mute
            soundGet vol
            ; ifInString,vol,.
            ;     stringMid,vol,vol,1,% inStr(vol,".")-1
            ; tooltip, Volume:%vol%`%,% mx+8,% my+8,19
            ; setTimer removeVolumeTip,500
        }
        return
   }
}

removeVolumeTip:
tooltip,,,,19
settimer removeVolumeTip,OFF
return