<%@ Control Language="VB" Inherits="System.Web.Mvc.ViewUserControl(Of IEnumerable (Of MaikKoster.MDT.Model.Settings_Application))" %>
<%="" %>
<%  If Model.Count > 0 Then%>
<table>
    <tr class="ui-widget ui-widget-header">
        <th>
            Applications
        </th>
        <th></th>
    </tr>
    <% For Each item In Model%>
    <tr>
        <td>
            <%=Html.Encode(item.Applications)%>
        </td>
        <td>
            <%=Html.ActionLink("Delete", "Delete", "Application", New With {.IdentityType = ViewData("IdentityType"), .IdentityID = ViewData("IdentityID"), .Sequence = item.Sequence}, New With {.Class = "DeleteLink"})%>
        </td>
    </tr>
    <% Next%>
</table>
<%  End If%>
<%  Using Html.BeginForm("Add", "Application", New With {.IdentityType = ViewData("IdentityType"), .IdentityID = ViewData("IdentityID")}, FormMethod.Post, New With {.Class = "MDTForm"})%>

        <fieldset>
            <p>
                <label for="Application">New Application:</label>
                <%=Html.TextBox("Application", "", New With {.Class = "ApplicationAutocomplete"})%>
                <%=Html.ValidationMessage("Application", "*")%>
            </p>
            <p>
                <input type="submit" value="Add" name="AddApp" class="ui-state-default fg-button ui-corner-all"/>
                <input type="submit" value="Cancel" name="AddApp" class="ui-state-default fg-button ui-corner-all"/>
            </p>
        </fieldset>
<%End Using %>

