<%@ Control Language="VB" Inherits="System.Web.Mvc.ViewUserControl(Of MaikKoster.MDT.Model.MakeModelIdentity)" %>
<%="" %>
<div class="clear">
    <div id="details" class="ui-widget-content ui-corner-all mdt-widget">
        <div class="ui-widget-header mdt-widget-header">
            MakeModel Details
        </div>
        <div class="Settings">  
            <table>
                <tr>
                    <td width="119px">
                        ID
                    </td>
                    <td>
                        <%= Html.Encode(Model.ID) %>
                    </td>
                </tr>
                <tr>
                    <td>
                        Make
                    </td>
                    <td>
                        <%=Html.Encode(Model.Make)%>
                    </td>
                </tr>
                <tr>
                    <td>
                        Model
                    </td>
                    <td>
                        <%=Html.Encode(Model.Model)%>
                    </td>
                </tr>
            </table>
            <%  If CType(ViewData("AccessLevel"), MaikKoster.MDT.Model.Enums.AccessLevel) = MaikKoster.MDT.Model.Enums.AccessLevel.Change Then%>
            <p>
                <a title="Edit MakeModel" href="<%=Url.RouteUrl(New With {.action = "Edit", .controller = "MakeModel", .IdentityType = "MakeModel", .IdentityID = Model.ID})%>"
                    class="fg-button ui-state-default ui-corner-all linkbutton EditIdentity">
                    Edit MakeModel</a> 
                <a title="Delete MakeModel <%=html.encode(Model.make & " " & model.model)%>"
                        href="<%=Url.RouteUrl(New With {.action = "Delete", .controller = "Identity", .IdentityType = "MakeModel", .IdentityID = Model.ID})%>"
                        class="fg-button ui-state-default ui-corner-all linkbutton DeleteIdentity">
                        Delete MakeModel</a>
            </p>
            <%End If %>
        </div>
    </div>
</div>
<br class="clear" />