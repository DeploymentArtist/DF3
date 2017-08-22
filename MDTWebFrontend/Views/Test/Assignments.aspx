<%@ Page Title="" Language="VB" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage(Of IEnumerable (Of MaikKoster.MDT.Model.AccessRoleAssignment))" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Assignments
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Assignments</h2>

    <p>
        <%=Html.ActionLink("Create New", "Create")%>
    </p>
    
    <table>
        <tr>
            <th></th>
            <th>
                ID
            </th>
            <th>
                UserID
            </th>
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
                AccessRoleID
            </th>
            <th>
                AccessRoleName
            </th>
            <th>
                InstanceID
            </th>
            <th>
                InstanceName
            </th>
        </tr>

    <% For Each item In Model%>
    
        <tr>
            <td>
                <%=Html.ActionLink("Edit", "Edit", New With {.id = item.AssignmentId})%> |
                <%=Html.ActionLink("Details", "Details", New With {.id = item.AssignmentId})%>
            </td>
            <td>
                <%=Html.Encode(item.AssignmentId)%>
            </td>
            <td>
                <%= Html.Encode(item.UserID) %>
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
                <%= Html.Encode(item.AccessRoleID) %>
            </td>
            <td>
                <%= Html.Encode(item.AccessRoleName) %>
            </td>
            <td>
                <%= Html.Encode(item.InstanceID) %>
            </td>
            <td>
                <%= Html.Encode(item.InstanceName) %>
            </td>
        </tr>
    
    <% Next%>

    </table>

</asp:Content>

