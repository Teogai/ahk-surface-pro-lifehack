^!WheelUp::mouseWheelVolume("+1")
^!WheelDown::mouseWheelVolume("-1")
mouseWheelVolume(step)
{  
   SoundSet %step%
   soundSet 0,,mute
   soundGet vol
   ifInString,vol,.
      stringMid,vol,vol,1,% inStr(vol,".")-1
   tooltip, Volume:%vol%`%,% mx+8,% my+8,19
   setTimer removeVolumeTip,500
   return
}

removeVolumeTip:
tooltip,,,,19
settimer removeVolumeTip,OFF
return