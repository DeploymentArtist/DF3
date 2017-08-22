Set oShell = CreateObject("Wscript.Shell")
Set oSysEnv = oShell.Environment("System")

if oSysEnv("PROCESSOR_ARCHITECTURE") = "AMD64" then
	oShell.Run "msiexec.exe /i install_flash_player_11_active_x_32bit.msi /qb /norestart" & strOutputFile, 1, true
	oShell.Run "msiexec.exe /i install_flash_player_11_active_x_64bit.msi /qb /norestart" & strOutputFile, 1, true
Else
	oShell.Run "msiexec.exe /i install_flash_player_11_active_x_32bit.msi /qb /norestart" & strOutputFile, 1, true
End if

