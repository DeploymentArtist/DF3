<%@ Control Language="VB" Inherits="System.Web.Mvc.ViewUserControl(Of MaikKoster.MDT.Model.ComputerIdentity)" %>
<div class="clear">
    <div id="details" class="ui-widget-content ui-corner-all mdt-widget">
        <div class="ui-widget-header mdt-widget-header">
            Computer Details
        </div>
        <div class="Settings">  
            <table>
                <tr>
                    <td width="99px">
                        ID
                    </td>
                    <td>
                        <%= Html.Encode(Model.ID) %>
                    </td>
                </tr>
                <tr>
                    <td>
                        Description
                    </td>
                    <td>
                        <%=Html.Encode(Model.Description)%>
                    </td>
                </tr>
                <tr>
                    <td>
                        AssetTag
                    </td>
                    <td>
                        <%=Html.Encode(Model.AssetTag)%>
                    </td>
                </tr>
                <tr>
                    <td>
                        UUID
                    </td>
                    <td>
                        <%=Html.Encode(Model.UUID)%>
                    </td>
                </tr>
                <tr>
                    <td>
                        Serial Number
                    </td>
                    <td>
                        <%=Html.Encode(Model.SerialNumber)%>
                    </td>
                </tr>
                <tr>
                    <td>
                        MAC Address
                    </td>
                    <td>
                        <%=Html.Encode(Model.MacAddress)%>
                    </td>
                </tr>
            </table>
            <%  If CType(ViewData("AccessLevel"), MaikKoster.MDT.Model.Enums.AccessLevel) = MaikKoster.MDT.Model.Enums.AccessLevel.Change Then%>
            <p>
                <a title="Edit Computer" href="<%=Url.RouteUrl(New With {.action = "Edit", .controller = "Computer", .IdentityType = "Computer", .IdentityID = Model.ID})%>"
                    class="fg-button ui-state-default ui-corner-all linkbutton EditIdentity">
                    Edit Computer</a>
                <a title="Delete Computer <%=html.encode(Model.Description)%>" href="<%=Url.RouteUrl(New With {.action = "Delete", .controller = "Identity", .IdentityType = "Computer", .IdentityID = Model.ID})%>"
                    class="fg-button ui-state-default ui-corner-all linkbutton DeleteIdentity">
                    Delete Computer</a>
            </p> 
            <%End If%>
        </div>
    </div>
</div>
<br class="clear" />