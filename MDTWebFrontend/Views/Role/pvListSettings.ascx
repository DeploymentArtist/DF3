<%@ Control Language="VB" Inherits="System.Web.Mvc.ViewUserControl(Of IEnumerable (Of MaikKoster.MDT.Model.Settings_Role))" %>
<%=""%>

<%  If Model.Count > 0 Then%>    
    <table>
        <tr>
            <th></th>
            <th>
                Role
            </th>
        </tr>

    <% For Each item In Model%>
    
        <tr>
            <td>
                <%--<%=Html.ActionLink("Edit", "Edit", New With {.id = item.Type})%> |--%>
                <%=Html.ActionLink("Details", "Details", New With {.id = item.Type})%>
            </td>
            <td>
                <%= Html.Encode(item.Role) %>
            </td>
        </tr>
    
    <% Next%>

    </table>

<%End If%>
<br />
    <p>
        <%=Html.RouteLink("Add Role", New With {.controller = "Role", .action = "Add", .IdentityType = ViewData("IdentityType"), .id = 2})%>
    </p>
