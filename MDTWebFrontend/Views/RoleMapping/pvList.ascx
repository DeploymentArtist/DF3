<%@ Control Language="VB" Inherits="System.Web.Mvc.ViewUserControl(Of IEnumerable (Of MaikKoster.MDT.Model.RoleMappingView))" %>

    <p>
        <a href="<%=Url.RouteUrl(New With {.action = "Create", .controller = "RoleMapping"})%>"
        class="fg-button ui-state-default ui-corner-all linkbutton">Add Role Mapping</a>
    </p>
    <br />
    <% If Model.Count > 0 Then%>
    <table class="tablesorter ui-helper-reset ui-helper-clearfix">
        <thead>
        <tr class="ui-widget ui-widget-header">
            <th></th>
            <th>
                Role
            </th>
            <th>
                ARP Name
            </th>
        </tr>
        </thead>
        <tbody>
        <% For Each item In Model%>
        <tr>
            <td>
                <a title="Delete Role Mapping" href="<%=Url.RouteUrl(New With {.action = "Delete", .controller = "RoleMapping", .ID = item.ID, .ARPName = item.ARPName})%>" class="ConfirmDeleteLink">
                    <img src=<%=Url.Image("deleteicon.png")%> alt="Delete" class="deleteicon"/></a>
            </td>
            <td>
                <%= Html.Encode(item.Role) %>
            </td>
            <td>
                <%= Html.Encode(item.ARPName) %>
            </td>
        </tr>
        <% Next%>
        </tbody>
    </table>
    <%End If%>
<%Html.RenderPartial("pvStatusInfo")%>