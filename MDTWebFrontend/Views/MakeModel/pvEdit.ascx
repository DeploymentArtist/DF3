<%@ Control Language="VB" Inherits="System.Web.Mvc.ViewUserControl(Of MaikKoster.MDT.Model.MakeModelIdentity)" %>
<div class="clear">
    <div id="details" class="ui-widget-content ui-corner-all mdt-widget">
        <div class="ui-widget-header mdt-widget-header">
            MakeModel Details
        </div>
        <div class="Settings">
            <%  Using Html.BeginForm("Edit", "MakeModel", New With {.IdentityID = Model.ID}, FormMethod.Post, New With {.Class = "MDTForm"})%>
            <%=Html.ValidationSummary("Edit was unsuccessful. Please correct the errors and try again.")%>
            <table>
                <tr>
                    <td width="119px">
                        ID
                    </td>
                    <td>
                        <%= Html.Encode(Model.ID) %>
                        <%=Html.Hidden("ID")%>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="Make">Make</label>
                    </td>
                    <td>
                        <%= Html.TextBox("Make", Model.Make) %>
                        <%= Html.ValidationMessage("Make", "*") %>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="Model">Model</label>
                    </td>
                    <td>
                        <%=Html.TextBox("Model", Model.Model)%>
                        <%=Html.ValidationMessage("Model", "*")%>
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




