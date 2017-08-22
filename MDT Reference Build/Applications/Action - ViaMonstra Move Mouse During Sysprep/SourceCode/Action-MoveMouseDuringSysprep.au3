#NoTrayIcon

;Reruns itself and returns - only works when compiled

If $CmdLine[0] = 0 Then
	; Rerun ourself and let this copy return to the task sequencer
	Run('"' & @AutoItExe & '" rerun')
	Exit
EndIf

Sleep(120000)

Mousemove(50, 50)
MouseClick("left")
	
Sleep(120000)

Mousemove(200, 50)
MouseClick("left")

Sleep(120000)

Mousemove(50, 200)
MouseClick("left")

Sleep(120000)

Mousemove(200, 200)
MouseClick("left")
