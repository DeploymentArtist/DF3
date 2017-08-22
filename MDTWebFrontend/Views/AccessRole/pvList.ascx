<%@ Control Language="VB" Inherits="System.Web.Mvc.ViewUserControl(Of IEnumerable (Of MaikKoster.MDT.Model.AccessRole))" %>
    <div class="legend"><%=Html.Image(url.Image("Edit_NoAccess_Shield.png"))%>: No Access | <%=Html.Image(Url.Image("Edit_ReadOnlyAccess_Shield.png"))%>: Read Only | <%=Html.Image(Url.Image("Edit_FullAccess_Shield.png"))%>: Full Access</div>

    <p>
        <a href="<%=Url.RouteUrl(New With {.action = "Create", .controller = "AccessRole"})%>"
            class="fg-button ui-state-default ui-corner-all linkbutton">
            Add Access Role</a>
    </p>
    
    
    <%If Model.Count > 0 Then%>
    <table class="tablesorter ui-helper-reset ui-helper-clearfix">
        <thead>
        <tr class="ui-widget ui-widget-header center">
            <th ></th>
            <th>
                Name
            </th>
            <th>
                Description
            </th>
            <th>
                Type
            </th>
            <th>
                Details
            </th>
            <th>
                Settings
            </th>
            <th>
                Apps
            </th>
            <th>
                Pkgs
            </th>
            <th>
                Admins
            </th>
            <th>
                Gateways
            </th>
            <th>
                Roles
            </th>
            <th>
                Default
            </th>
            <th>
                Group
            </th>
        </tr>
        </thead>
        <tbody>

        <% For Each item In Model%>
        <tr>
            <td nowrap>

                <a title='Edit Access Role "<%=html.encode(Item.Name)%>"' href="<%=Url.RouteUrl(New With {.action = "Edit", .controller = "AccessRole", .ID = item.ID})%>">
                        <img src=<%=Url.Image("edit_details.png")%> alt="Edit" class="editicon"/></a>

                <a title="Delete Access Role <%=html.encode(Item.Name)%>" href="<%=Url.RouteUrl(New With {.action = "Delete", .controller = "AccessRole", .ID = item.ID})%>" class="ConfirmDeleteLink">
                    <img src=<%=Url.Image("deleteicon.png")%> alt="Delete" class="deleteicon"/></a>
                    
                <%If Not item.Default.HasValue OrElse Not item.Default Then%>
                    <a title='Assignments to Access Role "<%=html.encode(Item.Name)%>"' href="<%=Url.RouteUrl(New With {.action = "List", .controller = "AccessRoleMember", .ID = item.ID})%>">
                        <img src=<%=Url.Image("Members.png")%> alt="Assignments" class="editicon"/></a>
                <%End If %>
            </td>
            <td>
                <%= Html.Encode(item.Name) %>
            </td>
            <td>
                <%= Html.Encode(item.Description) %>
            </td>
            <td class="center">
                <%=Html.Encode(item.TypeName)%>
            </td>
            <td class="center">
                <%--<%=Html.Encode(item.DetailsLevelDescription)%>--%>
                <% Html.RenderPartial("pvAccessLevel", item.DetailsLevel)%>
            </td>
            <td class="center">
                <%--<%=Html.Encode(item.SettingsLevelDescription)%>--%>
                <% Html.RenderPartial("pvAccessLevel", item.SettingsLevel)%>
            </td>
            <td class="center">
                <%--<%=Html.Encode(item.ApplicationsLevelDescription)%>--%>
                <% Html.RenderPartial("pvAccessLevel", item.ApplicationsLevel)%>
            </td>
            <td class="center">
                <%--<%=Html.Encode(item.PackagesLevelDescription)%>--%>
                <% Html.RenderPartial("pvAccessLevel", item.PackagesLevel)%>
            </td>
            <td class="center">
                <%--<%=Html.Encode(item.AdministratorsLevelDescription)%>--%>
                <% Html.RenderPartial("pvAccessLevel", item.AdministratorsLevel)%>
            </td>
            <td class="center">
                <%--<%=Html.Encode(item.GatewaysLevelDescription)%>--%>
                <% Html.RenderPartial("pvAccessLevel", item.GatewaysLevel)%>
            </td>
            <td class="center">
                <%--<%=Html.Encode(item.RolesLevelDescription)%>--%>
                <% Html.RenderPartial("pvAccessLevel", item.RolesLevel)%>
            </td>
            <td class="center">
                <%= Html.Encode(item.Default) %>
            </td>
            <td>
                <%=Html.Encode(item.Group.Name)%>
            </td>
        </tr>
    
        <% Next%>
        </tbody>

    </table>
    <br class="clear"/>
<%end if %>

