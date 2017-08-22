Add-PSSnapIn Microsoft.BDD.PSSnapIn -ErrorAction SilentlyContinue 

md C:\HydrationDF3\HydrationISO\Content\Deploy
New-PSDrive -Name "DS001" -PSProvider MDTProvider -Root "C:\HydrationDF3\HydrationDS"
new-item -path "DS001:\Media" -enable "True" -Name "MEDIA001" -Comments "" -Root "C:\HydrationDF3\HydrationISO" -SelectionProfile "Everything" -SupportX86 "True" -SupportX64 "True" -GenerateISO "True" -ISOName "HydrationDF3.iso" -Verbose
new-PSDrive -Name "MEDIA001" -PSProvider "MDTProvider" -Root "C:\HydrationDF3\HydrationISO\Content\Deploy" -Description "Embedded media deployment share" -Force -Verbose