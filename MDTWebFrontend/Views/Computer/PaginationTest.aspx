<%@ Page Title="" Language="VB" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage(Of PagedList (Of MaikKoster.MDT.Model.ComputerIdentity))" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	PaginationTest
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>PaginationTest</h2>

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
                Description
            </th>
            <th>
                AssetTag
            </th>
            <th>
                UUID
            </th>
            <th>
                SerialNumber
            </th>
            <th>
                MacAddress
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
                <%= Html.Encode(item.AssetTag) %>
            </td>
            <td>
                <%= Html.Encode(item.UUID) %>
            </td>
            <td>
                <%= Html.Encode(item.SerialNumber) %>
            </td>
            <td>
                <%= Html.Encode(item.MacAddress) %>
            </td>
        </tr>
    
    <% Next%>

    </table>

<%  Html.RenderPartial("Pagination.ascx", New MaikKoster.MDT.MVC.PaginationViewData With { _
            .PageIndex = Model.PageIndex, _
          .TotalPages = Model.TotalPages, _
          .PageActionLink = "http://www.google.de.", _
          .TotalCount = Model.TotalCount, _
          .PageSize = Model.PageSize})%>  


</asp:Content>

