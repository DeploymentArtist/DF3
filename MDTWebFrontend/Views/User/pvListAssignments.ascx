<%@ Control Language="VB" Inherits="System.Web.Mvc.ViewUserControl(Of IEnumerable (Of MaikKoster.MDT.Model.AccessRoleAssignment))" %>
<%="" %>
    <h2>
        <%Dim MyUser As MaikKoster.MDT.Model.User = CType(ViewData("User"), MaikKoster.MDT.Model.User)%>
        <%=Html.Encode(String.Format("Current Assignments for User {0}", MyUser.Username))%>
    </h2>
    
<%If model.count > 0 Then %>
    <table class="tablesorter">
        <thead>
        <tr class="ui-widget ui-widget-header">
            <th></th>
            <th>
                AccessRole
            </th>
            <th>
                Instance
            </th>
        </tr>
        </thead>
        <tbody>
        <% For Each item In Model%>
        <tr>
            <%--<td>
                <%=Html.ActionLink("Edit", "Edit", New With {.id = item.ID})%> |
                <%=Html.ActionLink("Details", "Details", New With {.id = item.ID})%>
            </td>--%>
            <td>
                <a title="Delete Assignment" href="<%=Url.RouteUrl(New With {.action = "DeleteAssignment", .controller = "User", .ID = item.UserID, .AssignmentID = item.AssignmentId})%>" class="ConfirmDeleteLink">
                    <img src=<%=Url.Image("deleteicon.png")%> alt="Delete" class="deleteicon"/> </a>

            </td>
            <td>
                <%=Html.Encode(item.AccessRoleName)%>
            </td>

            <td>
                <%If item.InstanceID > 0 Then%>
                    <%=Html.Encode(item.InstanceName)%>
                <%Else%>
                    All
                <%End If%>
            </td>
        </tr>
        <% Next%>
        </tbody>
    </table>
<%Else %>
<br />

No Assignments configured

<%End If %>

<br />

    <p>
        <%-- <a href="<%=Url.RouteUrl(New With {.action = "Step1", .controller = "AccessRoleMember", .ID = ar.ID})%>"
            class="fg-button ui-state-default ui-corner-all linkbutton" style="color: #2E6E9E;">
            Create new Assignment(s)</a>--%>
            
        <a href="<%=Url.RouteUrl(New With {.action = "List", .controller = "User"})%>"
            class="fg-button ui-state-default ui-corner-all linkbutton" style="color: #2E6E9E;">
            Back</a>

    </p>


