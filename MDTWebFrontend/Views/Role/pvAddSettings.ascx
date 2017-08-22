<%@ Control Language="VB" Inherits="System.Web.Mvc.ViewUserControl(Of MaikKoster.MDT.Model.RoleIdentity)" %>
<%="" %>
    <% Using Html.BeginForm() %>

<fieldset>
    <p>
        <label for="ID">
            Role:</label>
        <%=Html.DropDownList("ID", CType(ViewData("Roles"), SelectList))%>
    </p>
    <p>
        <input type="submit" value="Add" name="AddRole" class="ui-state-default fg-button ui-corner-all"/>
        <input type="submit" value="Cancel" name="AddRole" class="ui-state-default fg-button ui-corner-all"/>
    </p>
</fieldset>
    <% End Using %>

