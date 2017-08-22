<%@ Control Language="VB" Inherits="System.Web.Mvc.ViewUserControl(Of IEnumerable (Of MaikKoster.MDT.Model.User))" %>

    <p>
        <a href="<%=Url.RouteUrl(New With {.action = "Create", .controller = "User"})%>"
            class="fg-button ui-state-default ui-corner-all linkbutton" style="color: #2E6E9E;">
            Add User</a>
    </p>
    
    <table class="tablesorter ui-helper-reset ui-helper-clearfix">
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
            <th>
                IsAdmin
            </th>
        </tr>
        </thead>
        <tbody>

        <% For Each item In Model%>
        <tr>
            <td>
                <a title='Edit User "<%=html.encode(Item.Username)%>"' href="<%=Url.RouteUrl(New With {.action = "Edit", .controller = "User", .ID = item.ID})%>">
                    <img src=<%=Url.Image("edit_details.png")%> alt="Edit" class="editicon"/></a>
                <a title="Delete User <%=html.encode(Item.Username)%>" href="<%=Url.RouteUrl(New With {.action = "Delete", .controller = "User", .ID = item.ID})%>" class="ConfirmDeleteLink">
                    <img src=<%=Url.Image("deleteicon.png")%> alt="Delete" class="deleteicon"/></a>
                <a title='Show Access Role Assignments of User <%=html.encode(Item.Username)%>' href="<%=Url.RouteUrl(New With {.action = "ListAssignments", .controller = "User", .ID = item.ID})%>">
                    <img src=<%=Url.Image("Members.png")%> alt="Assignments" class="editicon"/></a>
            </td>
            <td>
                <%= Html.Encode(item.Username) %>
            </td>
            <td>
                <%= Html.Encode(item.Lastname) %>
            </td>
            <td>
                <%= Html.Encode(item.Firstname) %>
            </td>
            <td>
                <%= Html.Encode(item.IsAdmin) %>
            </td>
        </tr>
        <% Next%>
        </tbody>
    </table>


