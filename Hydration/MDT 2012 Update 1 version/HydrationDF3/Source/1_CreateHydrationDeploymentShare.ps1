$MDTServer = (get-wmiobject win32_computersystem).Name

Add-PSSnapIn Microsoft.BDD.PSSnapIn -ErrorAction SilentlyContinue 
md C:\HydrationDF3\DS
new-PSDrive -Name "DS001" -PSProvider "MDTProvider" -Root "C:\HydrationDF3\DS" -Description "Hydration DF3" -NetworkPath "\\$MDTServer\HydrationDF3$" -Verbose | add-MDTPersistentDrive -Verbose

md C:\HydrationDF3\ISO\Content\Deploy
new-item -path "DS001:\Media" -enable "True" -Name "MEDIA001" -Comments "" -Root "C:\HydrationDF3\ISO" -SelectionProfile "Everything" -SupportX86 "True" -SupportX64 "False" -GenerateISO "True" -ISOName "HydrationDF3.iso" -Verbose
new-PSDrive -Name "MEDIA001" -PSProvider "MDTProvider" -Root "C:\HydrationDF3\ISO\Content\Deploy" -Description "Embedded media deployment share" -Force -Verbose