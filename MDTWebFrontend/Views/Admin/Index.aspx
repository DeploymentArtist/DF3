<%@ Page Title="" Language="VB" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Index</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<%="" %>
    <%Dim DBStatus = CType(ViewData("DBStatus"), MaikKoster.MDT.MVC.MDTRepository.DatabaseStatus)%>
    <div id="tabs">
        <ul>
            <%If DBStatus <> MaikKoster.MDT.MVC.MDTRepository.DatabaseStatus.NoConnection AndAlso DBStatus <> MaikKoster.MDT.MVC.MDTRepository.DatabaseStatus.Connected AndAlso DBStatus <> MaikKoster.MDT.MVC.MDTRepository.DatabaseStatus.NoMDTDatabase Then%>
            <li>
                <%=Html.ActionLink("Applications", "ListAll", "Application", Nothing, Nothing)%></li>
            <li>
                <%=Html.ActionLink("Packages", "ListAll", "Package", Nothing, Nothing)%></li>
            <li>
                <%=Html.ActionLink("Administrators", "ListAll", "Administrator", Nothing, Nothing)%></li>
            <li>
                <%=Html.ActionLink("Package Mappings", "List", "PackageMapping", Nothing, Nothing)%></li>
                <%If DBStatus = MaikKoster.MDT.MVC.MDTRepository.DatabaseStatus.FrontEndVersion1 Then%>
            <li>
                <%=Html.ActionLink("Role Mappings", "List", "RoleMapping", Nothing, Nothing)%></li>
            <li>
                <%=Html.ActionLink("Access Roles", "List", "AccessRole", Nothing, Nothing)%></li>
            <li>
                <%=Html.ActionLink("Users", "List", "User", Nothing, Nothing)%></li>
                <%End If%>
            <%End If %>
            <li>
                <%=Html.ActionLink("Configuration", "Configure", "Admin", Nothing, Nothing)%>
            </li>
        </ul>
    </div>
</asp:Content>
