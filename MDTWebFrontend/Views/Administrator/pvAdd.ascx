<%@ Control Language="VB" Inherits="System.Web.Mvc.ViewUserControl(Of IEnumerable (Of MaikKoster.MDT.Model.Settings_Administrator))" %>
<%="" %>
<%  Using Html.BeginForm("Add", "Administrator", New With {.IdentityType = ViewData("IdentityType"), .IdentityID = ViewData("IdentityID")}, FormMethod.Post, New With {.Class = "MDTForm"})%>
<%  If Model.Count > 0 Then%>
<table>
    <tr>
        <th>
            Administrators
        </th>
        <th></th>
    </tr>
    <% For Each item In Model%>
    <tr>
        <td>
            <%= Html.Encode(item.Administrators) %>
        </td>
        <td>
            <%=Html.ActionLink("Delete", "Delete", "Administrator", New With {.IdentityType = ViewData("IdentityType"), .IdentityID = ViewData("IdentityID"), .Sequence = item.Sequence}, New With {.Class = "DeleteLink"})%>
        </td>
    </tr>
    <% Next%>
</table>
<%  End If%>
<fieldset>
    <p>
        <label for="Administrator">
            New Administrator:</label>
        <%=Html.TextBox("Administrator", "", New With {.Class = "AdministratorAutocomplete"})%>
        <%= Html.ValidationMessage("Administrators", "*") %>
    </p>
    <p>
        <input type="submit" value="Add" name="AddAdmin" class="ui-state-default fg-button ui-corner-all"/>
        <input type="submit" value="Cancel" name="AddAdmin" class="ui-state-default fg-button ui-corner-all"/>
    </p>
</fieldset>
<%  End Using%>
