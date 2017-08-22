<%@ Page Title="" Language="VB" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage(Of IEnumerable (Of MaikKoster.MDT.Model.AccessRole))" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	List
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>List</h2>

    <p>
        <%=Html.ActionLink("Create New", "Create")%>
    </p>
    
    <%If Model.Count > 0 Then%>
    <table>
        <tr>
            <th></th>
            <th>
                ID
            </th>
            <th>
                Description
            </th>
            <th>
                Type
            </th>
            <th>
                Details
            </th>
            <th>
                Settings
            </th>
            <th>
                Applications
            </th>
            <th>
                Packages
            </th>
            <th>
                Administrators
            </th>
            <th>
                Gateways
            </th>
            <th>
                Roles
            </th>
            <th>
                Name
            </th>
            <th>
                Default
            </th>
        </tr>

    <% For Each item In Model%>
    
        <tr>
            <td>
                <%=Html.ActionLink("Edit", "Edit", New With {.id = item.ID})%> |
                <%=Html.ActionLink("Details", "Details", New With {.id = item.ID})%>
            </td>
            <td>
                <%= Html.Encode(item.ID) %>
            </td>
            <td>
                <%= Html.Encode(item.Description) %>
            </td>
            <td>
                <%= Html.Encode(item.Type) %>
            </td>
            <td>
                <%= Html.Encode(item.Details) %>
            </td>
            <td>
                <%= Html.Encode(item.Settings) %>
            </td>
            <td>
                <%= Html.Encode(item.Applications) %>
            </td>
            <td>
                <%= Html.Encode(item.Packages) %>
            </td>
            <td>
                <%= Html.Encode(item.Administrators) %>
            </td>
            <td>
                <%= Html.Encode(item.Gateways) %>
            </td>
            <td>
                <%= Html.Encode(item.Roles) %>
            </td>
            <td>
                <%= Html.Encode(item.Name) %>
            </td>
            <td>
                <%= Html.Encode(item.Default) %>
            </td>
        </tr>
    
    <% Next%>

    </table>
    <%End If%>

</asp:Content>

