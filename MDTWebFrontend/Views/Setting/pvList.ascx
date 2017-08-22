<%@ Control Language="VB" Inherits="System.Web.Mvc.ViewUserControl(Of MaikKoster.MDT.Model.Setting)" %>
<%="" %>
<br />
<p>
    <%=Html.ActionLink("Edit", "Edit", "Setting", New With {.IdentityType = ViewData("IdentityType"), .IdentityID = Model.ID}, New With {.class = "fg-button ui-state-default ui-corner-all linkbutton"})%>
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
                    <%= Html.Encode(Model.BdeDriveLetter) %>
                </td>
            </tr>
            <tr>
                <td class="settingname">
                    BdeDriveSize
                </td>
                <td class="settingvalue">
                    <%=Html.Encode(Model.BdeDriveSize)%>
                </td>
            </tr>
            <tr>
                <td class="settingname">
                    BdeInstall
                </td>
                <td class="settingvalue">
                    <%=Html.Encode(Model.BdeInstall)%>
                </td>
            </tr>
            <tr>
                <td class="settingname">
                    BdeKeyLocation
                </td>
                <td class="settingvalue">
                    <%=Html.Encode(Model.BdeKeyLocation)%>
                </td>
            </tr>
            <tr>
                <td class="settingname">
                    BdePin
                </td>
                <td class="settingvalue">
                    <%=Html.Encode(Model.BdePin)%>
                </td>
            </tr>
            <tr>
                <td class="settingname">
                    BdeRecoveryKey
                </td>
                <td class="settingvalue">
                    <%=Html.Encode(Model.BdeRecoveryKey)%>
                </td>
            </tr>
            <tr>
                <td class="settingname">
                    TpmOwnerPassword
                </td>
                <td class="settingvalue">
                    <%=Html.Encode(Model.TpmOwnerPassword)%>
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
                    <%=Html.Encode(Model.BitsPerPel)%>
                </td>
            </tr>
            <tr>
                <td class="settingname">
                    Vrefresh
                </td>
                <td class="settingvalue">
                    <%=Html.Encode(Model.Vrefresh)%>
                </td>
            </tr>
            <tr>
                <td class="settingname">
                    Xresolution
                </td>
                <td class="settingvalue">
                    <%=Html.Encode(Model.Xresolution)%>
                </td>
            </tr>
            <tr>
                <td class="settingname">
                    Yresolution
                </td>
                <td class="settingvalue">
                    <%=Html.Encode(Model.Yresolution)%>
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
                    <%=Html.Encode(Model.DomainAdmin)%>
                </td>
            </tr>
            <tr>
                <td class="settingname">
                    DomainAdminDomain
                </td>
                <td class="settingvalue">
                    <%=Html.Encode(Model.DomainAdminDomain)%>
                </td>
            </tr>
            <tr>
                <td class="settingname">
                    DomainAdminPassword
                </td>
                <td class="settingvalue">
                    <%=Html.Encode(If(Model.DomainAdminPassword <> "", "********", ""))%>
                </td>
            </tr>
            <tr>
                <td class="settingname">
                    JoinDomain
                </td>
                <td class="settingvalue">
                    <%=Html.Encode(Model.JoinDomain)%>
                </td>
            </tr>
            <tr>
                <td class="settingname">
                    JoinWorkGroup
                </td>
                <td class="settingvalue">
                    <%=Html.Encode(Model.JoinWorkGroup)%>
                </td>
            </tr>
            <tr>
                <td class="settingname">
                    MachineObjectOU
                </td>
                <td class="settingvalue">
                    <%=Html.Encode(Model.MachineObjectOU)%>
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
                    <%=Html.Encode(Model.ComputerName)%>
                </td>
            </tr>
            <tr>
                <td class="settingname">
                    FullName
                </td>
                <td class="settingvalue">
                    <%=Html.Encode(Model.FullName)%>
                </td>
            </tr>
            <tr>
                <td class="settingname">
                    OrgName
                </td>
                <td class="settingvalue">
                    <%=Html.Encode(Model.OrgName)%>
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
                    <%=Html.Encode(If(Model.AdminPassword <> "", "********", ""))%>
                </td>
            </tr>
            <tr>
                <td class="settingname">
                    BuildID
                </td>
                <td class="settingvalue">
                    <%=Html.Encode(Model.BuildID)%>
                </td>
            </tr>
            <tr>
                <td class="settingname">
                    DoCapture
                </td>
                <td class="settingvalue">
                    <%=Html.Encode(Model.DoCapture)%>
                </td>
            </tr>
            <tr>
                <td class="settingname">
                    DriverGroup
                </td>
                <td class="settingvalue">
                    <%=Html.Encode(Model.DriverGroup)%>
                </td>
            </tr>
            <tr>
                <td class="settingname">
                    EventShare
                </td>
                <td class="settingvalue">
                    <%=Html.Encode(Model.EventShare)%>
                </td>
            </tr>
            <tr>
                <td class="settingname">
                    Home_Page
                </td>
                <td class="settingvalue">
                    <%=Html.Encode(Model.Home_Page)%>
                </td>
            </tr>
            <tr>
                <td class="settingname">
                    OSInstall
                </td>
                <td class="settingvalue">
                    <%=Html.Encode(Model.OSInstall)%>
                </td>
            </tr>
            <tr>
                <td class="settingname">
                    OverrideProductKey
                </td>
                <td class="settingvalue">
                    <%=Html.Encode(Model.OverrideProductKey)%>
                </td>
            </tr>
            <tr>
                <td class="settingname">
                    ProductKey
                </td>
                <td class="settingvalue">
                    <%=Html.Encode(Model.ProductKey)%>
                </td>
            </tr>
            <tr>
                <td class="settingname">
                    ResourceRoot
                </td>
                <td class="settingvalue">
                    <%=Html.Encode(Model.ResourceRoot)%>
                </td>
            </tr>
            <tr>
                <td class="settingname">
                    ServerA
                </td>
                <td class="settingvalue">
                    <%=Html.Encode(Model.ServerA)%>
                </td>
            </tr>
            <tr>
                <td class="settingname">
                    ServerB
                </td>
                <td class="settingvalue">
                    <%=Html.Encode(Model.ServerB)%>
                </td>
            </tr>
            <tr>
                <td class="settingname">
                    ServerC
                </td>
                <td class="settingvalue">
                    <%=Html.Encode(Model.ServerC)%>
                </td>
            </tr>
            <tr>
                <td class="settingname">
                    SLShare
                </td>
                <td class="settingvalue">
                    <%=Html.Encode(Model.SLShare)%>
                </td>
            </tr>
            <tr>
                <td class="settingname">
                    WDSServer
                </td>
                <td class="settingvalue">
                    <%=Html.Encode(Model.WDSServer)%>
                </td>
            </tr>
            <tr>
                <td class="settingname">
                    UserID
                </td>
                <td class="settingvalue">
                    <%=Html.Encode(Model.UserID)%>
                </td>
            </tr>
            <tr>
                <td class="settingname">
                    UserDomain
                </td>
                <td class="settingvalue">
                    <%=Html.Encode(Model.UserDomain)%>
                </td>
            </tr>
            <tr>
                <td class="settingname">
                    UserPassword
                </td>
                <td class="settingvalue">
                    <%=Html.Encode(If(Model.UserPassword <> "", "********", ""))%>
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
                    <%=Html.Encode(Model.AreaCode)%>
                </td>
            </tr>
            <tr>
                <td class="settingname">
                    CountryCode
                </td>
                <td class="settingvalue">
                    <%=Html.Encode(Model.CountryCode)%>
                </td>
            </tr>
            <tr>
                <td class="settingname">
                    Dialing
                </td>
                <td class="settingvalue">
                    <%=Html.Encode(Model.Dialing)%>
                </td>
            </tr>
            <tr>
                <td class="settingname">
                    InputLocale
                </td>
                <td class="settingvalue">
                    <%=Html.Encode(Model.InputLocale)%>
                </td>
            </tr>
            <tr>
                <td class="settingname">
                    KeyboardLocale
                </td>
                <td class="settingvalue">
                    <%=Html.Encode(Model.KeyboardLocale)%>
                </td>
            </tr>
            <tr>
                <td class="settingname">
                    LongDistanceAccess
                </td>
                <td class="settingvalue">
                    <%=Html.Encode(Model.LongDistanceAccess)%>
                </td>
            </tr>
            <tr>
                <td class="settingname">
                    TimeZone
                </td>
                <td class="settingvalue">
                    <%=Html.Encode(Model.TimeZone)%>
                </td>
            </tr>
            <tr>
                <td class="settingname">
                    TimeZoneName
                </td>
                <td class="settingvalue">
                    <%=Html.Encode(Model.TimeZoneName)%>
                </td>
            </tr>
            <tr>
                <td class="settingname">
                    UILanguage
                </td>
                <td class="settingvalue">
                    <%=Html.Encode(Model.UILanguage)%>
                </td>
            </tr>
            <tr>
                <td class="settingname">
                    UserLocale
                </td>
                <td class="settingvalue">
                    <%=Html.Encode(Model.UserLocale)%>
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
                    <%=Html.Encode(Model.OSDINSTALLPACKAGE)%>
                </td>
            </tr>
            <tr>
                <td class="settingname">
                    OSDINSTALLPROGRAM
                </td>
                <td class="settingvalue">
                    <%=Html.Encode(Model.OSDINSTALLPROGRAM)%>
                </td>
            </tr>
            <tr>
                <td class="settingname">
                    OSDINSTALLSILENT
                </td>
                <td class="settingvalue">
                    <%=Html.Encode(Model.OSDINSTALLSILENT)%>
                </td>
            </tr>
            <tr>
                <td class="settingname">
                    OSDMP
                </td>
                <td class="settingvalue">
                    <%=Html.Encode(Model.OSDMP)%>
                </td>
            </tr>
            <tr>
                <td class="settingname">
                    OSDNEWMACHINENAME
                </td>
                <td class="settingvalue">
                    <%=Html.Encode(Model.OSDNEWMACHINENAME)%>
                </td>
            </tr>
            <tr>
                <td class="settingname">
                    OSDSITECODE
                </td>
                <td class="settingvalue">
                    <%=Html.Encode(Model.OSDSITECODE)%>
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
                    <%=Html.Encode(Model.BackupDir)%>
                </td>
            </tr>
            <tr>
                <td class="settingname">
                    BackupShare
                </td>
                <td class="settingvalue">
                    <%=Html.Encode(Model.BackupShare)%>
                </td>
            </tr>
            <tr>
                <td class="settingname">
                    CaptureGroups
                </td>
                <td class="settingvalue">
                    <%=Html.Encode(Model.CaptureGroups)%>
                </td>
            </tr>
            <tr>
                <td class="settingname">
                    ComputerBackupLocation
                </td>
                <td class="settingvalue">
                    <%=Html.Encode(Model.ComputerBackupLocation)%>
                </td>
            </tr>
            <tr>
                <td class="settingname">
                    LoadStateArgs
                </td>
                <td class="settingvalue">
                    <%=Html.Encode(Model.LoadStateArgs)%>
                </td>
            </tr>
            <tr>
                <td class="settingname">
                    ScanStateArgs
                </td>
                <td class="settingvalue">
                    <%=Html.Encode(Model.ScanStateArgs)%>
                </td>
            </tr>
            <tr>
                <td class="settingname">
                    UDDir
                </td>
                <td class="settingvalue">
                    <%=Html.Encode(Model.UDDir)%>
                </td>
            </tr>
            <tr>
                <td class="settingname">
                    UDProfiles
                </td>
                <td class="settingvalue">
                    <%=Html.Encode(Model.UDProfiles)%>
                </td>
            </tr>
            <tr>
                <td class="settingname">
                    UDShare
                </td>
                <td class="settingvalue">
                    <%=Html.Encode(Model.UDShare)%>
                </td>
            </tr>
            <tr>
                <td class="settingname">
                    UserDataLocation
                </td>
                <td class="settingvalue">
                    <%=Html.Encode(Model.UserDataLocation)%>
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
                    <%=Html.Encode(Model.SkipAdminPassword)%>
                </td>
            </tr>
            <tr>
                <td class="settingname">
                    SkipApplications
                </td>
                <td class="settingvalue">
                    <%=Html.Encode(Model.SkipApplications)%>
                </td>
            </tr>
            <tr>
                <td class="settingname">
                    SkipAppsOnUpgrade
                </td>
                <td class="settingvalue">
                    <%=Html.Encode(Model.SkipAppsOnUpgrade)%>
                </td>
            </tr>
            <tr>
                <td class="settingname">
                    SkipBDDWelcome
                </td>
                <td class="settingvalue">
                    <%=Html.Encode(Model.SkipBDDWelcome)%>
                </td>
            </tr>
            <tr>
                <td class="settingname">
                    SkipBitLocker
                </td>
                <td class="settingvalue">
                    <%=Html.Encode(Model.SkipBitLocker)%>
                </td>
            </tr>
            <tr>
                <td class="settingname">
                    SkipBitLockerDetails
                </td>
                <td class="settingvalue">
                    <%=Html.Encode(Model.SkipBitLockerDetails)%>
                </td>
            </tr>
            <tr>
                <td class="settingname">
                    SkipBuild
                </td>
                <td class="settingvalue">
                    <%=Html.Encode(Model.SkipBuild)%>
                </td>
            </tr>
            <tr>
                <td class="settingname">
                    SkipCapture
                </td>
                <td class="settingvalue">
                    <%=Html.Encode(Model.SkipCapture)%>
                </td>
            </tr>
            <tr>
                <td class="settingname">
                    SkipComputerBackup
                </td>
                <td class="settingvalue">
                    <%=Html.Encode(Model.SkipComputerBackup)%>
                </td>
            </tr>
            <tr>
                <td class="settingname">
                    SkipComputerName
                </td>
                <td class="settingvalue">
                    <%=Html.Encode(Model.SkipComputerName)%>
                </td>
            </tr>
            <tr>
                <td class="settingname">
                    SkipDeploymentType
                </td>
                <td class="settingvalue">
                    <%=Html.Encode(Model.SkipDeploymentType)%>
                </td>
            </tr>
            <tr>
                <td class="settingname">
                    SkipDomainMembership
                </td>
                <td class="settingvalue">
                    <%=Html.Encode(Model.SkipDomainMembership)%>
                </td>
            </tr>
            <tr>
                <td class="settingname">
                    SkipFinalSummary
                </td>
                <td class="settingvalue">
                    <%=Html.Encode(Model.SkipFinalSummary)%>
                </td>
            </tr>
            <tr>
                <td class="settingname">
                    SkipLocaleSelection
                </td>
                <td class="settingvalue">
                    <%=Html.Encode(Model.SkipLocaleSelection)%>
                </td>
            </tr>
            <tr>
                <td class="settingname">
                    SkipPackageDisplay
                </td>
                <td class="settingvalue">
                    <%=Html.Encode(Model.SkipPackageDisplay)%>
                </td>
            </tr>
            <tr>
                <td class="settingname">
                    SkipProductKey
                </td>
                <td class="settingvalue">
                    <%=Html.Encode(Model.SkipProductKey)%>
                </td>
            </tr>
            <tr>
                <td class="settingname">
                    SkipSummary
                </td>
                <td class="settingvalue">
                    <%=Html.Encode(Model.SkipSummary)%>
                </td>
            </tr>
            <tr>
                <td class="settingname">
                    SkipTimeZone
                </td>
                <td class="settingvalue">
                    <%=Html.Encode(Model.SkipTimeZone)%>
                </td>
            </tr>
            <tr>
                <td class="settingname">
                    SkipUserData
                </td>
                <td class="settingvalue">
                    <%=Html.Encode(Model.SkipUserData)%>
                </td>
            </tr>
            <tr>
                <td class="settingname">
                    SkipWizard
                </td>
                <td class="settingvalue">
                    <%=Html.Encode(Model.SkipWizard)%>
                </td>
            </tr>
        </table>
    </div>
</div>
<br />
<p>
    <%=Html.ActionLink("Edit", "Edit", "Setting", New With {.IdentityType = ViewData("IdentityType"), .IdentityID = Model.ID}, New With {.class = "fg-button ui-state-default ui-corner-all linkbutton"})%>
</p>
