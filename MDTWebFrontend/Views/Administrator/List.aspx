<%@ Page Title="" Language="VB" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage(Of IEnumerable (Of MaikKoster.MDT.Model.Settings_Administrator))" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	List
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>List</h2>

    <p>
        <%=Html.ActionLink("Create New", "Create")%>
    </p>
    
    <table>
        <tr class="ui-widget ui-widget-header">
            <th></th>
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
                Administrators
            </th>
        </tr>

    <% For Each item In Model%>
    
        <tr>
            <td>
                <%=Html.ActionLink("Edit", "Edit", New With {.id = item.Type})%> |
                <%=Html.ActionLink("Details", "Details", New With {.id = item.Type})%>
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
                <%= Html.Encode(item.Administrators) %>
            </td>
        </tr>
    
    <% Next%>

    </table>

</asp:Content>

