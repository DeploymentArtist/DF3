<%@ Control Language="VB" Inherits="System.Web.Mvc.ViewUserControl(Of IEnumerable (Of MaikKoster.MDT.Model.AccessRoleAssignment))" %>
<%="" %>
    <h2>
        <%Dim ar As MaikKoster.MDT.Model.AccessRole = CType(ViewData("AccessRole"), MaikKoster.MDT.Model.AccessRole)%>
        <%=Html.Encode(String.Format("Current Assignments for Access Role {0}", ar.Name))%>
    </h2>
    
<%If model.count > 0 Then %>
    <table class="tablesorter">
        <thead>
        <tr class="ui-widget ui-widget-header">
            <th></th>
            <th>
                Username
            </th>
            <th>
                Lastname
            </th>
            <th>
                Firstname
            </th>
            <%If ar.Type <> "A" Then%>
                <th>
                    Instance
                </th>
            <%End If%>
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
                <a title="Delete Assignment" href="<%=Url.RouteUrl(New With {.action = "Delete", .controller = "AccessRoleMember", .ID = item.AssignmentId, .AccessRoleID = item.AccessRoleID})%>" class="ConfirmDeleteLink">
                    <img src=<%=Url.Image("deleteicon.png")%> alt="Delete" class="deleteicon"/></a>

            </td>
            <td>
                <%=Html.Encode(item.Username)%>
            </td>
            <td>
                <%=Html.Encode(item.Lastname)%>
            </td>
            <td>
                <%=Html.Encode(item.Firstname)%>
            </td>
            <%If ar.Type <> "A" Then%>
                <td>
                    <%If item.InstanceID > 0 Then%>
                        <%=Html.Encode(item.InstanceName)%>
                    <%Else%>
                        All
                    <%End If%>
                </td>
            <%End If%>
        </tr>
    
        <% Next%>
        </tbody>

    </table>
<%Else %>
<br />

<h2>No Assignments configured</h2>

<%End If %>

<br />

    <p>
        <a href="<%=Url.RouteUrl(New With {.action = "Step1", .controller = "AccessRoleMember", .ID = ar.ID})%>"
            class="fg-button ui-state-default ui-corner-all linkbutton" style="color: #2E6E9E;">
            Create new Assignment(s)</a>
            
        <a href="<%=Url.RouteUrl(New With {.action = "List", .controller = "AccessRole"})%>"
            class="fg-button ui-state-default ui-corner-all linkbutton" style="color: #2E6E9E;">
            Back to List of Access Roles</a>

    </p>