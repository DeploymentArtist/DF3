<%@ Control Language="VB" Inherits="System.Web.Mvc.ViewUserControl" %>

    <p>
        <label for="RoleToAdd" style="font-weight:bold">
            Add Role:</label><br />
        <%=Html.DropDownList("RoleToAdd", CType(Me.ViewData("Roles"), SelectList))%>
    </p>

