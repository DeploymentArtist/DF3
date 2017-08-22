<%@ Page Title="" Language="VB" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage(Of IEnumerable (Of MaikKoster.MDT.Model.ComputerIdentity))" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Index</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <%="" %>
    <p>
        <%  If CType(ViewData("AccessLevel"), MaikKoster.MDT.Model.Enums.AccessLevel) = MaikKoster.MDT.Model.Enums.AccessLevel.Change Then%>
        <a href="<%=Url.RouteUrl(New With {.action = "Create", .controller = "Computer"})%>"
            class="fg-button ui-state-default ui-corner-all linkbutton" style="color: #2E6E9E;">
            Add Computer</a>
        <%End If%>

    </p>
    <%  If Model.Count > 0 Then%>
    <table class="ui-helper-reset ui-helper-clearfix tablesorter">
        <thead>
        <tr class="ui-widget ui-widget-header">
            <%  If CType(ViewData("AccessLevel"), MaikKoster.MDT.Model.Enums.AccessLevel) >= MaikKoster.MDT.Model.Enums.AccessLevel.ReadOnly Then%>
            <th>
            </th>
            <th>
                ID
            </th>
            <%End If %>
            <th>
                Description
            </th>
            <th>
                AssetTag
            </th>
            <th>
                UUID
            </th>
            <th>
                SerialNumber
            </th>
            <th>
                MacAddress
            </th>
        </tr>
        </thead>
        <tbody>
        <% For Each item In Model%>
        <tr>
            <%  If CType(ViewData("AccessLevel"), MaikKoster.MDT.Model.Enums.AccessLevel) >= MaikKoster.MDT.Model.Enums.AccessLevel.ReadOnly Then%>
            <td nowrap>
                <a title="Show Details of Computer <%=html.encode(Item.Description)%>" href="<%=Url.RouteUrl(New With {.action = "Overview", .controller = "Identity", .IdentityType = "Computer", .IdentityID = item.ID})%>">
                    <img src=<%=Url.Image("edit_details.png")%> alt="Details" class="editicon"/></a>
                <%  If CType(ViewData("AccessLevel"), MaikKoster.MDT.Model.Enums.AccessLevel) = MaikKoster.MDT.Model.Enums.AccessLevel.Change Then%>
                    <a title="Delete Computer <%=html.encode(Item.Description)%>" href="<%=Url.RouteUrl(New With {.action = "Delete", .controller = "Identity", .IdentityType = "Computer", .IdentityID = item.ID})%>" class="IndexConfirmDeleteLink">
                        <img src=<%=Url.Image("deleteicon.png")%> alt="Delete" class="deleteicon"/></a>
                <%End If%>
            </td>
            <td>
                <%= Html.Encode(item.ID) %>
            </td>
            <%End If %>
            <td>
                <%= Html.Encode(item.Description) %>
            </td>
            <td>
                <%= Html.Encode(item.AssetTag) %>
            </td>
            <td>
                <%= Html.Encode(item.UUID) %>
            </td>
            <td>
                <%= Html.Encode(item.SerialNumber) %>
            </td>
            <td>
                <%= Html.Encode(item.MacAddress) %>
            </td>
        </tr>
        <% Next%>
        </tbody>
    </table>
    <%End If%>
</asp:Content>
