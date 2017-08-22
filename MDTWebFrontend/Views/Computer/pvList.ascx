<%@ Control Language="VB" Inherits="System.Web.Mvc.ViewUserControl(Of IEnumerable (Of MaikKoster.MDT.Model.ComputerIdentity))" %>

    <p>
        <%=Html.ActionLink("Create New", "Create")%>
    </p>
    
    <table>
        <tr class="ui-widget ui-widget-header">
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


