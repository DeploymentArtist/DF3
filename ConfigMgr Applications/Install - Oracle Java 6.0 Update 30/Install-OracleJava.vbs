Set oShell = CreateObject("Wscript.Shell")
Set oSysEnv = oShell.Environment("System")

if oSysEnv("PROCESSOR_ARCHITECTURE") = "AMD64" then
	oShell.Run "msiexec.exe /i jre1.6.0_30\jre1.6.0_30.msi /qn" & strOutputFile, 1, true
	oShell.Run "msiexec.exe /i jre1.6.0_30_x64\jre1.6.0_30.msi /qn" & strOutputFile, 1, true
Else
	oShell.Run "msiexec.exe /i jre1.6.0_30\jre1.6.0_30.msi /qn" & strOutputFile, 1, true
End if

