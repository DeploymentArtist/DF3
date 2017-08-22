<%@ Control Language="VB" Inherits="System.Web.Mvc.ViewUserControl(Of MaikKoster.MDT.Model.Setting)" %>
<%=Html.ValidationSummary("Edit was unsuccessful. Please correct the errors and try again.")%>
<%  Using Html.BeginForm("Edit", "Setting", New With {.IdentityType = ViewData("IdentityType"), .IdentityID = ViewData("IdentityID")}, FormMethod.Post, New With {.Class = "MDTForm"})%>
    <%=Html.Hidden("Type", Model.Type)%>
    <%=Html.Hidden("ID", Model.ID)%>
    <p class="clear">
        <input type="submit" value="Save" name="EditSettings" class="ui-state-default fg-button ui-corner-all" />
        <input type="submit" value="Cancel" name="EditSettings" class="ui-state-default fg-button ui-corner-all" />
    </p>
    
    <div class="ui-widget ui-widget-content ui-corner-all Settings">
        <div class="ui-helper-reset ui-helper-clearfix">
            <div class="ui-widget-header collapsible category">
                Bitlocker
            </div>
            <table width="100%">
                <tr>
                    <td class="settingname">
                        BdeDriveLetter
                    </td>
                    <td class="settingvalue">
                        <%=Html.TextBox("BdeDriveLetter", Model.BdeDriveLetter)%>
                    </td>
                </tr>
                <tr>
                    <td class="settingname">
                        BdeDriveSize
                    </td>
                    <td class="settingvalue">
                        <%=Html.TextBox("BdeDriveSize", Model.BdeDriveSize)%>
                    </td>
                </tr>
                <tr>
                    <td class="settingname">
                        BdeInstall
                    </td>
                    <td class="settingvalue">
                        <%=Html.TextBox("BdeInstall", Model.BdeInstall)%>
                    </td>
                </tr>
                <tr>
                    <td class="settingname">
                        BdeKeyLocation
                    </td>
                    <td class="settingvalue">
                        <%=Html.TextBox("BdeKeyLocation", Model.BdeKeyLocation)%>
                    </td>
                </tr>
                <tr>
                    <td class="settingname">
                        BdePin
                    </td>
                    <td class="settingvalue">
                        <%=Html.TextBox("BdePin", Model.BdePin)%>
                    </td>
                </tr>
                <tr>
                    <td class="settingname">
                        BdeRecoveryKey
                    </td>
                    <td class="settingvalue">
                        <%=Html.TextBox("BdeRecoveryKey", Model.BdeRecoveryKey)%>
                    </td>
                </tr>
                <tr>
                    <td class="settingname">
                        TpmOwnerPassword
                    </td>
                    <td class="settingvalue">
                        <%=Html.TextBox("TpmOwnerPassword", Model.TpmOwnerPassword)%>
                    </td>
                </tr>
            </table>
        </div>
        <div>
            <div class="ui-widget-header collapsible category">
                Display Settings
            </div>
            <table width="100%">
                <tr>
                    <td class="settingname">
                        BitsPerPel
                    </td>
                    <td class="settingvalue">
                        <%=Html.TextBox("BitsPerPel", Model.BitsPerPel)%>
                    </td>
                </tr>
                <tr>
                    <td class="settingname">
                        Vrefresh
                    </td>
                    <td class="settingvalue">
                        <%=Html.TextBox("Vrefresh", Model.Vrefresh)%>
                    </td>
                </tr>
                <tr>
                    <td class="settingname">
                        Xresolution
                    </td>
                    <td class="settingvalue">
                        <%=Html.TextBox("Xresolution", Model.Xresolution)%>
                    </td>
                </tr>
                <tr>
                    <td class="settingname">
                        Yresolution
                    </td>
                    <td class="settingvalue">
                        <%=Html.TextBox("Yresolution", Model.Yresolution)%>
                    </td>
                </tr>
            </table>
        </div>
        <div>   
            <div class="ui-widget-header collapsible category">
                Domain and Workgroup
            </div>
            <table width="100%">
                <tr>
                    <td class="settingname">
                        DomainAdmin
                    </td>
                    <td class="settingvalue">
                        <%=Html.TextBox("DomainAdmin", Model.DomainAdmin)%>
                    </td>
                </tr>
                <tr>
                    <td class="settingname">
                        DomainAdminDomain
                    </td>
                    <td class="settingvalue">
                        <%=Html.TextBox("DomainAdminDomain", Model.DomainAdminDomain)%>
                    </td>
                </tr>
                <tr>
                    <td class="settingname">
                        DomainAdminPassword
                    </td>
                    <td class="settingvalue">
                        <%=Html.Password("DomainAdminPassword", Model.DomainAdminPassword)%>
                    </td>
                </tr>
                <tr>
                    <td class="settingname">
                        JoinDomain
                    </td>
                    <td class="settingvalue">
                        <%=Html.TextBox("JoinDomain", Model.JoinDomain)%>
                    </td>
                </tr>
                <tr>
                    <td class="settingname">
                        JoinWorkGroup
                    </td>
                    <td class="settingvalue">
                        <%=Html.TextBox("JoinWorkGroup", Model.JoinWorkGroup)%>
                    </td>
                </tr>
                <tr>
                    <td class="settingname">
                        MachineObjectOU
                    </td>
                    <td class="settingvalue">
                        <%=Html.TextBox("MachineObjectOU", Model.MachineObjectOU)%>
                    </td>
                </tr>
            </table>
        </div>
        <div>  
            <div class="ui-widget-header collapsible category">
                Identification
            </div>
            <table width="100%">
                <tr>
                    <td class="settingname">
                        ComputerName
                    </td>
                    <td class="settingvalue">
                        <%=Html.TextBox("ComputerName", Model.ComputerName)%>
                    </td>
                </tr>
                <tr>
                    <td class="settingname">
                        FullName
                    </td>
                    <td class="settingvalue">
                        <%=Html.TextBox("FullName", Model.FullName)%>
                    </td>
                </tr>
                <tr>
                    <td class="settingname">
                        OrgName
                    </td>
                    <td class="settingvalue">
                        <%=Html.TextBox("OrgName", Model.OrgName)%>
                    </td>
                </tr>
            </table>
        </div>
        <div>  
            <div class="ui-widget-header collapsible category">
                Miscellaneous
            </div>
            <table width="100%">
                <tr>
                    <td class="settingname">
                        AdminPassword
                    </td>
                    <td class="settingvalue">
                        <%=Html.Password("AdminPassword", Model.AdminPassword)%>
                    </td>
                </tr>
                <tr>
                    <td class="settingname">
                        BuildID
                    </td>
                    <td class="settingvalue">
                        <%=Html.TextBox("BuildID", Model.BuildID)%>
                    </td>
                </tr>
                <tr>
                    <td class="settingname">
                        DoCapture
                    </td>
                    <td class="settingvalue">
                        <%=Html.TextBox("DoCapture", Model.DoCapture)%>
                    </td>
                </tr>
                <tr>
                    <td class="settingname">
                        DriverGroup
                    </td>
                    <td class="settingvalue">
                        <%=Html.TextBox("DriverGroup", Model.DriverGroup)%>
                    </td>
                </tr>
                <tr>
                    <td class="settingname">
                        EventShare
                    </td>
                    <td class="settingvalue">
                        <%=Html.TextBox("EventShare", Model.EventShare)%>
                    </td>
                </tr>
                <tr>
                    <td class="settingname">
                        Home_Page
                    </td>
                    <td class="settingvalue">
                        <%=Html.TextBox("Home_Page", Model.Home_Page)%>
                    </td>
                </tr>
                <tr>
                    <td class="settingname">
                        OSInstall
                    </td>
                    <td class="settingvalue">
                        <%=Html.TextBox("OSInstall", Model.OSInstall)%>
                    </td>
                </tr>
                <tr>
                    <td class="settingname">
                        OverrideProductKey
                    </td>
                    <td class="settingvalue">
                        <%=Html.TextBox("OverrideProductKey", Model.OverrideProductKey)%>
                    </td>
                </tr>
                <tr>
                    <td class="settingname">
                        ProductKey
                    </td>
                    <td class="settingvalue">
                        <%=Html.TextBox("ProductKey", Model.ProductKey)%>
                    </td>
                </tr>
                <tr>
                    <td class="settingname">
                        ResourceRoot
                    </td>
                    <td class="settingvalue">
                        <%=Html.TextBox("ResourceRoot", Model.ResourceRoot)%>
                    </td>
                </tr>
                <tr>
                    <td class="settingname">
                        ServerA
                    </td>
                    <td class="settingvalue">
                        <%=Html.TextBox("ServerA", Model.ServerA)%>
                    </td>
                </tr>
                <tr>
                    <td class="settingname">
                        ServerB
                    </td>
                    <td class="settingvalue">
                        <%=Html.TextBox("ServerB", Model.ServerB)%>
                    </td>
                </tr>
                <tr>
                    <td class="settingname">
                        ServerC
                    </td>
                    <td class="settingvalue">
                        <%=Html.TextBox("ServerC", Model.ServerC)%>
                    </td>
                </tr>
                <tr>
                    <td class="settingname">
                        SLShare
                    </td>
                    <td class="settingvalue">
                        <%=Html.TextBox("SLShare", Model.SLShare)%>
                    </td>
                </tr>
                <tr>
                    <td class="settingname">
                        WDSServer
                    </td>
                    <td class="settingvalue">
                        <%=Html.TextBox("WDSServer", Model.WDSServer)%>
                    </td>
                </tr>
                <tr>
                    <td class="settingname">
                        UserID
                    </td>
                    <td class="settingvalue">
                        <%=Html.TextBox("UserID", Model.UserID)%>
                    </td>
                </tr>
                <tr>
                    <td class="settingname">
                        UserDomain
                    </td>
                    <td class="settingvalue">
                        <%=Html.TextBox("UserDomain", Model.UserDomain)%>
                    </td>
                </tr>
                <tr>
                    <td class="settingname">
                        UserPassword
                    </td>
                    <td class="settingvalue">
                        <%=Html.Password("UserPassword", Model.UserPassword)%>
                    </td>
                </tr>
            </table>
        </div>
        <div>  
            <div class="ui-widget-header collapsible category">
                Regional and Locale Settings
            </div>
            <table width="100%">
                <tr>
                    <td class="settingname">
                        AreaCode
                    </td>
                    <td class="settingvalue">
                        <%=Html.TextBox("AreaCode", Model.AreaCode)%>
                    </td>
                </tr>
                <tr>
                    <td class="settingname">
                        CountryCode
                    </td>
                    <td class="settingvalue">
                        <%=Html.TextBox("CountryCode", Model.CountryCode)%>
                    </td>
                </tr>
                <tr>
                    <td class="settingname">
                        Dialing
                    </td>
                    <td class="settingvalue">
                        <%=Html.TextBox("Dialing", Model.Dialing)%>
                    </td>
                </tr>
                <tr>
                    <td class="settingname">
                        InputLocale
                    </td>
                    <td class="settingvalue">
                        <%=Html.TextBox("InputLocale", Model.InputLocale)%>
                    </td>
                </tr>
                <tr>
                    <td class="settingname">
                        KeyboardLocale
                    </td>
                    <td class="settingvalue">
                        <%=Html.TextBox("KeyboardLocale", Model.KeyboardLocale)%>
                    </td>
                </tr>
                <tr>
                    <td class="settingname">
                        LongDistanceAccess
                    </td>
                    <td class="settingvalue">
                        <%=Html.TextBox("LongDistanceAccess", Model.LongDistanceAccess)%>
                    </td>
                </tr>
                <tr>
                    <td class="settingname">
                        TimeZone
                    </td>
                    <td class="settingvalue">
                        <%=Html.TextBox("TimeZone", Model.TimeZone)%>
                    </td>
                </tr>
                <tr>
                    <td class="settingname">
                        TimeZoneName
                    </td>
                    <td class="settingvalue">
                        <%=Html.TextBox("TimeZoneName", Model.TimeZoneName)%>
                    </td>
                </tr>
                <tr>
                    <td class="settingname">
                        UILanguage
                    </td>
                    <td class="settingvalue">
                        <%=Html.TextBox("UILanguage", Model.UILanguage)%>
                    </td>
                </tr>
                <tr>
                    <td class="settingname">
                        UserLocale
                    </td>
                    <td class="settingvalue">
                        <%=Html.TextBox("UserLocale", Model.UserLocale)%>
                    </td>
                </tr>
            </table>
        </div>
        <div>  
            <div class="ui-widget-header collapsible category">
                SMS 2003 OSD
            </div>
            <table width="100%">
                <tr>
                    <td class="settingname">
                        OSDINSTALLPACKAGE
                    </td>
                    <td class="settingvalue">
                        <%=Html.TextBox("OSDINSTALLPACKAGE", Model.OSDINSTALLPACKAGE)%>
                    </td>
                </tr>
                <tr>
                    <td class="settingname">
                        OSDINSTALLPROGRAM
                    </td>
                    <td class="settingvalue">
                        <%=Html.TextBox("OSDINSTALLPROGRAM", Model.OSDINSTALLPROGRAM)%>
                    </td>
                </tr>
                <tr>
                    <td class="settingname">
                        OSDINSTALLSILENT
                    </td>
                    <td class="settingvalue">
                        <%=Html.TextBox("OSDINSTALLSILENT", Model.OSDINSTALLSILENT)%>
                    </td>
                </tr>
                <tr>
                    <td class="settingname">
                        OSDMP
                    </td>
                    <td class="settingvalue">
                        <%=Html.TextBox("OSDMP", Model.OSDMP)%>
                    </td>
                </tr>
                <tr>
                    <td class="settingname">
                        OSDNEWMACHINENAME
                    </td>
                    <td class="settingvalue">
                        <%=Html.TextBox("OSDNEWMACHINENAME", Model.OSDNEWMACHINENAME)%>
                    </td>
                </tr>
                <tr>
                    <td class="settingname">
                        OSDSITECODE
                    </td>
                    <td class="settingvalue">
                        <%=Html.TextBox("OSDSITECODE", Model.OSDSITECODE)%>
                    </td>
                </tr>
            </table>
        </div>
        <div>  
            <div class="ui-widget-header collapsible category">
                User Data
            </div>
            <table width="100%">
                <tr>
                    <td class="settingname">
                        BackupDir
                    </td>
                    <td class="settingvalue">
                        <%=Html.TextBox("BackupDir", Model.BackupDir)%>
                    </td>
                </tr>
                <tr>
                    <td class="settingname">
                        BackupShare
                    </td>
                    <td class="settingvalue">
                        <%=Html.TextBox("BackupShare", Model.BackupShare)%>
                    </td>
                </tr>
                <tr>
                    <td class="settingname">
                        CaptureGroups
                    </td>
                    <td class="settingvalue">
                        <%=Html.TextBox("CaptureGroups", Model.CaptureGroups)%>
                    </td>
                </tr>
                <tr>
                    <td class="settingname">
                        ComputerBackupLocation
                    </td>
                    <td class="settingvalue">
                        <%=Html.TextBox("ComputerBackupLocation", Model.ComputerBackupLocation)%>
                    </td>
                </tr>
                <tr>
                    <td class="settingname">
                        LoadStateArgs
                    </td>
                    <td class="settingvalue">
                        <%=Html.TextBox("LoadStateArgs", Model.LoadStateArgs)%>
                    </td>
                </tr>
                <tr>
                    <td class="settingname">
                        ScanStateArgs
                    </td>
                    <td class="settingvalue">
                        <%=Html.TextBox("ScanStateArgs", Model.ScanStateArgs)%>
                    </td>
                </tr>
                <tr>
                    <td class="settingname">
                        UDDir
                    </td>
                    <td class="settingvalue">
                        <%=Html.TextBox("UDDir", Model.UDDir)%>
                    </td>
                </tr>
                <tr>
                    <td class="settingname">
                        UDProfiles
                    </td>
                    <td class="settingvalue">
                        <%=Html.TextBox("UDProfiles", Model.UDProfiles)%>
                    </td>
                </tr>
                <tr>
                    <td class="settingname">
                        UDShare
                    </td>
                    <td class="settingvalue">
                        <%=Html.TextBox("UDShare", Model.UDShare)%>
                    </td>
                </tr>
                <tr>
                    <td class="settingname">
                        UserDataLocation
                    </td>
                    <td class="settingvalue">
                        <%=Html.TextBox("UserDataLocation", Model.UserDataLocation)%>
                    </td>
                </tr>
            </table>
        </div>
        <div>  
            <div class="ui-widget-header collapsible category">
                User Data
            </div>
            <table width="100%">
                <tr>
                    <td class="settingname">
                        SkipAdminPassword
                    </td>
                    <td class="settingvalue">
                        <%=Html.TextBox("SkipAdminPassword", Model.SkipAdminPassword)%>
                    </td>
                </tr>
                <tr>
                    <td class="settingname">
                        SkipApplications
                    </td>
                    <td class="settingvalue">
                        <%=Html.TextBox("SkipApplications", Model.SkipApplications)%>
                    </td>
                </tr>
                <tr>
                    <td class="settingname">
                        SkipAppsOnUpgrade
                    </td>
                    <td class="settingvalue">
                        <%=Html.TextBox("SkipAppsOnUpgrade", Model.SkipAppsOnUpgrade)%>
                    </td>
                </tr>
                <tr>
                    <td class="settingname">
                        SkipBDDWelcome
                    </td>
                    <td class="settingvalue">
                        <%=Html.TextBox("SkipBDDWelcome", Model.SkipBDDWelcome)%>
                    </td>
                </tr>
                <tr>
                    <td class="settingname">
                        SkipBitLocker
                    </td>
                    <td class="settingvalue">
                        <%=Html.TextBox("SkipBitLocker", Model.SkipBitLocker)%>
                    </td>
                </tr>
                <tr>
                    <td class="settingname">
                        SkipBitLockerDetails
                    </td>
                    <td class="settingvalue">
                        <%=Html.TextBox("SkipBitLockerDetails", Model.SkipBitLockerDetails)%>
                    </td>
                </tr>
                <tr>
                    <td class="settingname">
                        SkipBuild
                    </td>
                    <td class="settingvalue">
                        <%=Html.TextBox("SkipBuild", Model.SkipBuild)%>
                    </td>
                </tr>
                <tr>
                    <td class="settingname">
                        SkipCapture
                    </td>
                    <td class="settingvalue">
                        <%=Html.TextBox("SkipCapture", Model.SkipCapture)%>
                    </td>
                </tr>
                <tr>
                    <td class="settingname">
                        SkipComputerBackup
                    </td>
                    <td class="settingvalue">
                        <%=Html.TextBox("SkipComputerBackup", Model.SkipComputerBackup)%>
                    </td>
                </tr>
                <tr>
                    <td class="settingname">
                        SkipComputerName
                    </td>
                    <td class="settingvalue">
                        <%=Html.TextBox("SkipComputerName", Model.SkipComputerName)%>
                    </td>
                </tr>
                <tr>
                    <td class="settingname">
                        SkipDeploymentType
                    </td>
                    <td class="settingvalue">
                        <%=Html.TextBox("SkipDeploymentType", Model.SkipDeploymentType)%>
                    </td>
                </tr>
                <tr>
                    <td class="settingname">
                        SkipDomainMembership
                    </td>
                    <td class="settingvalue">
                        <%=Html.TextBox("SkipDomainMembership", Model.SkipDomainMembership)%>
                    </td>
                </tr>
                <tr>
                    <td class="settingname">
                        SkipFinalSummary
                    </td>
                    <td class="settingvalue">
                        <%=Html.TextBox("SkipFinalSummary", Model.SkipFinalSummary)%>
                    </td>
                </tr>
                <tr>
                    <td class="settingname">
                        SkipLocaleSelection
                    </td>
                    <td class="settingvalue">
                        <%=Html.TextBox("SkipLocaleSelection", Model.SkipLocaleSelection)%>
                    </td>
                </tr>
                <tr>
                    <td class="settingname">
                        SkipPackageDisplay
                    </td>
                    <td class="settingvalue">
                        <%=Html.TextBox("SkipPackageDisplay", Model.SkipPackageDisplay)%>
                    </td>
                </tr>
                <tr>
                    <td class="settingname">
                        SkipProductKey
                    </td>
                    <td class="settingvalue">
                        <%=Html.TextBox("SkipProductKey", Model.SkipProductKey)%>
                    </td>
                </tr>
                <tr>
                    <td class="settingname">
                        SkipSummary
                    </td>
                    <td class="settingvalue">
                        <%=Html.TextBox("SkipSummary", Model.SkipSummary)%>
                    </td>
                </tr>
                <tr>
                    <td class="settingname">
                        SkipTimeZone
                    </td>
                    <td class="settingvalue">
                        <%=Html.TextBox("SkipTimeZone", Model.SkipTimeZone)%>
                    </td>
                </tr>
                <tr>
                    <td class="settingname">
                        SkipUserData
                    </td>
                    <td class="settingvalue">
                        <%=Html.TextBox("SkipUserData", Model.SkipUserData)%>
                    </td>
                </tr>
                <tr>
                    <td class="settingname">
                        SkipWizard
                    </td>
                    <td class="settingvalue">
                        <%=Html.TextBox("SkipWizard", Model.SkipWizard)%>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    
    <%-- 
    <div class="ui-widget ui-widget-content ui-corner-all Settings">
        <div class="ui-helper-reset ui-helper-clearfix">
            <div class="ui-widget-header collapsible">
                Bitlocker
            </div>
            <ul>
                <li>
                    <%=Html.EditField("BdeDriveLetter", Model.BdeDriveLetter)%>
                </li>
                <li>
                    <%=Html.EditField("BdeDriveSize", Model.BdeDriveSize)%>
                </li>
                <li>
                    <%=Html.EditField("BdeInstall", Model.BdeInstall)%>
                </li>
                <li>
                    <%=Html.EditField("BdeKeyLocation", Model.BdeKeyLocation)%>
                </li>
                <li>
                    <%=Html.EditField("BdePin", Model.BdePin)%>
                </li>
                <li>
                    <%=Html.EditField("BdeRecoveryKey", Model.BdeRecoveryKey)%>
                </li>
                <li>TmpOwnerPassword
                    <%=Html.EditPasswordField("TpmOwnerPassword", Model.TpmOwnerPassword)%>
                </li>
            </ul>
        </div>
        <div class="ui-helper-reset ui-helper-clearfix">
            <div class="ui-widget-header collapsible">
                Display Settings
            </div>
            <ul>
                <li>
                    <%=Html.EditField("BitsPerPel", Model.BitsPerPel)%>
                </li>
                <li>
                    <%=Html.EditField("Vrefresh", Model.Vrefresh)%>
                </li>
                <li>
                    <%=Html.EditField("Xresolution", Model.Xresolution)%>
                </li>
                <li>
                    <%=Html.EditField("Yresolution", Model.Yresolution)%>
                </li>
            </ul>
        </div>
        <div class="ui-helper-reset ui-helper-clearfix">
            <div class="ui-widget-header collapsible">
                Domain and Workgroup
            </div>
            <ul>
                <li>
                    <%=Html.EditField("DomainAdmin", Model.DomainAdmin)%>
                </li>
                <li>
                    <%=Html.EditField("DomainAdminDomain", Model.DomainAdminDomain)%>
                </li>
                <li>
                    <%=Html.EditPasswordField("DomainAdminPassword", Model.DomainAdminPassword)%>
                </li>
                <li>
                    <%=Html.EditField("JoinDomain", Model.JoinDomain)%>
                </li>
                <li>
                    <%=Html.EditField("JoinWorkGroup", Model.JoinWorkGroup)%>
                </li>
                <li>
                    <%=Html.EditField("MachineObjectOU", Model.MachineObjectOU)%>
                </li>
            </ul>
        </div>
        <div class="ui-helper-reset ui-helper-clearfix">
            <div class="ui-widget-header collapsible">
                Identification
            </div>
            <ul>
                <li>
                    <%=Html.EditField("ComputerName", Model.ComputerName)%>
                </li>
                <li>
                    <%=Html.EditField("FullName", Model.FullName)%>
                </li>
                <li>
                    <%=Html.EditField("OrgName", Model.OrgName)%>
                </li>
            </ul>
        </div>
        <div class="ui-helper-reset ui-helper-clearfix">
            <div class="ui-widget-header collapsible">
                Miscellaneous
            </div>
            <ul>
                <li>
                    <%=Html.EditPasswordField("AdminPassword", Model.AdminPassword)%>
                </li>
                <li>
                    <%=Html.EditField("BuildID", Model.BuildID)%>
                </li>
                <li>
                    <%=Html.EditField("DoCapture", Model.DoCapture)%>
                </li>
                <li>
                    <%=Html.EditField("DriverGroup", Model.DriverGroup)%>
                </li>
                <li>
                    <%=Html.EditField("EventShare", Model.EventShare)%>
                </li>
                <li>
                    <%=Html.EditField("Home_Page", Model.Home_Page)%>
                </li>
                <li>
                    <%=Html.EditField("OSInstall", Model.OSInstall)%>
                </li>
                <li>
                    <%=Html.EditField("OverrideProductKey", Model.OverrideProductKey)%>
                </li>
                <li>
                    <%=Html.EditField("ProductKey", Model.ProductKey)%>
                </li>
                <li>
                    <%=Html.EditField("ResourceRoot", Model.ResourceRoot)%>
                </li>
                <li>
                    <%=Html.EditField("ServerA", Model.ServerA)%>
                </li>
                <li>
                    <%=Html.EditField("ServerB", Model.ServerB)%>
                </li>
                <li>
                    <%=Html.EditField("ServerC", Model.ServerC)%>
                </li>
                <li>
                    <%=Html.EditField("SLShare", Model.SLShare)%>
                </li>
                <li>
                    <%=Html.EditField("WDSServer", Model.WDSServer)%>
                </li>
                <li>
                    <%=Html.EditField("UserID", Model.UserID)%>
                </li>
                <li>
                    <%=Html.EditField("UserDomain", Model.UserDomain)%>
                </li>
                <li>
                    <%=Html.EditPasswordField("UserPassword", Model.UserPassword)%>
                </li>
            </ul>
        </div>
        <div class="ui-helper-reset ui-helper-clearfix">
            <div class="ui-widget-header collapsible">
                Regional and Locale Settings
            </div>
            <ul>
                <li>
                    <%=Html.EditField("AreaCode", Model.AreaCode)%>
                </li>
                <li>
                    <%=Html.EditField("CountryCode", Model.CountryCode)%>
                </li>
                <li>
                    <%=Html.EditField("Dialing", Model.Dialing)%>
                </li>
                <li>
                    <%=Html.EditField("InputLocale", Model.InputLocale)%>
                </li>
                <li>
                    <%=Html.EditField("KeyboardLocale", Model.KeyboardLocale)%>
                </li>
                <li>
                    <%=Html.EditField("LongDistanceAccess", Model.LongDistanceAccess)%>
                </li>
                <li>
                    <%=Html.EditField("TimeZone", Model.TimeZone)%>
                </li>
                <li>
                    <%=Html.EditField("TimeZoneName", Model.TimeZoneName)%>
                </li>
                <li>
                    <%=Html.EditField("UILanguage", Model.UILanguage)%>
                </li>
                <li>
                    <%=Html.EditField("UserLocale", Model.UserLocale)%>
                </li>
            </ul>
        </div>
        <div class="ui-helper-reset ui-helper-clearfix">
            <div class="ui-widget-header collapsible">
                SMS 2003 OSD
            </div>
            <ul>
                <li>
                    <%=Html.EditField("OSDINSTALLPACKAGE", Model.OSDINSTALLPACKAGE)%>
                </li>
                <li>
                    <%=Html.EditField("OSDINSTALLPROGRAM", Model.OSDINSTALLPROGRAM)%>
                </li>
                <li>
                    <%=Html.EditField("OSDINSTALLSILENT", Model.OSDINSTALLSILENT)%>
                </li>
                <li>
                    <%=Html.EditField("OSDMP", Model.OSDMP)%>
                </li>
                <li>
                    <%=Html.EditField("OSDNEWMACHINENAME", Model.OSDNEWMACHINENAME)%>
                </li>
                <li>
                    <%=Html.EditField("OSDSITECODE", Model.OSDSITECODE)%>
                </li>
            </ul>
        </div>
        <div class="ui-helper-reset ui-helper-clearfix">
            <div class="ui-widget-header collapsible">
                User Data
            </div>
            <ul>
                <li>
                    <%=Html.EditField("BackupDir", Model.BackupDir)%>
                </li>
                <li>
                    <%=Html.EditField("BackupShare", Model.BackupShare)%>
                </li>
                <li>
                    <%=Html.EditField("CaptureGroups", Model.CaptureGroups)%>
                </li>
                <li>
                    <%=Html.EditField("ComputerBackupLocation", Model.ComputerBackupLocation)%>
                </li>
                <li>
                    <%=Html.EditField("LoadStateArgs", Model.LoadStateArgs)%>
                </li>
                <li>
                    <%=Html.EditField("ScanStateArgs", Model.ScanStateArgs)%>
                </li>
                <li>
                    <%=Html.EditField("UDDir", Model.UDDir)%>
                </li>
                <li>
                    <%=Html.EditField("UDProfiles", Model.UDProfiles)%>
                </li>
                <li>
                    <%=Html.EditField("UDShare", Model.UDShare)%>
                </li>
                <li>
                    <%=Html.EditField("UserDataLocation", Model.UserDataLocation)%>
                </li>
            </ul>
        </div>
        <div class="ui-helper-reset ui-helper-clearfix">
            <div class="ui-widget-header collapsible">
                Wizard Control
            </div>
            <ul>
                <li>
                    <%=Html.EditField("SkipAdminPassword", Model.SkipAdminPassword)%>
                </li>
                <li>
                    <%=Html.EditField("SkipApplications", Model.SkipApplications)%>
                </li>
                <li>
                    <%=Html.EditField("SkipAppsOnUpgrade", Model.SkipAppsOnUpgrade)%>
                </li>
                <li>
                    <%=Html.EditField("SkipBDDWelcome", Model.SkipBDDWelcome)%>
                </li>
                <li>
                    <%=Html.EditField("SkipBitLocker", Model.SkipBitLocker)%>
                </li>
                <li>
                    <%=Html.EditField("SkipBitLockerDetails", Model.SkipBitLockerDetails)%>
                </li>
                <li>
                    <%=Html.EditField("SkipBuild", Model.SkipBuild)%>
                </li>
                <li>
                    <%=Html.EditField("SkipCapture", Model.SkipCapture)%>
                </li>
                <li>
                    <%=Html.EditField("SkipComputerBackup", Model.SkipComputerBackup)%>
                </li>
                <li>
                    <%=Html.EditField("SkipComputerName", Model.SkipComputerName)%>
                </li>
                <li>
                    <%=Html.EditField("SkipDeploymentType", Model.SkipDeploymentType)%>
                </li>
                <li>
                    <%=Html.EditField("SkipDomainMembership", Model.SkipDomainMembership)%>
                </li>
                <li>
                    <%=Html.EditField("SkipFinalSummary", Model.SkipFinalSummary)%>
                </li>
                <li>
                    <%=Html.EditField("SkipLocaleSelection", Model.SkipLocaleSelection)%>
                </li>
                <li>
                    <%=Html.EditField("SkipPackageDisplay", Model.SkipPackageDisplay)%>
                </li>
                <li>
                    <%=Html.EditField("SkipProductKey", Model.SkipProductKey)%>
                </li>
                <li>
                    <%=Html.EditField("SkipSummary", Model.SkipSummary)%>
                </li>
                <li>
                    <%=Html.EditField("SkipTimeZone", Model.SkipTimeZone)%>
                </li>
                <li>
                    <%=Html.EditField("SkipUserData", Model.SkipUserData)%>
                </li>
                <li>
                    <%=Html.EditField("SkipWizard", Model.SkipWizard)%>
                </li>
            </ul>
        </div>
    </div>--%>
    <br />
    <input type="submit" value="Save" name="EditSettings" class="ui-state-default fg-button ui-corner-all" />
    <input type="submit" value="Cancel" name="EditSettings" class="ui-state-default fg-button ui-corner-all" />
<%  End Using%>
