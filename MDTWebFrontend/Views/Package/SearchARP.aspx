<%@ Page Title="" Language="VB" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage(Of IEnumerable (Of MaikKoster.SCCM.Model.v_GS_ADD_REMOVE_PROGRAMS))" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	SearchARP
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>SearchARP</h2>

    <p>
        <%=Html.ActionLink("Create New", "Create")%>
    </p>
    
    <table>
        <tr>
            <th></th>
            <th>
                ResourceID
            </th>
            <th>
                GroupID
            </th>
            <th>
                RevisionID
            </th>
            <th>
                AgentID
            </th>
            <th>
                TimeStamp
            </th>
            <th>
                DisplayName0
            </th>
            <th>
                InstallDate0
            </th>
            <th>
                ProdID0
            </th>
            <th>
                Publisher0
            </th>
            <th>
                Version0
            </th>
        </tr>

    <% For Each item In Model%>
    
        <tr>
            <td>
                <%=Html.ActionLink("Edit", "Edit", New With {.id = item.ResourceID})%> |
                <%=Html.ActionLink("Details", "Details", New With {.id = item.ResourceID})%>
            </td>
            <td>
                <%= Html.Encode(item.ResourceID) %>
            </td>
            <td>
                <%= Html.Encode(item.GroupID) %>
            </td>
            <td>
                <%= Html.Encode(item.RevisionID) %>
            </td>
            <td>
                <%= Html.Encode(item.AgentID) %>
            </td>
            <td>
                <%= Html.Encode(String.Format("{0:g}", item.TimeStamp)) %>
            </td>
            <td>
                <%= Html.Encode(item.DisplayName0) %>
            </td>
            <td>
                <%= Html.Encode(item.InstallDate0) %>
            </td>
            <td>
                <%= Html.Encode(item.ProdID0) %>
            </td>
            <td>
                <%= Html.Encode(item.Publisher0) %>
            </td>
            <td>
                <%= Html.Encode(item.Version0) %>
            </td>
        </tr>
    
    <% Next%>

    </table>

</asp:Content>

