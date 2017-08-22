<%@ Control Language="VB" Inherits="System.Web.Mvc.ViewUserControl(Of MaikKoster.MDT.Model.LocationIdentity)" %>

<div class="clear">
    <div id="details" class="ui-widget-content ui-corner-all mdt-widget">
        <div class="ui-widget-header mdt-widget-header">
            Location Details
        </div>
        <div class="Settings">  
            <table>
                <tr>
                    <td width="83px">
                        ID
                    </td>
                    <td>
                        <%= Html.Encode(Model.ID) %>
                    </td>
                </tr>
                <tr>
                    <td>
                        Location
                    </td>
                    <td>
                        <%= Html.Encode(Model.Location) %>
                    </td>
                </tr>
            </table>
            <%  If CType(ViewData("AccessLevel"), MaikKoster.MDT.Model.Enums.AccessLevel) = MaikKoster.MDT.Model.Enums.AccessLevel.Change Then%>
            <br />
            <p>
            <a title="Edit Location" href="<%=Url.RouteUrl(New With {.action = "Edit", .controller = "Location", .IdentityType = "Location", .IdentityID = Model.ID})%>"
                class="fg-button ui-state-default ui-corner-all linkbutton EditIdentity">
                Edit Location</a>

                    <a title="Delete Location <%=html.encode(Model.Location)%>" href="<%=Url.RouteUrl(New With {.action = "Delete", .controller = "Identity", .IdentityType = "Location", .IdentityID = Model.ID})%>"
                class="fg-button ui-state-default ui-corner-all linkbutton DeleteIdentity">
                Delete Location</a>
                </p>
            <%End If%>
        </div>
    </div>
</div>
<br class="clear" />