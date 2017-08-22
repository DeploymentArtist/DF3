<%@ Page Title="" Language="VB" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage(Of IEnumerable (Of MaikKoster.MDT.Model.MakeModelRoles))" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	MM
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>MM</h2>

    <p>
        <%=Html.ActionLink("Create New", "Create")%>
    </p>
    
    <table>
        <tr>
            <th></th>
            <th>
                Make
            </th>
            <th>
                Model
            </th>
            <th>
                Type
            </th>
            <th>
                ID
            </th>
            <th>
                Sequence
            </th>
            <th>
                Role
            </th>
        </tr>

    <% For Each item In Model%>
    
        <tr>
            <td>
                <%=Html.ActionLink("Edit", "Edit", New With {.id = item.Type})%> |
                <%=Html.ActionLink("Details", "Details", New With {.id = item.Type})%>
            </td>
            <td>
                <%= Html.Encode(item.Make) %>
            </td>
            <td>
                <%= Html.Encode(item.Model) %>
            </td>
            <td>
                <%= Html.Encode(item.Type) %>
            </td>
            <td>
                <%= Html.Encode(item.ID) %>
            </td>
            <td>
                <%= Html.Encode(item.Sequence) %>
            </td>
            <td>
                <%= Html.Encode(item.Role) %>
            </td>
        </tr>
    
    <% Next%>

    </table>

</asp:Content>

