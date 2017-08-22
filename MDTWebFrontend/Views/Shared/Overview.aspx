<%@ Page Title="" Language="VB" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage(Of IQueryable(Of MaikKoster.MDT.Model.AccessRole))" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    MDT Frontend
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        <%=Html.Encode(ViewData("IdentityType") & " " & ViewData("IdentityName"))%>
    </h2>
    <%If Model.Count > 0 Then%>
    <div id="tabs">
        <ul>
            <%If Model.Select(Function(t) t.Details).Max > 0 Then%>
            <li>
                <%=Html.RouteLink("Details", New With {.controller = ViewData("IdentityType"), .action = "Details", .IdentityType = ViewData("IdentityType"), .IdentityID = ViewData("IdentityID")})%></li>
            <%End If%>
            <%If ViewData("IdentityType") = "Location" Then%>
            <%If Model.Select(Function(t) t.Gateways).Max > 0 Then%>
            <li>
                <%=Html.RouteLink("Gateways", New With {.controller = ViewData("IdentityType"), .action = "Gateways", .IdentityType = ViewData("IdentityType"), .IdentityID = ViewData("IdentityID")})%></li>
            <%End If%>
            <%End If%>
            <%If Model.Select(Function(t) t.Settings).Max > 0 Then%>
            <li>
                <%=Html.RouteLink("Settings", New With {.controller = "Setting", .action = "List", .IdentityType = ViewData("IdentityType"), .IdentityID = ViewData("IdentityID")})%></li>
            <%End If%>
            <%If ViewData("IdentityType") <> "Role" Then%>
            <%If Model.Select(Function(t) t.Roles).Max > 0 Then%>
            <li>
                <%=Html.RouteLink("Roles", New With {.controller = "Role", .action = "List", .IdentityType = ViewData("IdentityType"), .IdentityID = ViewData("IdentityID")})%></li>
            <%End If%>
            <%End If%>
            <%If Model.Select(Function(t) t.Applications).Max > 0 Then%>
            <li>
                <%=Html.RouteLink("Applications", New With {.controller = "Application", .action = "List", .IdentityType = ViewData("IdentityType"), .IdentityID = ViewData("IdentityID")})%></li>
            <%End If%>
            <%If Model.Select(Function(t) t.Packages).Max > 0 Then%>
            <li>
                <%=Html.RouteLink("Packages", New With {.controller = "Package", .action = "List", .IdentityType = ViewData("IdentityType"), .IdentityID = ViewData("IdentityID")})%></li>
            <%End If%>
            <%If Model.Select(Function(t) t.Administrators).Max > 0 Then%>
            <li>
                <%=Html.RouteLink("Administrators", New With {.controller = "Administrator", .action = "List", .IdentityType = ViewData("IdentityType"), .IdentityID = ViewData("IdentityID")})%></li>
            <%End If%>
        </ul>
    </div>
   <%-- Found the following access Roles:<br />
    <%For Each item In Model%>
    <%=Html.Encode(item.Name)%><br />
    <%Next%>--%>
    <%Else%>
    No Access!
    <%End If%>
</asp:Content>
