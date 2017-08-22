<%@ Page Title="" Language="VB" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage(Of IEnumerable (Of MaikKoster.MDT.Model.Settings_Application))" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Index</h2>

   
    <table>
        <tr class="ui-widget ui-widget-header">
            <th></th>
            <th>
                Applications
            </th>
        </tr>

    <% For Each item In Model%>
    
        <tr>
            <td>
                <%=Html.ActionLink("Edit", "Edit", New With {.id = item.Applications})%> |
                <%=Html.ActionLink("Details", "Details", New With {.id = item.Applications})%>
            </td>
             <td>
                <%=Html.Encode(item.Name)%>
            </td>
        </tr>
    
    <% Next%>

    </table>

</asp:Content>

