Class UI
{
	ShowText(text, time)
	{
		posY := A_ScreenHeight * 0.8
		
		Gui, Destroy
		Gui, +AlwaysOnTop +ToolWindow -SysMenu -Caption
		Gui, Color, ffffff ;changes background color
		Gui, Font, 000000 s20 wbold, Verdana ;changes font color, size and font
		Gui, Add, Text, x18 y0, %text% ;the text to display
		Gui, Show, NoActivate xCenter y%posY%, Test
		GuiControl, +cDA4F49, Red
		sleep, time
		Gui, Destroy
	}
}