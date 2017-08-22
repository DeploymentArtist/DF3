<%@ Control Language="VB" Inherits="System.Web.Mvc.ViewUserControl(Of MaikKoster.MDT.Model.RoleIdentity)" %>
<%  Using Html.BeginForm("Edit", "Role", New With {.IdentityID = Model.ID}, FormMethod.Post, New With {.Class = "MDTForm"})%>
<div class="clear">
    <div id="details" class="ui-widget-content ui-corner-all mdt-widget">
        <div class="ui-widget-header mdt-widget-header">
            Role Details
        </div>
        <div class="Settings">  
            <%=Html.ValidationSummary("Edit was unsuccessful. Please correct the errors and try again.")%>
            <table>
                <tr>
                    <td width="27px">
                        ID
                    </td>
                    <td>
                        <%= Html.Encode(Model.ID) %>
                        <%=Html.Hidden("ID")%>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="Role">Role</label>
                    </td>
                    <td>
                        <%=Html.TextBox("Role", Model.Role)%>
                        <%=Html.ValidationMessage("Role", "*")%>
                    </td>
                </tr>
            </table>
            
            <input type="submit" value="Save" name="SubmitValues" class="ui-state-default fg-button ui-corner-all"/>
            <input type="submit" value="Cancel" name="SubmitValues" class="ui-state-default fg-button ui-corner-all"/>

        </div>
    </div>
</div>
<br class="clear" />
<% End Using %>
