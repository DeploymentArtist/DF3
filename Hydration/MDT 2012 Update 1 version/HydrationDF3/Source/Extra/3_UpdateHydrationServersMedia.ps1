Add-PSSnapIn Microsoft.BDD.PSSnapIn -ErrorAction SilentlyContinue 

New-PSDrive -Name "DS001" -PSProvider MDTProvider -Root "C:\HydrationDF3\DS"
Update-MDTMedia -path "DS001:\Media\MEDIA001" -Verbose
