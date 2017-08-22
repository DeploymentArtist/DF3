<%@ Control Language="VB" Inherits="System.Web.Mvc.ViewUserControl(Of List (Of String))" %>
<br />
<%=""%>
<%  If Model.Count > 0 Then%>
<ul class="MDT">
    <%For Each Item In Model%>
    <li class="ui-corner-all ui-state-default">
            <a title="Edit Administrator <%=html.encode(Item)%>" href="<%=Url.RouteUrl(New With {.action = "Edit", .controller = "Administrator", .id = Item})%>">
            <img src=<%=Url.Image("edit_details.png")%> alt="Edit" class="deleteicon"/> </a>
        <a title="Delete Administrator <%=html.encode(Item)%>" href="<%=Url.RouteUrl(New With {.action = "DeleteAll", .controller = "Administrator", .Administrator = Item})%>"
            class="ConfirmDeleteLink">
            <img src=<%=Url.Image("deleteicon.png")%> alt="Delete" class="deleteicon"/> </a>
        <%=Html.ActionLink(Item, "Details", New With {.id = Item})%>
    </li>
    <%Next%>
</ul>
<%Else%>
<h2>No Administrators configured</h2>
<%  End If%>
<%Html.RenderPartial("pvStatusInfo")%>