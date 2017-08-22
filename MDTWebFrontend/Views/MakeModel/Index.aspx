<%@ Page Title="" Language="VB" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage(Of IEnumerable (Of MaikKoster.MDT.Model.MakeModelIdentity))" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Index
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <%="" %>
    <p>
        <%  If CType(ViewData("AccessLevel"), MaikKoster.MDT.Model.Enums.AccessLevel) = MaikKoster.MDT.Model.Enums.AccessLevel.Change Then%>
        <a href="<%=Url.RouteUrl(New With {.action = "Create", .controller = "MakeModel"})%>"
            class="fg-button ui-state-default ui-corner-all linkbutton" style="color: #2E6E9E;">
            Add MakeModel</a>
        <%End If%>

    </p>
    <%If Model.Count > 0 Then%>
    <table class="tablesorter">
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
                Make
            </th>
            <th>
                Model
            </th>
        </tr>
        </thead>
        <tbody>
        <% For Each item In Model%>
        <tr>
            <%  If CType(ViewData("AccessLevel"), MaikKoster.MDT.Model.Enums.AccessLevel) >= MaikKoster.MDT.Model.Enums.AccessLevel.ReadOnly Then%>
            <td nowrap>
                <a title="Show Details of MakeModel <%=html.encode(Item.MakeModelName)%>" href="<%=Url.RouteUrl(New With {.action = "Overview", .controller = "Identity", .IdentityType = "MakeModel", .IdentityID = item.ID})%>">
                    <img src=<%=Url.Image("edit_details.png")%> alt="Details" class="editicon"/></a>
                <%  If CType(ViewData("AccessLevel"), MaikKoster.MDT.Model.Enums.AccessLevel) = MaikKoster.MDT.Model.Enums.AccessLevel.Change Then%>
                    <a title="Delete MakeModel <%=html.encode(Item.MakeModelName)%>" href="<%=Url.RouteUrl(New With {.action = "Delete", .controller = "Identity", .IdentityType = "MakeModel", .IdentityID = item.ID})%>" class="IndexConfirmDeleteLink">
                        <img src=<%=Url.Image("deleteicon.png")%> alt="Delete" class="deleteicon"/></a>
                <%End If%>
            </td>
            <td>
                <%= Html.Encode(item.ID) %>
            </td>
            <%End If %>
            <td>
                <%= Html.Encode(item.Make) %>
            </td>
            <td>
                <%=Html.Encode(item.Model)%>
            </td>
        </tr>
        <% Next%>
        </tbody>
    </table>
    <%End If%>
</asp:Content>
