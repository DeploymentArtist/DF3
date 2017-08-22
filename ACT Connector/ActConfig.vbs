Server = Wscript.Arguments.Item(0) 
SiteCode = Wscript.Arguments.Item(1) 
ActServer = Wscript.Arguments.Item(2) 
ActDatabase = Wscript.Arguments.Item(3) 

Set objWMIService = GetObject("winmgmts:{impersonationLevel=impersonate}!\\" & Server & "\root\sms\site_" & SiteCode) 
Set wbemObjectSet = objWMIService.InstancesOf("SMS_ActConfig") 

If LCase(Server) = LCase(ActServer) Then 
MachineAcct = "" 
Else 
MachineAcct = Wscript.Arguments.Item(4) 
End If 
For Each wbemObject In wbemObjectSet 
wbemObject.Server = ActServer 
wbemObject.Database = ActDatabase 
wbemObject.Put_ 
If MachineAcct = "" Then 
wbemObject.AddLinkedServer ActServer, ActDatabase 
Else 
wbemObject.AddLinkedServer ActServer, ActDatabase, MachineAcct 
End If 
Next

