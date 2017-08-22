' // ***************************************************************************
' // 
' // Copyright (c) Microsoft Corporation.  All rights reserved.
' // 
' // Microsoft Deployment Toolkit Solution Accelerator
' //
' // File:      DeployWiz_Initialization.wsf
' // 
' // Version:   5.1.1642.01
' // Version:   5.1.1642.02, updated by Johan Arwidmark to support Windows 7 SP1 Language Packs
' // 	        See http://support.microsoft.com/kb/2547191 for more details
' // 
' // Purpose:   Main Client Deployment Wizard Initialization routines
' // 
' // ***************************************************************************


Option Explicit

''''''''''''''''''''''''''''''''''''''''''''''''''
'  DeployRoot!
'

Dim oXMLSiteData

Function InitializeDeployRoot

	Dim oXMLDefault
	Dim oItem
	Dim oOption
	Dim iRetVal
	Dim sLocationServer

	Set oXMLSiteData = nothing

	' Save the local DeployRoot location
	If property("LocalDeployRoot") = "" then
		oProperties("LocalDeployRoot") = property("DeployRoot")
	End if

	' Find the LocationServer.xml file if it exists.  If it doesn't, then exit.
	iRetVal = oUtility.FindFile("LocationServer.xml", sLocationServer)
	If iRetVal <> SUCCESS then

		' Force manual entry
		RadioCT2.checked = TRUE
		SiteList.disabled = TRUE
		DisplayLocal.style.display = "none"
		DisplayValidateDeployRoot

		oLogging.CreateEntry "No LocationServer.xml file was found, so no additonal DeployRoot pane initialization is required.", LogTypeInfo
		Exit Function
	End if
	
	' Load the Site Configuration XML file.
	Set oXMLSiteData = oUtility.CreateXMLDOMObjectEx( sLocationServer )
	If oXMLSiteData is nothing or oXMLSiteData.ParseError.ErrorCode <> 0 then

		' Force manual entry
		RadioCT2.checked = TRUE
		SiteList.disabled = TRUE
		DisplayLocal.style.display = "none"
		DisplayValidateDeployRoot

		oLogging.CreateEntry "The LocationServer.xml file was found at " & sLocationServer & " but it could not be loaded, probably because it was invalid.", LogTypeWarning
		Exit Function
	End if

	If not ( oXMLSiteData.selectNodes("//servers/server") is nothing ) then
		While SiteList.options.length > 0
			SiteList.remove 0
		Wend
	End if

	For each oItem in oXMLSiteData.selectNodes("//servers/server")

		Set oOption = document.createElement("OPTION")
		oOption.Value = oUtility.SelectSingleNodeString(oItem,"serverid")
		oOption.Text = oUtility.SelectSingleNodeString(oItem,"friendlyname")
		SiteList.Add oOption

	Next

	' Now attempt to get a default from a server!
	If oUtility.SelectSingleNodeString(oXMLSiteData,"//servers/QueryDefault") <> "" then

		Set oXMLDefault = oUtility.CreateXMLDOMObjectEx( oUtility.SelectSingleNodeString(oXMLSiteData,"//servers/QueryDefault") )
		If not (oXMLDefault is nothing) then
			For each oItem in oXMLDefault.selectNodes("//DefaultSites/DefaultSite")
				SiteList.Value = oItem.Text
				If SiteList.Value = oItem.Text then
					Exit for
				End if
			Next
		End if
		Set oXMLDefault = nothing

	End if

	DisplayValidateDeployRoot

End Function


'''''''''''''''''''''''''''''''''''''
'  DomainMembership
'

Function SkipDomainMembershipIfUpgrade

	SkipDomainMembershipIfUpgrade = Property("DeploymentType")<>"UPGRADE"

	If not SkipDomainMembershipIfUpgrade then
		oProperties("JoinDomain") = ""
		oProperties("Workgroup") = ""
	End if

End function


Function PrePopulateDomainMembership

	' If the Domain membership credentials are blank, then pre-populate with the network share credentials.
	' unless SkipDomainMembership is selected.


	If UCase(Property("SkipDomainMembership")) = "YES" then
		PrePopulateDomainMembership = TRUE
		Exit Function
	End If


	If Property("DomainAdmin") = "" and Property("DomainAdminDomain") = "" and Property("DomainAdminPassword") = "" then
		If Property("UserID") <> "" and Property("USerDomain") <> "" and Property("UserPassword") <> "" Then

			oProperties("DomainAdmin") = Property("UserID")
			oProperties("DomainAdminDomain") = Property("USerDomain")
			oProperties("DomainAdminPassword") = Property("UserPassword")

		End if
	End if


	PrePopulateDomainMembership = TRUE

End function


''''''''''''''''''''''''''''

Function AddItemToMachineObjectOUOpt(item)
	Dim oOption

	set oOption = document.createElement("OPTION")
	oOption.Value = item
	oOption.Text = item
	MachineObjectOUOptional.Add oOption
	MachineObjectOUOptionalBtn.style.display = "inline"

End function


	Function InitializeDeploymentType

		Dim sReason	
		sReason = empty
		
		' We do not support any upgrades from Windows 2000 or from XP x64 platforms.
		If Property("OSVERSION") = "2000" or (Property("ARCHITECTURE") = "X64" and Property("OSCurrentBuild") < "6000" and UCase(Property("IsServerOS")) = "FALSE") Then
			sReason = "No support for any upgrades from Windows 2000 or from XP x64 platforms"

		ElseIf ucase(Property("Architecture")) <> Ucase(Property("ImageProcessor")) Then
			sReason = "Cross Platform Upgrades"

		ElseIf Property("OSVERSION") = "XP" and Left(Property("ImageBuild"),3) = "6.1" and UCase(Property("IsServerOS")) = "FALSE" Then
			sReason = "No support for upgrade from XP to Win 6.1"

		ElseIf Property("OSCurrentBuild") > Mid(Property("ImageBuild"),5,4) Then
			sReason = "Only Upgrades or in-place Upgrades allowed, no downgrades allowed"

		' Check the SKU's
		ElseIf ucase(Property("OSSKU")) = Ucase(Property("ImageFlags")) Then
			' Always allow upgrades to and from the same SKU

		ElseIf ( Property("OSVERSION")= "Vista" or Property("OSVERSION")= "Win7Client" ) and Left(Property("ImageBuild"),1) = "6" Then
		
				' Client SKU Scenarios
			If Property("OSSKU") = "HOMEBASIC" and (Ucase(Property("ImageFlags")) = "HOMEPREMIUM" or Ucase(Property("ImageFlags")) = "ULTIMATE") Then
				' OK
			ElseIF Property("OSSKU") = "HOMEPREMIUM" and (Ucase(Property("ImageFlags")) = "ULTIMATE") Then
				' OK
			ElseIF (Property("OSSKU") = "BUSINESS" or Property("OSSKU") = "PROFESSIONAL") and (Ucase(Property("ImageFlags")) = "PROFESSIONAL" or Ucase(Property("ImageFlags")) = "ENTERPRISE" or Ucase(Property("ImageFlags")) = "ULTIMATE") Then
				' OK
			Else
				sReason = "Windows 6.x upgrade from %OSSKU% to %ImageFlags% is not allowed"
			End if 

		ElseIf Left(Property("ImageBuild"),1) = "6" and UCase(Property("IsServerOS")) = "TRUE" Then
		
			'Server SKU Scenarios
			IF Property("OSSKU") = "SERVERSTANDARD" and (Ucase(Property("ImageFlags")) = "SERVERENTERPRISE") Then
				' OK
			ElseIF Property("OSSKU") = "SERVERENTERPRISE" and (Ucase(Property("ImageFlags")) = "SERVERDATACENTER") Then
				' OK
			ElseIF Property("OSSKU") = "SERVERWEB" and (Ucase(Property("ImageFlags")) = "SERVERSTANDARD") Then
				' OK
			ElseIF Property("OSSKU") = "SERVERSTANDARDCORE" and (Ucase(Property("ImageFlags")) = "SERVERENTERPRISECORE") Then
				' OK
			ElseIF Property("OSSKU") = "SERVERENTERPRISECORE" and (Ucase(Property("ImageFlags")) = "SERVERDATACENTERCORE") Then
				' OK
			Else
				sReason = "Server 6.x upgrade from %OSSKU% to %ImageFlags% is not allowed"
			End if

		End IF
		
		If not isEmpty(sReason) Then
			DTRadio2.Disabled = True
			oLogging.CreateEntry oEnvironment.Substitute("Upgrade not supported from %OSVERSION%-%OSSKU%  to %ImageBuild%-%ImageFlags%  Reason: " & sReason ) , LogTypeInfo
		End if
		
	End function


Function InitializeDomainMembership
	Dim oLDAP, oOptOU, oItem
	Dim sFoundFile
	Dim iRetVal


	' Warn user if image capture is required to select Workgroup

	If UCase(Property("SkipCapture")) = "NO" Then
		DisplayCaptureWarning.style.display = "inline"
	Else
		DisplayCaptureWarning.style.display = "none"
	End If


	If Workgroup.value <> "" then
		JDRadio2.checked = TRUE
	ElseIf JoinDomain.Value = "" then
		On Error Resume Next
		JoinDomain.value = CreateObject("ADSystemInfo").DomainShortName
		On Error Goto 0

		If JoinDomain.Value = "" then
			Workgroup.value = "WORKGROUP"
			JDRadio2.checked = TRUE
		Else
			JDRadio1.checked = TRUE
			' Domain.value = JoinDomain.Value

			On error resume next
			' Will extract out the existing OU (if any) for the current machine.
			set oLDAP = GetObject("LDAP://" & CreateObject("ADSystemInfo").ComputerName)
			MachineObjectOU.Value = oLDAP.Get("Organizational-Unit-Name")
			On error goto 0

		End if
	End if


	''''''''''''''''''''''''''''''''
	'
	' Populate OU method #1 - Query ADSI
	'

	MachineObjectOUOptionalBtn.style.display =  "none"


	''''''''''''''''''''''''''''''''
	'
	' Populate OU method #2 - Read MachineObjectOUOptional[1...n] property
	'

	If MachineObjectOUOptionalBtn.style.display <> "inline" then
		oOptOU = Property("DomainOUs")
		If isarray(oOptOU) then

			For each oItem in oOptOU
				AddItemToMachineObjectOUOpt oItem
			Next
			MachineObjectOUOptionalBtn.style.display = "inline"

		ElseIf oOptOU <> "" then
			AddItemToMachineObjectOUOpt oOptOU
		End if
	End if


	''''''''''''''''''''''''''''''''
	'
	' Populate OU method #3 - Read ...\control\DomainOUList.xml
	'
	' Example:
	'	<?xml version="1.0" encoding="utf-8"?>
	'	<DomainOUs>
	'		<DomainOU>OU=Test1</DomainOU>
	'		<DomainOU>OU=Test2</DomainOU>
	'	</DomainOUs>
	'

	If MachineObjectOUOptionalBtn.style.display <> "inline" then
	
		iRetVal = oUtility.FindFile( "DomainOUList.xml" , sFoundFile)
		if iRetVal = SUCCESS then
			For each oItem in oUtility.CreateXMLDOMObjectEx( sFoundFile ).selectNodes("//DomainOUs/DomainOU")
				AddItemToMachineObjectOUOpt oItem.text
			Next
		End if
	End if

	If MachineObjectOUOptionalBtn.style.display = "inline" then

		document.body.onMouseDown = getRef("DomainMouseDown")
		document.body.onKeyDown   = getRef("MachineObjectOUOptionalKeyPress")

	End if

	ValidateDomainMembership

End Function


Function MachineObjectOUOptionalKeyPress

	dim OUOpt

	on error resume next
	set OUOpt = MachineObjectOUOptional
	on error goto 0

	If isempty(OUOpt) then
		KeyHandler
	ElseIf window.event.srcElement is MachineObjectOUOptional then
		If window.event.keycode = 13 then
		' Enter
			MachineObjectOU.value = MachineObjectOUOptional.value
			PopupBox.style.display = "none"

		ElseIf window.event.keycode = 27 then
			' escape
			PopupBox.style.display = "none"
		End if
	Else
		KeyHandler
	End if

End function


Function DomainMouseDown
	If not window.event.srcElement is MachineObjectOUOptional and not window.event.srcElement is MachineObjectOUOptionalBtn then
		PopupBox.style.display = "none"
	End if
End function


Function HideUnHideComboBox

	If UCase(PopupBox.style.display) <> "NONE" then

		HideUnhide PopupBox, FALSE

		document.body.onMouseDown = ""
		document.body.onKeyDown   = getRef("KeyHandler")

	Else

		HideUnhide PopupBox, TRUE
		MachineObjectOUOptional.focus

		document.body.onMouseDown = getRef("DomainMouseDown")
		document.body.onKeyDown   = getRef("MachineObjectOUOptionalKeyPress")

	End if

End function


Function InitializeUserDataLocation

	' We muck arround with the values, so we need to do some manual cleanup

	If UCase(property("UserDataLocation")) = "" then

	ElseIf UCase(property("UserDataLocation")) = "AUTO" then
		AllowLocal.Checked = TRUE
		UDRadio1.click
		UDRadio1.value = "AUTO"

	ElseIf UCase(property("UserDataLocation")) = "NONE" then
		UDRadio3.click

	ElseIf UCase(property("UserDataLocation")) = "NETWORK" then
		AllowLocal.Checked = FALSE
		UDRadio1.click
		UDRadio1.value = "NETWORK"


	Else
		DataPath.Value = property("UserDataLocation")
		UDRadio2.click
	End if


	If property("DeploymentType") = "REPLACE" then

		If UDRadio3.Checked then
			UDRadio2.Click
		End if
		UDRadio3.Disabled = TRUE

	End if

	If (property("UDShare") = "" or property("UDDir") = "") and property("DeploymentType") <> "REFRESH" then

		If UDRadio1.Checked then
			UDRadio2.Click
		End if
		UDRadio1.Disabled = TRUE

	End if

	ValidateUserDataLocation

End function


Function InitializeUserDataRestoreLocation

	' If the user data location is AUTO or NETWORK, reset it to none for bare metal

	If UCase(Property("UserDataLocation")) = "AUTO" or UCase(Property("UserDataLocation")) = "NETWORK" then
		oProperties("UserDataLocation") = "NONE"
	End if


	' Make sure the right radio button is set

	If UCase(Property("UserDataLocation")) = "NONE" OR Property("UserDataLocation") = "" then
		UDRadio1.click
	Else
		StatePath.value = Property("UserDataLocation")
		UDRadio2.click
	End if

End Function


Function InitializeComputerBackupLocation

	' We muck arround with the values, so we need to do some manual cleanup
	
	If Ucase(property("DeploymentType")) = "REPLACE" then
	
		CBRadio1.Disabled = TRUE
		AllowLocal.Checked = FALSE

		If UCase(property("ComputerBackupLocation")) = "NONE" or Ucase(oEnvironment.Item("ComputerBackupLocation")) = "NONE" then
			CBRadio3.click

		Else
			CBRadio2.click
			If UCase(property("ComputerBackupLocation")) <> "NETWORK" then
				DataPath.Value = property("ComputerBackupLocation")
			End if

		End if

	ElseIf UCase(property("ComputerBackupLocation")) = "" then

		If Property("BackupShare") <> ""AND Property("BackupDir") <> "" Then
			DataPath.value = Property("BackupShare") & "\" & Property("BackupDir")
			CBRadio2.click
		End If
		
	ElseIf UCase(property("ComputerBackupLocation")) = "AUTO" or Ucase(oEnvironment.Item("ComputerBackupLocation")) = "AUTO" then
		AllowLocal.Checked = TRUE
		CBRadio1.click

	ElseIf UCase(property("ComputerBackupLocation")) = "NONE" or Ucase(oEnvironment.Item("ComputerBackupLocation")) = "NONE" then
		CBRadio3.click

	ElseIf UCase(property("ComputerBackupLocation")) = "NETWORK" or Ucase(oEnvironment.Item("ComputerBackupLocation")) = "NETWORK" then
		CBRadio1.Disabled = TRUE
		AllowLocal.Checked = FALSE
		CBRadio2.click
		If Property("BackupShare") <> ""AND Property("BackupDir") <> "" Then
			DataPath.value = Property("BackupShare") & "\" & Property("BackupDir")
		End if

	Else
		DataPath.Value = property("ComputerBackupLocation")
		CBRadio2.click
	End if

	ValidateComputerBackupLocation

End function


'''''''''''''''''''''''''''''''''''''
'  Image List
'

Dim g_oTaskSequences
Dim g_AllOperatingSystems

Function oTaskSequences

	If isempty(g_oTaskSequences) then
	
		oLogging.CreateEntry "Begin InitializeTSList...", LogTypeVerbose

		set g_oTaskSequences = new ConfigFile
		g_oTaskSequences.sFileType = "TaskSequences"
		g_oTaskSequences.sSelectionProfile = oEnvironment.Item("WizardSelectionProfile")
		g_oTaskSequences.sCustomSelectionProfile = oEnvironment.Item("CustomWizardSelectionProfile")
		g_oTaskSequences.sHTMLPropertyHook = " onPropertyChange='TSItemChange'"
		set g_oTaskSequences.fnCustomFilter = GetRef("CustomTSFilter")
		
		oLogging.CreateEntry "Finished InitializeTSList...", LogTypeVerbose
		
	End if
	set oTaskSequences = g_oTaskSequences
	
End function


Function AllOperatingSystems


	Dim oOSes

	If isempty(g_AllOperatingSystems) then
	
		set oOSes = new ConfigFile
		oOSes.sFileType = "OperatingSystems"
		oOSes.bMustSucceed = false
		
		set g_AllOperatingSystems = oOSes.FindAllItems
		
	End if

	set AllOperatingSystems = g_AllOperatingSystems

End function


Function InitializeTSList
	Dim oItem, sXPathOld
	
	If oEnvironment.Item("TaskSequenceID") <> "" and oProperties("TSGuid") = "" then
		
		sXPathOld = oTaskSequences.xPathFilter
		for each oItem in oTaskSequences.oControlFile.SelectNodes( "/*/*[ID = '" & oEnvironment.Item("TaskSequenceID")&"']")
			oLogging.CreateEntry "TSGuid changed via TaskSequenceID = " & oEnvironment.Item("TaskSequenceID"), LogTypeInfo
			oEnvironment.Item("TSGuid") = oItem.Attributes.getNamedItem("guid").value
			exit for
		next
		
		oTaskSequences.xPathFilter = sXPathOld 
		
	End if

	TSListBox.InnerHTML = oTaskSequences.GetHTMLEx ( "Radio", "TSGuid" )
	
	PopulateElements
	TSItemChange

End function

function CustomTSFilter( sGuid, oItem )

	' Hook for ZTIConfigFile.vbs. Return True only if the Item should be displayed, otherwise false.
	Dim oTaskList
	Dim oTaskOsGuid	
	Dim oOS
	DIm sOSPlatform
	
	Set oTaskList = oUtility.LoadConfigFileSafe( "Control\" & oUtility.SelectSingleNodeString(oItem,"ID") & "\TS.xml")
	Set oTaskOsGuid = oTaskList.SelectSingleNode("//globalVarList/variable[@name='OSGUID']")
	
	CustomTSFilter = True

	If oTaskOsGuid is Nothing then

		' This Task Sequence does not have any associated OS, allways include

	ElseIf not AllOperatingSystems.Exists(oTaskOsGuid.text) then

		' This Task Sequence does not have any associated OS, allways include
		oLogging.CreateEntry "ERROR: Invalid OS GUID " & oTaskOsGuid.text & " specified for task sequence " & oUtility.SelectSingleNodeString(oItem,"ID"), LogTypeInfo

	Else
	
		set oOS = AllOperatingSystems.Item(oTaskOsGuid.text)
		
		If not oOS.selectSingleNode("SMSImage") is nothing then
			If ucase(oUtility.SelectSingleNodeString(oOS,"SMSImage")) = "TRUE" then
				oLogging.CreateEntry "Skip SMS OS " & oUtility.SelectSingleNodeString(oItem,"ID"), LogTypeVerbose
				CustomTSFilter = False
				exit function
			End if
		End if
		
		if not oOS.selectSingleNode("Platform") is nothing then
		
			sOSPlatform = oUtility.SelectSingleNodeString(oOS,"Platform")
			
			If oEnv("SystemDrive") = "X:" and UCase(sOSPlatform) <> UCase(oEnvironment.Item("Architecture")) then
			
				oLogging.CreateEntry "Skip CrossPlatform OS in WinPE  " & sOSPlatform & "   " & oUtility.SelectSingleNodeString(oItem,"ID"), LogTypeVerbose
				CustomTSFilter = False
				
			ElseIf Instr(1, Property("CapableArchitecture"), sOSPlatform, vbTextCompare) = 0 then
			
				oLogging.CreateEntry "Not Capable of running Platform: " & sOSPlatform & "   " & oUtility.SelectSingleNodeString(oItem,"ID"), LogTypeVerbose
				CustomTSFilter = False
			
			End if
		
		End if
		
	End if 
	
end function


Function TSItemChange

	Dim oInput
	ButtonNext.Disabled = TRUE
	
	for each oInput in document.getElementsByName("TSGuid")
		If oInput.Checked then
			oLogging.CreateEntry "Found CHecked Item: " & oInput.Value, LogTypeVerbose
		
			ButtonNext.Disabled = FALSE
			exit function
		End if
	next

End function


Function SetTimeZoneValue
	' When the user selects a value in the TimeZoneList we must populate the hidden Text Values
	Dim TimeSplit

	TimeSplit = split( TimeZoneList.value , ";" )
	If ubound(TimeSplit) < 1 then
	ElseIf not isNumeric(TimeSplit(0)) then
	Else
		TimeZoneName.Value = TimeSplit(1)
		TimeZone.Value = TimeSplit(0)
	End if

End function


Function TimeZone_Initialization

	Dim TimeZone, i, TimeSplit, Item, test

	'If either of the TimeZone Properties have been set, then select the coresponding list item.
	If Property("TimeZone") <> "" or Property("TimeZoneName") <> "" then
		For i = 0 to TimeZoneList.Options.Length - 1

			TimeSplit = split( TimeZoneList.Options(i).value , ";" )

			If ubound(TimeSplit) >= 1 then
				If Property("TimeZone") <> "" then
					If IsNumeric(Property("TimeZone")) then
						' Check Windows XP style Name
						If CInt(Property("TimeZone")) = cint(TimeSplit(0)) then
							TimeZoneList.SelectedIndex = i
							SetTimeZoneValue
							Exit function
						End if
					Else
						' Check Windows Vista Style Name
						If UCase(Property("TimeZone")) = UCase(TimeSplit(1)) then
							TimeZoneList.SelectedIndex = i
							SetTimeZoneValue
							Exit function
						End if
					End if
				ElseIf Property("TimeZoneName") <> "" then
					' Check Windows Vista Style Name
					If UCase(Property("TimeZoneName")) = UCase(TimeSplit(1)) then
						TimeZoneList.SelectedIndex = i
						SetTimeZoneValue
						Exit function
					End if
				End if
			End if
		Next
	End if

	' Extract out the current TimeZone
	For each TimeZone in objWMI.InstancesOf("Win32_TimeZone")
		Exit for ' Take the first entry and break out of loop
	Next

	If IsEmpty(TimeZone) then
		Exit function
	End if

	'Try to match the timezone against the current Timezone Name
	For i = 0 to TimeZoneList.Options.Length - 1

		TimeSplit = split( TimeZoneList.Options(i).value , ";" )

		If UBound(TimeSplit) >= 1 then
			' Compare the Description
			If UCase(TimeZoneList.Options(i).Text) = UCase(TimeZone.Description) then
				TimeZoneList.SelectedIndex = i
				SetTimeZoneValue
				Exit function
			End if

			' See if there is a match in the alternate description or other Values
			For each test in array(TimeZone.Description,TimeZone.StandardName)
				If test <> "" then
					For each item in TimeSplit
						If Item <> "" then

							If UCase(test) = UCase(Item) then
								TimeZoneList.SelectedIndex = i
								SetTimeZoneValue
								Exit function
							End if

						End if
					Next
				End if
			Next

		End if
	Next


	' Try to match against the closest GMT value (This *May* select an entry that is not *exact*)
	For i = 0 to TimeZoneList.Options.Length - 1

		test = Instr(1, TimeZone.Description," ")
		If test <> 0 then

			If left(TimeZone.Description, test) = left(TimeZoneList.Options(i).Text, test) then
				TimeZoneList.SelectedIndex = i
				SetTimeZoneValue
				Exit function
			End if

		End if
	Next

End function


Function FindTaskSequenceStep(sStepType, sScriptCmd )
	Dim oTaskList
	Dim oAction
	Dim oItem
	Dim oOptionDiableVal
	
	Set oTaskList = oUtility.LoadConfigFileSafe( Property("TaskSequenceID") & "\TS.XML" )
	set oItem = oTaskList.SelectNodes(sStepType)
	
	If not oItem is nothing then
		oLogging.CreateEntry "Found Task Sequence Item: " & sStepType, LogTypeInfo
		
	ElseIf len(sScriptCmd) > 0 then

		oLogging.CreateEntry "Unable to find Task Sequence step of type " & sStepType & ", performing more exhaustive search...", LogTypeInfo
		For each oAction in oTaskList.SelectNodes("//action")
			If instr(1,oAction.XML,sScriptCmd,vbTExtCompare) <> 0 then
				oLogging.CreateEntry "Found Task Sequence Item: " & sScriptCmd, LogTypeInfo
				set oItem = oAction
				exit for
			End if
		Next

	End if
	
	' Verify this step is not "disabled"...
	If oItem is nothing then 
		oLogging.CreateEntry "Unable to find Task Sequence step of type " & sStepType , LogTypeInfo
		FindTaskSequenceStep = False
	Else
		'Loop through each step in the collection until first enabled step and exit the loop
		For each oOptionDiableVal in oItem
			set oAction = oOptionDiableVal.Attributes.getNamedItem("disable")
			If  oAction is nothing then
				FindTaskSequenceStep = true
				
			Else
				FindTaskSequenceStep = lcase(oAction.Value) <> "true"
				
				If FindTaskSequenceStep = true then
					Exit For
				End If
			End if
		Next

		oLogging.CreateEntry "Found Task Sequence step of type " & sStepType & " = " & FindTaskSequenceStep, LogTypeInfo

	End if
End function

'''''''''''''''''''''''''''''''''''''''''''
'  Application List
'

Dim g_sApplicationDialog

Function IsThereAtLeastOneApplicationPresent

	Dim oXMLAppList
	Dim dXMLCollection
	Dim oTaskList
	Dim oAction

	set oXMLAppList = new ConfigFile
	oXMLAppList.sFileType = "Applications"
	oXMLAppList.sSelectionProfile = oEnvironment.Item("WizardSelectionProfile")
	oXMLAppList.sCustomSelectionProfile = oEnvironment.Item("CustomWizardSelectionProfile")

	set dXMLCollection = oXMLAppList.FindItems

	If dXMLCollection.count = 0 then
		IsThereAtLeastOneApplicationPresent = False
		g_sApplicationDialog = ""
		Exit Function
	End if

	IsThereAtLeastOneApplicationPresent = FindTaskSequenceStep( "//step[@type='BDD_InstallApplication' and ./defaultVarList/variable[@name='ApplicationGUID'] and ./defaultVarList[variable='']]", "ZTIApplications.wsf" )

	If IsThereAtLeastOneApplicationPresent then
		g_sApplicationDialog = oXMLAppList.GetHTMLEx( "CheckBox", "Applications" ) 
	End if

	set oXMLAppList = nothing

End function

Function InitializeApplicationList

	AppListBox.InnerHTML = g_sApplicationDialog
	PopulateElements

End Function


Function ReadyInitializeApplicationList
	Dim oInput, oApplicationList, oAppItem

	If not ImageList.readystate = "complete" then
		Exit function
	End if

	Set oApplicationList = document.getElementsByName("Applications")

	If oApplicationList is nothing then
		Exit function
	ElseIf oApplicationList.Length < 1 then
		Exit function
	End if

	For each oInput in oApplicationList
		If UCase(document.all.item(oInput.SourceIndex - 1).TagName) = "INPUT" then
			If oInput.Value = "" then
				document.all.item(oInput.SourceIndex - 1).Disabled = TRUE
				document.all.item(oInput.SourceIndex - 1).Style.Display = "none"
			Else
				document.all.item(oInput.SourceIndex - 1).Style.Display = "inline"
				If not IsEmpty(Property("Applications"))then
					For each oAppItem in Property("Applications")
						If UCase(oAppItem) = UCase(oInput.Value) then
							document.all.item(oInput.SourceIndex - 1).checked = TRUE
							Exit for
						End if
					Next
				End if
				If not IsEmpty(Property("MandatoryApplications"))then
					For each oAppItem in Property("MandatoryApplications")
						If UCase(oAppItem) = UCase(oInput.Value) then
							document.all.item(oInput.SourceIndex - 1).disabled = TRUE
							document.all.item(oInput.SourceIndex - 1).checked = TRUE
							Exit for
						End if
					Next
				End if

			End if
		End if

	Next

End function

Sub AppItemChange

	document.all.item(window.event.srcElement.SourceIndex + 1).Disabled = not window.event.SrcElement.checked

End sub


'
' Will return a dictionary object containing all Friendly Names Given a GUID as string, this funtion will search all *.xml files in the deployroot for a match.
'
Function GetFriendlyNamesofGUIDs

	Dim oFiles
	Dim oFolder
	Dim oXMLFile
	Dim oXMLNode
	Dim sName
	Dim GuidList

	Set GuidList = CreateObject("Scripting.Dictionary")
	GuidList.CompareMode = vbTextCompare

	Set oFolder = oFSO.GetFolder( oEnvironment.Item("DeployRoot") & "\control" )
	If oFolder is nothing then
		oLogging.CreateEntry oUtility.ScriptName & " Unable to find DeployRoot!", LogTypeError
		Exit function
	End if

	For each oFiles in oFolder.Files

		If UCase(right(oFIles.Name, 4)) = ".XML" then
			Set oXMLFile = oUtility.CreateXMLDOMObjectEx( oFiles.Path )
			If not oXMLFile is nothing then

				for each oXMLNode in oXMLFile.selectNodes("//*/*[@guid]")

					if not oXMLNode.selectSingleNode("./Name") is nothing then
						sName = oUtility.SelectSingleNodeString(oXMLNode,"./Name")

						if not oXMLNode.selectSingleNode("./Language") is nothing then
							if oUtility.SelectSingleNodeString(oXMLNode,"./Language") <> "" then
								sName = sName & " ( " & oUtility.SelectSingleNodeString(oXMLNode,"./Language") & " )"
							end if
						end if

						if not oXMLNode.Attributes.getNamedItem("guid") is nothing then
							if oXMLNode.Attributes.getNamedItem("guid").value <> "" and sName <> "" then
								if not GuidList.Exists(oXMLNode.Attributes.getNamedItem("guid").value) then
									GuidList.Add oXMLNode.Attributes.getNamedItem("guid").value, sName
								end if
							end if
						end if
					end if

				next

			End if
		End if

	Next

	set GetFriendlyNamesofGUIDs = GuidList
End function


Function PrepareFinalScreen

	Dim GuidList
	Dim p, i, item, Buffer

	set GuidList = GetFriendlyNamesofGUIDs

	Dim re, Match

	For each p in oProperties.Keys

		If IsObject(oProperties(p)) or IsArray(oProperties(p)) then
			i = 1
			For each item in oProperties(p)
				If Item <> "" then
					oStrings.AddToList Buffer, p & i &  " = """ & item & """", vbNewLine
					i = i + 1
				End if
					
			next
		ElseIf ucase(p) = "DEFAULTDESTINATIONDISK" then
			' Skip...
		ElseIf ucase(p) = "DEFAULTDESTINATIONPARTITION" then
			' Skip...
		ElseIf ucase(p) = "DEFAULTDESTINATIONISDIRTY" then
			' Skip...
		ElseIf ucase(p) = "KEYBOARDLOCALE_EDIT" then
			' Skip...
		ElseIf ucase(p) = "USERLOCALE_EDIT" then
			' Skip...
		ElseIf oProperties(p) = "" then
			' Skip...
		ElseIf Instr(1, p, "Password" , vbTextCompare ) <> 0 then
			oStrings.AddToList Buffer, p & " = ""***********""", vbNewLine
		else
			oStrings.AddToList Buffer, p & " = """ & oProperties(p) & """", vbNewLine
		end if
	Next

	'
	' Given a text string containing GUID ID's of configuration entries on the deployment share
	'   This function will search/replace all GUID's within the text blob.
	'
	Set re = new regexp
	re.IgnoreCase = True
	re.Global = True
	re.Pattern = "\{[A-F0-9]{8}\-[A-F0-9]{4}\-[A-F0-9]{4}\-[A-F0-9]{4}\-[A-F0-9]{12}\}"

	On error resume next
	Do while re.Test( Buffer )
		For each Match in re.execute(Buffer)
			Buffer = mid(Buffer,1,Match.FirstIndex) & _
				GuidList.Item(Match.Value) & _
				mid(Buffer,Match.FirstIndex+match.Length+1)
			Exit for
		Next
	Loop
	On error goto 0

	optionalWindow1.InnerText = Buffer

End function


Function InitializeCapture

	If Ucase(Property("ComputerBackupLocation")) = "NETWORK" OR Ucase(oEnvironment.Item("ComputerBackupLocation")) = "NETWORK" Then
		If Property("BackupShare") <> ""AND Property("BackupDir") <> "" Then
			ComputerBackupLocation.value = Property("BackupShare") & "\" & Property("BackupDir")
		ElseIF oEnvironment.Item("BackupShare") <> "" AND oEnvironment.Item("BackupDir") <> "" Then
			ComputerBackupLocation.value = oEnvironment.Item("BackupShare") & "\" & oENvironment.Item("BackupDir")
		Else
			ComputerBackupLocation.value = Property("DeployRoot") & "\Captures"
		End If
	End If
	If Property("ComputerBackupLocation") = "" then
		ComputerBackupLocation.value = Property("DeployRoot") & "\Captures"
	End if
	If Property("BackupFile") = "" then
		BackupFile.value = Property("TaskSequenceID") & ".wim"
	End if
	
	RMPropIfFound("BdePin")
	RMPropIfFound("BdeModeSelect1")
	RMPropIfFound("BdeModeSelect2")
	RMPropIfFound("BdeKeyLocation")
	RMPropIfFound("OSDBitLockerWaitForEncryption")
	RMPropIfFound("BdeRecoveryKey")
	RMPropIfFound("BdeRecoveryPassword")
	RMPropIfFound("BdeInstallSuppress")

	
End Function


dim g_oXMLLanguageList

Function oXMLLanguageList

	If IsEmpty(g_oXMLLanguageList) then
		Set g_oXMLLanguageList = oUtility.LoadConfigFileSafe( "scripts\ListOfLanguages.xml" )
	End if
	Set oXMLLanguageList = g_oXMLLanguageList

End function

dim g_oPackageGroup

''''''''''''''''''''''''''''''''''''''

Function ConstructLPQuery ( isLangPack )
	Dim Keyword
	Dim isServer
	Dim ImgBuild
	Dim SPVersion
	Dim LPQuery
	Dim LPVersion
	Dim i

	isServer  = inStr(1,oEnvironment.Item("ImageFlags"),"SERVER",vbTextCompare) <> 0
	ImgBuild  = oEnvironment.Item("ImageBuild")

	If not isLangPack then
		LPQuery = "PackageType != 'LanguagePack' and (substring(ProductVersion,1,8) = '" & left(ImgBuild,8) & "' or ProductVersion = '') "
    ElseIf isServer and left(ImgBuild,4) = "6.0." then
        ' All Windows Server 2008 Language Packs use Product Version 6.0.6001.18000
        LPQuery = "PackageType = 'LanguagePack' and (ProductName = 'Microsoft-Windows-Server-LanguagePack-Package' or ProductName = 'Microsoft-Windows-Server-Refresh-LanguagePack-Package') and substring(ProductVersion,1,8) = '6.0.6001' "
    ElseIf left(ImgBuild,4) = "6.0." then
        ' All Windows Vista Language Packs use Product Version 6.0.6000.16386
        LPQuery = "PackageType = 'LanguagePack' and (ProductName = 'Microsoft-Windows-Client-LanguagePack-Package' or ProductName = 'Microsoft-Windows-Client-Refresh-LanguagePack-Package') and substring(ProductVersion,1,8) = '6.0.6000' "
    ElseIf isServer then
        LPQuery = "PackageType = 'LanguagePack' and (ProductName = 'Microsoft-Windows-Server-LanguagePack-Package' or ProductName = 'Microsoft-Windows-Server-Refresh-LanguagePack-Package') and substring(ProductVersion,1,7) = '" & left(ImgBuild,7) & "' and substring(ProductVersion,5,4) >= '" & mid(ImgBuild,5,4) & "'"
    Else
        LPQuery = "PackageType = 'LanguagePack' and (ProductName = 'Microsoft-Windows-Client-LanguagePack-Package' or ProductName = 'Microsoft-Windows-Client-Refresh-LanguagePack-Package') and substring(ProductVersion,1,7) = '" & left(ImgBuild,7) & "' and substring(ProductVersion,5,4) >= '" & mid(ImgBuild,5,4) & "'" 
    End if

	If not isLangPack then
		' Nothing
	ElseIf left(ImgBuild,4) = "6.0." then
		LPVersion = Mid(ImgBuild,8,1)
		If IsNumeric(LPVersion) and LPVersion > 0 then
			' Exclude all Language Packs that are less than the Current OS.
			LPQuery = LPQuery & " and Keyword != 'Language Pack'"
			For i = 2 to LPVersion
				LPQuery = LPQuery & " and Keyword != 'SP" & (LPVersion - 1) & " Language Pack'"
			Next
		End if
	End if

	If UCase(oEnvironment.Item("ImageProcessor")) = "X64" then
		LPQuery = "//packages/package[ProcessorArchitecture = 'amd64' and " & LPQuery & "]"
	Else
		LPQuery = "//packages/package[ProcessorArchitecture = 'x86' and " & LPQuery & "]"
	End if

	oLogging.CreateEntry vbTab & "QUERY: " & LPQuery, LogTypeInfo
	ConstructLPQuery = LPQuery

End function

Dim g_sPackageDialogBox

Function CanDisplayPackageDialogBox

	Dim oXMLPackageList
	Dim dXMLCollection
	Dim LocalLanguage
	Dim oItem
	Dim sInputType
	Dim sDone
	Dim oNewItem
	Dim sToAdd

	set oXMLPackageList = new ConfigFile
	oXMLPackageList.sFileType = "Packages"
	oXMLPackageList.sSelectionProfile = oEnvironment.Item("WizardSelectionProfile")
	oXMLPackageList.sCustomSelectionProfile = oEnvironment.Item("CustomWizardSelectionProfile")
	set oXMLPackageList.fnCustomFilter = GetRef("CustomPackageFilter")
	
	set dXMLCollection = oXMLPackageList.FindItemsEx(ConstructLPQuery(TRUE))

	If dXMLCollection.count = 0 then
		CanDisplayPackageDialogBox = False
		Exit Function
	End if

	CanDisplayPackageDialogBox = TRUE	
	oLogging.CreateEntry "CanDisplayPackageDialogBox = TRUE", LogTypeVerbose	
	

	If Property("DeploymentType") = "UPGRADE" and not IsInstallationUltimateEnterprise then
		LocalLanguage = GetParentLanguageFromLocale(GetDefaultInstallationLanguageString)

		'If this is an upgrade, then skip if the current Language is equal to the language of the OS Selected.
		For each oItem in oEnvironment.ListItem("ImageLanguage").Keys
			If oItem <> "" then
				If GetParentLanguageFromLocale(oItem) = LocalLanguage then
					CanDisplayPackageDialogBox = FALSE
					Exit function
					' No need to set USERLOCAL and KEYBOARDLOCALE, OS will handle properly.
				End if
			End if
		Next


		' If the current language is available as a package, then auto-select package
		For each oItem in oXMLPackageList.selectNodes(ConstructLPQuery(TRUE) & "/Language")
			If GetParentLanguageFromLocale(oItem.TExt) = LocalLanguage then
				If oEnvironment.Item("LanguagePacks001") = "" then
					oEnvironment.Item("LanguagePacks001") = oItem.ParentNode.Attributes.getNamedItem("guid").value
					CanDisplayPackageDialogBox = FALSE
					Exit for
				End if
			End if
		Next

	End if


	' Ultimate and Enterprise SKU's allow for more than one Language Pack to be installed at a time.
	If IsInstallationUltimateEnterprise Then
		g_sPackageDialogBox = oXMLPackageList.GetHTMLEx( "CheckBox", "LanguagePacks" ) 
	Else
		' Convert property LanguagePacks back into a non-array if it's an array. 
		If isArray(property("LanguagePacks")) then
			oProperties.Item("LanguagePacks") = property("LanguagePacks")(0)
		End if

		g_sPackageDialogBox = oXMLPackageList.GetHTMLEx( "Radio", "LanguagePacks" ) 
	End if
	

	' Ensure that the default Language Pack has been added to the list.	
	for each oItem in oEnvironment.ListItem("ImageLanguage").Keys
		g_sPackageDialogBox = "</label>&nbsp;&nbsp;<b>(Already installed in OS)</b></div>" & vbNewLine & g_sPackageDialogBox
		g_sPackageDialogBox = "<img src='ItemIcon1.png' /><label for='DefaultLP' class=TreeItem>" & MarkupName(oItem) & g_sPackageDialogBox
		If IsInstallationUltimateEnterprise Then
			g_sPackageDialogBox = "<input name=LanguagePacks type=checkbox id='DefaultLP' value='DEFAULT' checked disabled />" & g_sPackageDialogBox
		ElseIf property("LanguagePacks") <> "" then
			g_sPackageDialogBox = "<input name=LanguagePacks type=Radio id='DefaultLP' value='DEFAULT' />" & g_sPackageDialogBox
		Else 
			g_sPackageDialogBox = "<input name=LanguagePacks type=Radio id='DefaultLP' value='DEFAULT' checked />" & g_sPackageDialogBox
		End if			
		g_sPackageDialogBox = "<div onmouseover=""javascript:this.className = 'DynamicListBoxRow-over';"" onmouseout=""javascript:this.className = 'DynamicListBoxRow';"" >" & g_sPackageDialogBox 
	next
	
		
	set oXMLPackageList = nothing

End function


Function LanguagePack_Initialization

	If g_sPackageDialogBox = "" then
		CanDisplayPackageDialogBox
	End if 

	PackagesListBox.InnerHTML = g_sPackageDialogBox
	PopulateElements
	
End function

Function CustomPackageFilter( sGuid, oItem )

	CustomPackageFilter = True
	oItem.SelectSingleNode("./Name").Text = MarkupName (oUtility.SelectSingleNodeString(oItem,"./Language"))
	
End function 


Function MarkupName(LocaleName)

	Dim oLang, width

	width = 99
	For each oLang in oXMLLanguageList.selectNodes("//LOCALEDATA/LOCALE/SISO639LANGNAME")
		If Instr(1,LocaleName,oLang.Text & "-", vbTextCompare) = 1 and len(oLang.Text) < width then

			width = len(oLang.Text)
			MarkupName = "Language Pack - " & _
				unescape(replace(oUtility.SelectSingleNodeString(oLang.ParentNode,"SENGLANGUAGE"),"\x","%u")) & " (" & _
				LocaleName & ") - " & _
				unescape(replace(oUtility.SelectSingleNodeString(oLang.ParentNode,"SNATIVELANGNAME") ,"\x","%u"))
			
		End if
	Next

End Function 


function AddLanguage( LanugageToAdd )

	Dim oLang, oOption2, sLangToAdd
	
	' sLangToAdd = GetParentLanguageFromLocale(LanugageToAdd)
	sLangToAdd = LanugageToAdd

	For each oLang in oXMLLanguageList.selectNodes("//LOCALEDATA/LOCALE[IFLAGS='1' and SNAME]")

		If ucase(oUtility.SelectSingleNodeString(oLang,"SNAME")) = ucase(LanugageToAdd) then
			Set oOption2 = document.createElement("OPTION")
			oOption2.Text = left( oUtility.SelectSingleNodeString(oLang,"SENGDISPLAYNAME") & space( 40 ), 40 ) & _
			vbTab & vbTab & vbTab & "-     " &  unescape(replace( oUtility.SelectSingleNodeString(oLang,"SNATIVEDISPLAYNAME") ,"\x","%u"))
			If not oLang.SelectSingleNode("SNAME") is nothing then
				oOption2.Value = lcase(oUtility.SelectSingleNodeString(oLang,"SNAME"))
				UILanguage.add oOption2
			End if 
			
			Exit for
		End if

	Next

End function


Function Locale_Initialization

	Dim oItem
	Dim oXMLPackageList
	Dim FoundLocale
	Dim AllreadyAddedLanguages
	Dim aLangPack
	Dim oOption2
	Dim thisLocale
	
	g_sPackageDialogBox = ""

	oLogging.CreateEntry "###### Locale_Initialization ###### " , LogTypeInfo
	
	' Add a Language for each package selected
	set oXMLPackageList = new ConfigFile
	oXMLPackageList.sFileType = "Packages"

	
	If IsInstallationUltimateEnterprise then
	
		' Add langauges allready installed on the image.
		AllreadyAddedLanguages = ""
		For each oItem in oEnvironment.ListItem("ImageLanguage").Keys
			If oItem <> "" then
				AddLanguage oItem
				AllreadyAddedLanguages = AllreadyAddedLanguages & vbTab & oItem
			End if
		Next

	End if 

	aLangPack = property("LanguagePacks")
	If not isArray(aLangPack) then
		' Force LanguagePacks variable as an array for non Ultimate/Enterprise builds.		
		aLangPack = array(aLangPack)
		oProperties.Item("LanguagePacks") = aLangPack
	End if
	
	For each oItem in aLangPack

		FoundLocale = ""
		If oItem = "DEFAULT" then
			' Skip...
		ElseIf not oXMLPackageList is nothing then

			If oXMLPackageList.FindAllItems.Exists(oItem) then
				FoundLocale = oUtility.SelectSingleNodeString(oXMLPackageList.FindAllItems.Item(oItem),"./Language")
			End if

		End if

		If FoundLocale <> "" and Instr(1,AllreadyAddedLanguages, FoundLocale, vbTextCompare ) = 0 then
			AddLanguage FoundLocale
			AllreadyAddedLanguages = AllreadyAddedLanguages & vbTab & FoundLocale
		End if

	Next
	
	If AllreadyAddedLanguages = "" then
	
		For each oItem in oEnvironment.ListItem("ImageLanguage").Keys
			If oItem <> "" then
				AddLanguage oItem
				AllreadyAddedLanguages = AllreadyAddedLanguages & vbTab & oItem
			End if
		Next

	End if 

	ForceLCase "UILanguage"
	ForceLCase "UserLocale"
	ForceLCase "KeyboardLocale"

	oLogging.CreateEntry "Languages Displayed: " & AllreadyAddedLanguages , LogTypeInfo
	oLogging.CreateEntry "UILanguage: " & property("UILanguage") , LogTypeVerbose
	
	' Populate the Locale
	For each oItem in oXMLLanguageList.selectNodes("//LOCALEDATA/LOCALE[IFLAGS='1']")

		Set oOption2 = document.createElement("OPTION")
		oOption2.Text = left( oUtility.SelectSingleNodeString(oItem,"SENGDISPLAYNAME")  & space( 30 ), 30) & _
		vbTab & vbTab & vbTab & "-     " &  unescape(replace( oUtility.SelectSingleNodeString(oItem,"SNATIVEDISPLAYNAME") ,"\x","%u")) 

		oOption2.Value = lcase(oUtility.SelectSingleNodeString(oItem,"./SNAME") & ";" & oUtility.SelectSingleNodeString(oItem,"ILANGUAGE"))
		UserLocale_Edit.add oOption2
	Next

	PopulateElements

	' Get default Language and populate
	If UILanguage.Value <> "" then
		thisLocale = UILanguage.Value

	Elseif Property("UILanguage") <> "" then
		thisLocale = Property("UILanguage")
	
	ElseIf oEnvironment.Item("ImageLanguage001") <> "" then
		thisLocale = oEnvironment.Item("ImageLanguage001")
		
	Else
		thisLocale = GetDefaultInstallationLocaleString
		
	End if
	If IsEmpty(thisLocale) then
		thisLocale = "en-US" ' WinPE *may* not have the locale defined
	End if


	SetNewLanguageEx thisLocale
	SetNewLocaleEx thisLocale

End function

Function ForceLCase( sPropertyName )
	If Property(sPropertyName) <> lcase(Property(sPropertyName)) then
		If oProperties.Exists(sPropertyName) then
			oProperties.Item(sPropertyName) = lcase(oProperties.Item(sPropertyName))
		Else
			oProperties.Add  sPropertyName, lcase(Property(sPropertyName))
		End if 
		
	End if 

End function

Function SetNewLanguage
	If oProperties.exists("UserLocale") then
		oProperties.remove "UserLocale"
	End if
	SetNewLanguageEx UILanguage.Value
	SetNewLocale
End Function


Function SetNewLocale
	If instr(1,UserLocale_Edit.Value,";",vbTextCompare) <> 0 then
		If oProperties.exists("KeyboardLocale") then
			oProperties.remove "KeyboardLocale"
		End if
		SetNewLocaleEx mid(UserLocale_Edit.Value,1,instr(1,UserLocale_Edit.Value,";",vbTextCompare) - 1)
	End if
End Function


Function SetNewLanguageEx( thisLocale )
	Dim LCID
	
	oLogging.CreateEntry "SetNewLanguageEx " & thisLocale, LogTypeVerbose

	' Get the default UserLocale
	If Property("UserLocale") <> "" then
		UserLocale_Edit.Value = lcase(Property("UserLocale") & ";" & GetLCIDFromSName( Property("UserLocale") ))
	ElseIf instr(1,Property("KeyboardLocale"),":",vbTextCompare) <> 0 and len(trim(Property("KeyboardLocale"))) = len("0000:12345678") then
		LCID = left(Property("KeyboardLocale"),instr(1,Property("KeyboardLocale"),":",vbTextCompare)-1)
		UserLocale_Edit.Value = lcase(GetSNameFromLCID(LCID) & ";" & LCID)
	Else
		UserLocale_Edit.Value = lcase(thisLocale & ";" & GetLCIDFromSName( thisLocale ))
	End if
	
	oLogging.CreateEntry "UserLocale : " & Property("UserLocale") & " - " &   UserLocale_Edit.Value, LogTypeVerbose
	
	If Property("ImageLanguage001") = "" then
		oProperties.Add  "ImageLanguage001", thisLocale
	End if


End function


Function SetNewLocaleEx (thisLocale)
	Dim sKeyboard
	Dim sItem
	Dim sNew
	oLogging.CreateEntry "SetNewLocaleEx " & thisLocale & " - " & Property("KeyboardLocale"), LogTypeVerbose
	
	' Set the default Keyboard

	sNew = ""
	If Property("KeyboardLocale") <> "" then
		sKeyboard = Property("KeyboardLocale")
		If instr(1,sKeyboard,";",vbTExtCompare) <> 0 then
			' Use the 1st instance of a ; delimited array that contains a :
			for each sItem in split(sKeyboard,";")
				If instr(1,sItem,":",vbTextCompare) <> 0 then
					sKeyboard = trim(sItem)
					exit for
				End if
			next
			If isempty(sKeyboard) then
				sKeyboard = trim(left(sKeyboard,instr(1,sKeyboard,";",vbTExtCompare)-1))
			End if 
		End if
		If instr(1,sKeyboard,":",vbTextCompare) <> 0 and len(sKeyboard) = len("0000:12345678") then
			' KeyboardLocale appears to be in the format 0409:00000409 format
			sNew = mid(sKeyboard,instr(1,sKeyboard,":",vbTextCompare)+1)
		ElseIf instr(1,sKeyboard,"-",vbTextCompare) <> 0 Then
			sNew = right("00000000" & GetLCIDFromSName(sKeyboard),8)
		End if 
	End if

	If sNew = "" Then
		sNew = right("00000000" & GetKeyboardFromSName(thisLocale),8)
	End if 
	KeyboardLocale_Edit.Value = lcase(sNew)
	
	If KeyboardLocale_Edit.Value = "" then
		KeyboardLocale_Edit.Value = "00000409"
	End if

	oLogging.CreateEntry "KeyboardLocale: " & Property("KeyboardLocale") & " - " & KeyboardLocale_Edit.Value & " - " & sNew, LogTypeVerbose

End function


''''''''''''''''''''''''''''''''

Function GetDefaultInstallationLocaleString

	Dim oItem


	' First see if a UserLocal value was specified

	If Property("UserLocale") <> "" then

		Set oItem = oXMLLanguageList.SelectSingleNode("//LOCALEDATA/LOCALE[@ID = '" & lcase(Property("UserLocale")) & "']/SNAME")

		If not oItem is nothing then
			GetDefaultInstallationLocaleString = oItem.Text
			Exit Function
		End if

	End if


	' No, so get the default locale

	Set oItem = oXMLLanguageList.SelectSingleNode("//LOCALEDATA/LOCALE[@ID = '" & lcase(right("0000" & hex(GetLocale),4)) & "']/SNAME")

	If not oItem is nothing then
		GetDefaultInstallationLocaleString = oItem.Text
	End if


End function


Function GetDefaultInstallationLanguageString

	GetDefaultInstallationLanguageString = GetParentLanguageFromLocale(GetDefaultInstallationLocaleString)

End function


Function GetParentLanguageFromLocale( Locale)
	Dim oLocale

	For each oLocale in oXMLLanguageList.selectNodes("//LOCALEDATA/LOCALE/SNAME")

		If UCase(Locale) = UCase(oLocale.text) then
			GetParentLanguageFromLocale = oUtility.SelectSingleNodeString(oLocale.ParentNode,"SISO639LANGNAME")
			Exit for
		End if

	Next

End function

Function GetSNameFromLCID ( LCID )

	GetSNameFromLCID  = oUtility.SelectSingleNodeString(oXMLLanguageList,"/LOCALEDATA/LOCALE[@ID='" & lcase(LCID) & "']/SNAME")
	
End function 

Function GetKeyboardFromSName ( sName )

	Dim oLocale

	For each oLocale in oXMLLanguageList.selectNodes("//LOCALEDATA/LOCALE/SNAME")

		If UCase(sName) = UCase(oLocale.text) then
			GetKeyboardFromSName = oUtility.SelectSingleNodeString(oLocale.ParentNode,"DEFAULTKEYBOARD")
			Exit for
		End if

	Next

End Function 

Function GetLCIDFromSName ( sName )

	Dim oLocale

	For each oLocale in oXMLLanguageList.selectNodes("//LOCALEDATA/LOCALE/SNAME")

		If UCase(sName) = UCase(oLocale.text) then
			GetLCIDFromSName = oUtility.SelectSingleNodeString(oLocale.ParentNode,"ILANGUAGE")
			Exit for
		End if

	Next

End Function 

''''''''''''''''''''''''''''''''

Function IsInstallationUltimateEnterprise

	IsInstallationUltimateEnterprise = oUtility.IsHighEndSKUEx( oEnvironment.Item("ImageFlags") )

End function


Function InitializeProductKey

	' Figure out how to initialize the pane.

	If Property("ProductKey") <> "" or Left(Property("ImageBuild"), 1) < "6" then
		locProductKey.disabled = false
		locProductKey.value = Property("ProductKey")
		ProductKey.value = locProductKey.value
		If Left(Property("ImageBuild"), 1) >= "6" then
			PKRadio3.click
			locOverrideProductKey.disabled = true
			OverrideProductKey.value = ""
		End if
	ElseIf Property("OverrideProductKey") <> "" then
		PKRadio2.click
		locOverrideProductKey.disabled = false
		locProductKey.disabled = true
		locOverrideProductKey.value = Property("OverrideProductKey")
		OverrideProductKey.value = locOverrideProductKey.value
		ProductKey.value = ""
	Else
		PKRadio1.click
		locOverrideProductKey.disabled = true
		locProductKey.disabled = true
		ProductKey.value = ""
		OverrideProductKey.value = ""
	End if

End Function


Function InitializeBDE

	Dim sType
	
	sType = ucase(Property("BdeInstall"))
	If sType = "" then
		sType = ucase(Property("OSDBitLockerMode"))
	End if
	
	Select Case sType
	Case "TPM"
		BdeRadio2.checked = true
		BdeModeRadio1.checked = true
	Case "TPMKEY"
		BdeRadio2.checked = true
		BdeModeRadio2.checked = true
		If Property("BdeKeyLocation") <> "" then
			BdeModeSelect1.Value = ucase(Property("BdeKeyLocation"))
		ElseIf Property("OSDBitLockerStartupKeyDrive") <> "" then
			BdeModeSelect1.Value = ucase(Property("OSDBitLockerStartupKeyDrive"))
		End if
	Case "KEY"
		BdeRadio2.checked = true
		BdeModeRadio3.checked = true
		If Property("BdeKeyLocation") <> "" then
			BdeModeSelect2.Value = ucase(Property("BdeKeyLocation"))
		ElseIf Property("OSDBitLockerStartupKeyDrive") <> "" then
			BdeModeSelect2.Value = ucase(Property("OSDBitLockerStartupKeyDrive"))
		End if
	Case "TPMPIN"
		BdeRadio2.checked = true
		BdeModeRadio4.checked = true
	Case Else
		BdeRadio1.Checked = true
	End Select

	If UCase(Property("BdeRecoveryKey")) = "AD" or UCase(Property("OSDBitLockerCreateRecoveryPassword")) = "AD" Then
		ADButton1.checked = True
	Else
		ADButton2.Checked = True
	End if 
	
	WaitForEncryption.checked = ucase(Property("OSDBitLockerWaitForEncryption")) = "TRUE" or  ucase(Property("BdeWaitForEncryption")) = "TRUE"

	BdeInstallSuppress.value = "YES"
End Function


Function InitializeComputerName

	If oEnvironment.Item("OSDComputerName") = "" then
		OSDComputerName.Value = oUtility.ComputerName 
	End If

End Function


Function InitializeDestinationDisk
	Dim oOption
	Dim oDisk, oDisks
	Dim i
	Dim bFound

	Dim sDestDisk
	Dim sDestPart


	InvalidDisk.style.display = "none"
	InvalidPartition.style.display = "none"

	' Preference search order is: oProperties, oEnvironment/CS.INI , and TS.XML ( DefaultDestinationXxx )
	sDestDisk = GetDestDisk
	sDestPart = GetDestPart


	If not HasGoodDestDisk( sDestDisk ) then
		InvalidDisk.style.display = "inline"
	ElseIf not HasGoodDestPart ( sDestDisk, sDestPart ) then
		InvalidPartition.style.display = "inline"
	End if 

	oLogging.CreateEntry "InitializeDestination Disk: [" & sDestDisk & "]  Partition: [" & sDestPart & "]", LogTypeInfo

	Set oDisks = objWMI.ExecQuery("Select index from Win32_DiskDrive where MediaType like 'Fixed%hard disk%'")
	
	For Each oDisk in oDisks

		Set oOption = document.CreateElement("OPTION")
		oOption.Value = oDisk.Index
		oOption.Text = oOption.Value
		If sDestDisk = cstr(oDisk.Index) then
			oOption.Selected = true
		End if
		DestinationDisk.Add oOption

	Next

	For i = 1 to 128

		Set oOption = document.CreateElement("OPTION")
		oOption.Value = i
		oOption.Text = i
		If sDestPart = cstr(i) then
			oOption.Selected = true
		End if
		DestinationPartition.Add oOption

	Next

End Function		

