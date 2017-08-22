<%@ Page Title="" Language="VB" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage(Of IEnumerable (Of MaikKoster.MDT.Model.Setting))" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Index</h2>

    <p>
        <%=Html.ActionLink("Create New", "Create")%>
    </p>
    
    <table>
        <tr class="ui-widget ui-widget-header">
            <th></th>
            <th>
                Type
            </th>
            <th>
                ID
            </th>
            <th>
                UserID
            </th>
            <th>
                UserDomain
            </th>
            <th>
                UserPassword
            </th>
            <th>
                UDShare
            </th>
            <th>
                UDDir
            </th>
            <th>
                UDProfiles
            </th>
            <th>
                SLShare
            </th>
            <th>
                EventShare
            </th>
            <th>
                OSInstall
            </th>
            <th>
                ComputerName
            </th>
            <th>
                Home_Page
            </th>
            <th>
                JoinDomain
            </th>
            <th>
                JoinWorkGroup
            </th>
            <th>
                DomainAdmin
            </th>
            <th>
                DomainAdminDomain
            </th>
            <th>
                DomainAdminPassword
            </th>
            <th>
                MachineObjectOU
            </th>
            <th>
                OSDINSTALLSILENT
            </th>
            <th>
                OSDINSTALLPACKAGE
            </th>
            <th>
                OSDINSTALLPROGRAM
            </th>
            <th>
                OSDNEWMACHINENAME
            </th>
            <th>
                ScanStateArgs
            </th>
            <th>
                LoadStateArgs
            </th>
            <th>
                ComputerBackupLocation
            </th>
            <th>
                BackupShare
            </th>
            <th>
                BackupDir
            </th>
            <th>
                UserDataLocation
            </th>
            <th>
                DoCapture
            </th>
            <th>
                ProductKey
            </th>
            <th>
                OverrideProductKey
            </th>
            <th>
                WDSServer
            </th>
            <th>
                CaptureGroups
            </th>
            <th>
                AdminPassword
            </th>
            <th>
                OrgName
            </th>
            <th>
                FullName
            </th>
            <th>
                TimeZone
            </th>
            <th>
                TimeZoneName
            </th>
            <th>
                BuildID
            </th>
            <th>
                KeyboardLocale
            </th>
            <th>
                InputLocale
            </th>
            <th>
                UserLocale
            </th>
            <th>
                UILanguage
            </th>
            <th>
                Xresolution
            </th>
            <th>
                Yresolution
            </th>
            <th>
                BitsPerPel
            </th>
            <th>
                Vrefresh
            </th>
            <th>
                AreaCode
            </th>
            <th>
                CountryCode
            </th>
            <th>
                LongDistanceAccess
            </th>
            <th>
                Dialing
            </th>
            <th>
                BdeInstall
            </th>
            <th>
                BdeDriveLetter
            </th>
            <th>
                BdeDriveSize
            </th>
            <th>
                BdePin
            </th>
            <th>
                BdeRecoveryKey
            </th>
            <th>
                BdeKeyLocation
            </th>
            <th>
                TpmOwnerPassword
            </th>
            <th>
                OSDMP
            </th>
            <th>
                OSDSITECODE
            </th>
            <th>
                DriverGroup
            </th>
            <th>
                ServerA
            </th>
            <th>
                ServerB
            </th>
            <th>
                ServerC
            </th>
            <th>
                ResourceRoot
            </th>
            <th>
                SkipWizard
            </th>
            <th>
                SkipCapture
            </th>
            <th>
                SkipAdminPassword
            </th>
            <th>
                SkipApplications
            </th>
            <th>
                SkipAppsOnUpgrade
            </th>
            <th>
                SkipComputerBackup
            </th>
            <th>
                SkipDomainMembership
            </th>
            <th>
                SkipComputerName
            </th>
            <th>
                SkipDeploymentType
            </th>
            <th>
                SkipUserData
            </th>
            <th>
                SkipPackageDisplay
            </th>
            <th>
                SkipLocaleSelection
            </th>
            <th>
                SkipProductKey
            </th>
            <th>
                SkipSummary
            </th>
            <th>
                SkipFinalSummary
            </th>
            <th>
                SkipBDDWelcome
            </th>
            <th>
                SkipTimeZone
            </th>
            <th>
                SkipBuild
            </th>
            <th>
                SkipBitLocker
            </th>
            <th>
                SkipBitLockerDetails
            </th>
        </tr>

    <% For Each item In Model%>
    
        <tr>
            <td>
                <%=Html.ActionLink("Edit", "Edit", New With {.id = item.Type})%> |
                <%=Html.ActionLink("Details", "Details", New With {.id = item.Type})%>
            </td>
            <td>
                <%= Html.Encode(item.Type) %>
            </td>
            <td>
                <%= Html.Encode(item.ID) %>
            </td>
            <td>
                <%= Html.Encode(item.UserID) %>
            </td>
            <td>
                <%= Html.Encode(item.UserDomain) %>
            </td>
            <td>
                <%= Html.Encode(item.UserPassword) %>
            </td>
            <td>
                <%= Html.Encode(item.UDShare) %>
            </td>
            <td>
                <%= Html.Encode(item.UDDir) %>
            </td>
            <td>
                <%= Html.Encode(item.UDProfiles) %>
            </td>
            <td>
                <%= Html.Encode(item.SLShare) %>
            </td>
            <td>
                <%= Html.Encode(item.EventShare) %>
            </td>
            <td>
                <%= Html.Encode(item.OSInstall) %>
            </td>
            <td>
                <%= Html.Encode(item.ComputerName) %>
            </td>
            <td>
                <%= Html.Encode(item.Home_Page) %>
            </td>
            <td>
                <%= Html.Encode(item.JoinDomain) %>
            </td>
            <td>
                <%= Html.Encode(item.JoinWorkGroup) %>
            </td>
            <td>
                <%= Html.Encode(item.DomainAdmin) %>
            </td>
            <td>
                <%= Html.Encode(item.DomainAdminDomain) %>
            </td>
            <td>
                <%= Html.Encode(item.DomainAdminPassword) %>
            </td>
            <td>
                <%= Html.Encode(item.MachineObjectOU) %>
            </td>
            <td>
                <%= Html.Encode(item.OSDINSTALLSILENT) %>
            </td>
            <td>
                <%= Html.Encode(item.OSDINSTALLPACKAGE) %>
            </td>
            <td>
                <%= Html.Encode(item.OSDINSTALLPROGRAM) %>
            </td>
            <td>
                <%= Html.Encode(item.OSDNEWMACHINENAME) %>
            </td>
            <td>
                <%= Html.Encode(item.ScanStateArgs) %>
            </td>
            <td>
                <%= Html.Encode(item.LoadStateArgs) %>
            </td>
            <td>
                <%= Html.Encode(item.ComputerBackupLocation) %>
            </td>
            <td>
                <%= Html.Encode(item.BackupShare) %>
            </td>
            <td>
                <%= Html.Encode(item.BackupDir) %>
            </td>
            <td>
                <%= Html.Encode(item.UserDataLocation) %>
            </td>
            <td>
                <%= Html.Encode(item.DoCapture) %>
            </td>
            <td>
                <%= Html.Encode(item.ProductKey) %>
            </td>
            <td>
                <%= Html.Encode(item.OverrideProductKey) %>
            </td>
            <td>
                <%= Html.Encode(item.WDSServer) %>
            </td>
            <td>
                <%= Html.Encode(item.CaptureGroups) %>
            </td>
            <td>
                <%= Html.Encode(item.AdminPassword) %>
            </td>
            <td>
                <%= Html.Encode(item.OrgName) %>
            </td>
            <td>
                <%= Html.Encode(item.FullName) %>
            </td>
            <td>
                <%= Html.Encode(item.TimeZone) %>
            </td>
            <td>
                <%= Html.Encode(item.TimeZoneName) %>
            </td>
            <td>
                <%= Html.Encode(item.BuildID) %>
            </td>
            <td>
                <%= Html.Encode(item.KeyboardLocale) %>
            </td>
            <td>
                <%= Html.Encode(item.InputLocale) %>
            </td>
            <td>
                <%= Html.Encode(item.UserLocale) %>
            </td>
            <td>
                <%= Html.Encode(item.UILanguage) %>
            </td>
            <td>
                <%= Html.Encode(item.Xresolution) %>
            </td>
            <td>
                <%= Html.Encode(item.Yresolution) %>
            </td>
            <td>
                <%= Html.Encode(item.BitsPerPel) %>
            </td>
            <td>
                <%= Html.Encode(item.Vrefresh) %>
            </td>
            <td>
                <%= Html.Encode(item.AreaCode) %>
            </td>
            <td>
                <%= Html.Encode(item.CountryCode) %>
            </td>
            <td>
                <%= Html.Encode(item.LongDistanceAccess) %>
            </td>
            <td>
                <%= Html.Encode(item.Dialing) %>
            </td>
            <td>
                <%= Html.Encode(item.BdeInstall) %>
            </td>
            <td>
                <%= Html.Encode(item.BdeDriveLetter) %>
            </td>
            <td>
                <%= Html.Encode(item.BdeDriveSize) %>
            </td>
            <td>
                <%= Html.Encode(item.BdePin) %>
            </td>
            <td>
                <%= Html.Encode(item.BdeRecoveryKey) %>
            </td>
            <td>
                <%= Html.Encode(item.BdeKeyLocation) %>
            </td>
            <td>
                <%= Html.Encode(item.TpmOwnerPassword) %>
            </td>
            <td>
                <%= Html.Encode(item.OSDMP) %>
            </td>
            <td>
                <%= Html.Encode(item.OSDSITECODE) %>
            </td>
            <td>
                <%= Html.Encode(item.DriverGroup) %>
            </td>
            <td>
                <%= Html.Encode(item.ServerA) %>
            </td>
            <td>
                <%= Html.Encode(item.ServerB) %>
            </td>
            <td>
                <%= Html.Encode(item.ServerC) %>
            </td>
            <td>
                <%= Html.Encode(item.ResourceRoot) %>
            </td>
            <td>
                <%= Html.Encode(item.SkipWizard) %>
            </td>
            <td>
                <%= Html.Encode(item.SkipCapture) %>
            </td>
            <td>
                <%= Html.Encode(item.SkipAdminPassword) %>
            </td>
            <td>
                <%= Html.Encode(item.SkipApplications) %>
            </td>
            <td>
                <%= Html.Encode(item.SkipAppsOnUpgrade) %>
            </td>
            <td>
                <%= Html.Encode(item.SkipComputerBackup) %>
            </td>
            <td>
                <%= Html.Encode(item.SkipDomainMembership) %>
            </td>
            <td>
                <%= Html.Encode(item.SkipComputerName) %>
            </td>
            <td>
                <%= Html.Encode(item.SkipDeploymentType) %>
            </td>
            <td>
                <%= Html.Encode(item.SkipUserData) %>
            </td>
            <td>
                <%= Html.Encode(item.SkipPackageDisplay) %>
            </td>
            <td>
                <%= Html.Encode(item.SkipLocaleSelection) %>
            </td>
            <td>
                <%= Html.Encode(item.SkipProductKey) %>
            </td>
            <td>
                <%= Html.Encode(item.SkipSummary) %>
            </td>
            <td>
                <%= Html.Encode(item.SkipFinalSummary) %>
            </td>
            <td>
                <%= Html.Encode(item.SkipBDDWelcome) %>
            </td>
            <td>
                <%= Html.Encode(item.SkipTimeZone) %>
            </td>
            <td>
                <%= Html.Encode(item.SkipBuild) %>
            </td>
            <td>
                <%= Html.Encode(item.SkipBitLocker) %>
            </td>
            <td>
                <%= Html.Encode(item.SkipBitLockerDetails) %>
            </td>
        </tr>
    
    <% Next%>

    </table>

</asp:Content>

