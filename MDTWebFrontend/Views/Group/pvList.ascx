<%@ Control Language="VB" Inherits="System.Web.Mvc.ViewUserControl(Of IEnumerable (Of MaikKoster.MDT.Model.Group))" %>
<%="" %>
    <p>
        <a href="<%=Url.RouteUrl(New With {.action = "Create", .controller = "Group"})%>"
            class="fg-button ui-state-default ui-corner-all linkbutton" style="color: #2E6E9E;">
            Add Group</a>
    </p>
    <%If Model.Count > 0 Then%>
    <table class="tablesorter ui-helper-reset ui-helper-clearfix">
        <thead>
        <tr class="ui-widget ui-widget-header">
            <th></th>
            <th>
                Name
            </th>
            <th>
                Description
            </th>

        </tr>
        </thead>
        <tbody>

        <% For Each item In Model%>
    
        <tr>
            <td>
                <a title='Edit Group "<%=html.encode(Item.Name)%>"' href="<%=Url.RouteUrl(New With {.action = "Edit", .controller = "Group", .ID = item.ID})%>">
                        <img src=<%=Url.Image("edit_details.png")%> alt="Edit" class="editicon"/></a>     
                <a title="Delete Group <%=html.encode(Item.Name)%>" href="<%=Url.RouteUrl(New With {.action = "Delete", .controller = "Group", .ID = item.ID})%>" class="ConfirmDeleteLink">
                    <img src=<%=Url.Image("deleteicon.png")%> alt="Delete" class="deleteicon"/></a>
            </td>
            <td>
                <%= Html.Encode(item.Name) %>
            </td>
            <td>
                <%= Html.Encode(item.Description) %>
            </td>
        </tr>
    
        <% Next%>
        </tbody>

    </table>
    <% End If%>
