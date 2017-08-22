$MDTServer = (get-wmiobject win32_computersystem).Name

Add-PSSnapIn Microsoft.BDD.PSSnapIn -ErrorAction SilentlyContinue 
md C:\HydrationDF3\HydrationDS
new-PSDrive -Name "DS001" -PSProvider "MDTProvider" -Root "C:\HydrationDF3\HydrationDS" -Description "Hydration DF3" -NetworkPath "\\$MDTServer\HydrationDF3$" -Verbose | add-MDTPersistentDrive -Verbose
