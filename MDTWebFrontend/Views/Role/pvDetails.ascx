<%@ Control Language="VB" Inherits="System.Web.Mvc.ViewUserControl(Of MaikKoster.MDT.Model.RoleIdentity)" %>
<div class="clear">
    <div id="details" class="ui-widget-content ui-corner-all mdt-widget">
        <div class="ui-widget-header mdt-widget-header">
            Role Details
        </div>
        <div class="Settings">  
            <table>
                <tr>
                    <td width="27px">
                        ID
                    </td>
                    <td>
                        <%= Html.Encode(Model.ID) %>
                    </td>
                </tr>
                <tr>
                    <td>
                        Role
                    </td>
                    <td>
                        <%=Html.Encode(Model.Role)%>
                    </td>
                </tr>
            </table>
            <% If CType(ViewData("AccessLevel"), MaikKoster.MDT.Model.Enums.AccessLevel) = MaikKoster.MDT.Model.Enums.AccessLevel.Change Then%>
            <p>
                <a title="Edit Role" href="<%=Url.RouteUrl(New With {.action = "Edit", .controller = "Role", .IdentityType = "Role", .IdentityID = Model.ID})%>"
                    class="fg-button ui-state-default ui-corner-all linkbutton EditIdentity">
                    Edit Role</a>
                <a title="Delete Role <%=html.encode(Model.Role)%>" href="<%=Url.RouteUrl(New With {.action = "Delete", .controller = "Identity", .IdentityType = "Role", .IdentityID = Model.ID})%>"
                    class="fg-button ui-state-default ui-corner-all linkbutton DeleteIdentity">
                    Delete Role</a>
            </p>
            <% End If%>
        </div>
    </div>
</div>
<br class="clear" />