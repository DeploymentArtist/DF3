<%@ Control Language="VB" Inherits="System.Web.Mvc.ViewUserControl(Of MaikKoster.MDT.Model.LocationIdentity)" %>
<div class="clear">
    <div id="details" class="ui-widget-content ui-corner-all mdt-widget">
        <div class="ui-widget-header mdt-widget-header">
            Location Details
        </div>
        <div class="Settings">
            <%  Using Html.BeginForm("Edit", "Location", New With {.IdentityID = Model.ID}, FormMethod.Post, New With {.Class = "MDTForm"})%>
            <%=Html.ValidationSummary("Edit was unsuccessful. Please correct the errors and try again.")%>
            <table>
                <tr>
                    <td width="83px">
                        ID
                    </td>
                    <td>
                        <%= Html.Encode(Model.ID) %>
                        <%=Html.Hidden("ID")%>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="Location">Location</label>
                    </td>
                    <td>
                        <%= Html.TextBox("Location", Model.Location) %>
                        <%= Html.ValidationMessage("Location", "*") %>
                    </td>
                </tr>
            </table>
            
            <input type="submit" value="Save" name="SubmitValues" class="ui-state-default fg-button ui-corner-all"/>
            <input type="submit" value="Cancel" name="SubmitValues" class="ui-state-default fg-button ui-corner-all"/>
            <% End Using %>
        </div>
    </div>
</div>
<br class="clear" />


