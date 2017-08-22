<%@ Control Language="VB" Inherits="System.Web.Mvc.ViewUserControl(Of IEnumerable (Of MaikKoster.MDT.Model.Settings_Role))" %>
<%="" %>
<%  If Model.Count > 0 Then%>
<table>
    <tr>
        <th>
            Role
        </th>
        <th>
        </th>
    </tr>
    <% For Each item In Model%>
    <tr>
        <td>
            <%= Html.Encode(item.Role) %>
        </td>
        <td>
            <%=Html.ActionLink("Delete", "Delete", "Role", New With {.IdentityType = ViewData("IdentityType"), .IdentityID = ViewData("IdentityID"), .Sequence = item.Sequence}, New With {.Class = "DeleteLink"})%>
        </td>
    </tr>
    <% Next%>
</table>
<%  End If%>
<%  Using Html.BeginForm("Add", "Role", New With {.IdentityType = ViewData("IdentityType"), .IdentityID = ViewData("IdentityID")}, FormMethod.Post, New With {.Class = "MDTForm"})%>
<fieldset>
    <p>
        <label for="Role">
            New Role:</label>
        <%=Html.DropDownList("Role", CType(ViewData("Roles"), SelectList), "")%>
    </p>
    <p>
        <input type="submit" value="Add" name="SubmitValues" class="ui-state-default fg-button ui-corner-all"/>
        <input type="submit" value="Cancel" name="SubmitValues" class="ui-state-default fg-button ui-corner-all"/>
    </p>
</fieldset>
<%  End Using%>
