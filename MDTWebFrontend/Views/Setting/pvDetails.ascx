<%@ Control Language="VB" Inherits="System.Web.Mvc.ViewUserControl(Of MaikKoster.MDT.Model.Setting)" %>

    <fieldset>
        <p>
            Type:
            <%= Html.Encode(Model.Type) %>
        </p>
        <p>
            ID:
            <%= Html.Encode(Model.ID) %>
        </p>
        <p>
            UserID:
            <%= Html.Encode(Model.UserID) %>
        </p>
        <p>
            UserDomain:
            <%= Html.Encode(Model.UserDomain) %>
        </p>
        <p>
            UserPassword:
            <%= Html.Encode(Model.UserPassword) %>
        </p>
        <p>
            UDShare:
            <%= Html.Encode(Model.UDShare) %>
        </p>
        <p>
            UDDir:
            <%= Html.Encode(Model.UDDir) %>
        </p>
        <p>
            UDProfiles:
            <%= Html.Encode(Model.UDProfiles) %>
        </p>
        <p>
            SLShare:
            <%= Html.Encode(Model.SLShare) %>
        </p>
        <p>
            EventShare:
            <%= Html.Encode(Model.EventShare) %>
        </p>
        <p>
            OSInstall:
            <%= Html.Encode(Model.OSInstall) %>
        </p>
        <p>
            ComputerName:
            <%= Html.Encode(Model.ComputerName) %>
        </p>
        <p>
            Home_Page:
            <%= Html.Encode(Model.Home_Page) %>
        </p>
        <p>
            JoinDomain:
            <%= Html.Encode(Model.JoinDomain) %>
        </p>
        <p>
            JoinWorkGroup:
            <%= Html.Encode(Model.JoinWorkGroup) %>
        </p>
        <p>
            DomainAdmin:
            <%= Html.Encode(Model.DomainAdmin) %>
        </p>
        <p>
            DomainAdminDomain:
            <%= Html.Encode(Model.DomainAdminDomain) %>
        </p>
        <p>
            DomainAdminPassword:
            <%= Html.Encode(Model.DomainAdminPassword) %>
        </p>
        <p>
            MachineObjectOU:
            <%= Html.Encode(Model.MachineObjectOU) %>
        </p>
        <p>
            OSDINSTALLSILENT:
            <%= Html.Encode(Model.OSDINSTALLSILENT) %>
        </p>
        <p>
            OSDINSTALLPACKAGE:
            <%= Html.Encode(Model.OSDINSTALLPACKAGE) %>
        </p>
        <p>
            OSDINSTALLPROGRAM:
            <%= Html.Encode(Model.OSDINSTALLPROGRAM) %>
        </p>
        <p>
            OSDNEWMACHINENAME:
            <%= Html.Encode(Model.OSDNEWMACHINENAME) %>
        </p>
        <p>
            ScanStateArgs:
            <%= Html.Encode(Model.ScanStateArgs) %>
        </p>
        <p>
            LoadStateArgs:
            <%= Html.Encode(Model.LoadStateArgs) %>
        </p>
        <p>
            ComputerBackupLocation:
            <%= Html.Encode(Model.ComputerBackupLocation) %>
        </p>
        <p>
            BackupShare:
            <%= Html.Encode(Model.BackupShare) %>
        </p>
        <p>
            BackupDir:
            <%= Html.Encode(Model.BackupDir) %>
        </p>
        <p>
            UserDataLocation:
            <%= Html.Encode(Model.UserDataLocation) %>
        </p>
        <p>
            DoCapture:
            <%= Html.Encode(Model.DoCapture) %>
        </p>
        <p>
            ProductKey:
            <%= Html.Encode(Model.ProductKey) %>
        </p>
        <p>
            OverrideProductKey:
            <%= Html.Encode(Model.OverrideProductKey) %>
        </p>
        <p>
            WDSServer:
            <%= Html.Encode(Model.WDSServer) %>
        </p>
        <p>
            CaptureGroups:
            <%= Html.Encode(Model.CaptureGroups) %>
        </p>
        <p>
            AdminPassword:
            <%= Html.Encode(Model.AdminPassword) %>
        </p>
        <p>
            OrgName:
            <%= Html.Encode(Model.OrgName) %>
        </p>
        <p>
            FullName:
            <%= Html.Encode(Model.FullName) %>
        </p>
        <p>
            TimeZone:
            <%= Html.Encode(Model.TimeZone) %>
        </p>
        <p>
            TimeZoneName:
            <%= Html.Encode(Model.TimeZoneName) %>
        </p>
        <p>
            BuildID:
            <%= Html.Encode(Model.BuildID) %>
        </p>
        <p>
            KeyboardLocale:
            <%= Html.Encode(Model.KeyboardLocale) %>
        </p>
        <p>
            InputLocale:
            <%= Html.Encode(Model.InputLocale) %>
        </p>
        <p>
            UserLocale:
            <%= Html.Encode(Model.UserLocale) %>
        </p>
        <p>
            UILanguage:
            <%= Html.Encode(Model.UILanguage) %>
        </p>
        <p>
            Xresolution:
            <%= Html.Encode(Model.Xresolution) %>
        </p>
        <p>
            Yresolution:
            <%= Html.Encode(Model.Yresolution) %>
        </p>
        <p>
            BitsPerPel:
            <%= Html.Encode(Model.BitsPerPel) %>
        </p>
        <p>
            Vrefresh:
            <%= Html.Encode(Model.Vrefresh) %>
        </p>
        <p>
            AreaCode:
            <%= Html.Encode(Model.AreaCode) %>
        </p>
        <p>
            CountryCode:
            <%= Html.Encode(Model.CountryCode) %>
        </p>
        <p>
            LongDistanceAccess:
            <%= Html.Encode(Model.LongDistanceAccess) %>
        </p>
        <p>
            Dialing:
            <%= Html.Encode(Model.Dialing) %>
        </p>
        <p>
            BdeInstall:
            <%= Html.Encode(Model.BdeInstall) %>
        </p>
        <p>
            BdeDriveLetter:
            <%= Html.Encode(Model.BdeDriveLetter) %>
        </p>
        <p>
            BdeDriveSize:
            <%= Html.Encode(Model.BdeDriveSize) %>
        </p>
        <p>
            BdePin:
            <%= Html.Encode(Model.BdePin) %>
        </p>
        <p>
            BdeRecoveryKey:
            <%= Html.Encode(Model.BdeRecoveryKey) %>
        </p>
        <p>
            BdeKeyLocation:
            <%= Html.Encode(Model.BdeKeyLocation) %>
        </p>
        <p>
            TpmOwnerPassword:
            <%= Html.Encode(Model.TpmOwnerPassword) %>
        </p>
        <p>
            OSDMP:
            <%= Html.Encode(Model.OSDMP) %>
        </p>
        <p>
            OSDSITECODE:
            <%= Html.Encode(Model.OSDSITECODE) %>
        </p>
        <p>
            DriverGroup:
            <%= Html.Encode(Model.DriverGroup) %>
        </p>
        <p>
            ServerA:
            <%= Html.Encode(Model.ServerA) %>
        </p>
        <p>
            ServerB:
            <%= Html.Encode(Model.ServerB) %>
        </p>
        <p>
            ServerC:
            <%= Html.Encode(Model.ServerC) %>
        </p>
        <p>
            ResourceRoot:
            <%= Html.Encode(Model.ResourceRoot) %>
        </p>
        <p>
            SkipWizard:
            <%= Html.Encode(Model.SkipWizard) %>
        </p>
        <p>
            SkipCapture:
            <%= Html.Encode(Model.SkipCapture) %>
        </p>
        <p>
            SkipAdminPassword:
            <%= Html.Encode(Model.SkipAdminPassword) %>
        </p>
        <p>
            SkipApplications:
            <%= Html.Encode(Model.SkipApplications) %>
        </p>
        <p>
            SkipAppsOnUpgrade:
            <%= Html.Encode(Model.SkipAppsOnUpgrade) %>
        </p>
        <p>
            SkipComputerBackup:
            <%= Html.Encode(Model.SkipComputerBackup) %>
        </p>
        <p>
            SkipDomainMembership:
            <%= Html.Encode(Model.SkipDomainMembership) %>
        </p>
        <p>
            SkipComputerName:
            <%= Html.Encode(Model.SkipComputerName) %>
        </p>
        <p>
            SkipDeploymentType:
            <%= Html.Encode(Model.SkipDeploymentType) %>
        </p>
        <p>
            SkipUserData:
            <%= Html.Encode(Model.SkipUserData) %>
        </p>
        <p>
            SkipPackageDisplay:
            <%= Html.Encode(Model.SkipPackageDisplay) %>
        </p>
        <p>
            SkipLocaleSelection:
            <%= Html.Encode(Model.SkipLocaleSelection) %>
        </p>
        <p>
            SkipProductKey:
            <%= Html.Encode(Model.SkipProductKey) %>
        </p>
        <p>
            SkipSummary:
            <%= Html.Encode(Model.SkipSummary) %>
        </p>
        <p>
            SkipFinalSummary:
            <%= Html.Encode(Model.SkipFinalSummary) %>
        </p>
        <p>
            SkipBDDWelcome:
            <%= Html.Encode(Model.SkipBDDWelcome) %>
        </p>
        <p>
            SkipTimeZone:
            <%= Html.Encode(Model.SkipTimeZone) %>
        </p>
        <p>
            SkipBuild:
            <%= Html.Encode(Model.SkipBuild) %>
        </p>
        <p>
            SkipBitLocker:
            <%= Html.Encode(Model.SkipBitLocker) %>
        </p>
        <p>
            SkipBitLockerDetails:
            <%= Html.Encode(Model.SkipBitLockerDetails) %>
        </p>
    </fieldset>
    <p>
        <%=Html.ActionLink("Edit", "Edit", New With {.IdentityType = ViewData("IdentityType"), .IdentityID = Model.Type})%> 
    </p>


