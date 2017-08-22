<%@ Control Language="VB" Inherits="System.Web.Mvc.ViewUserControl(Of List (Of String))" %>
<br />
<%=""%>
<%  If Model.Count > 0 Then%>
<ul class="MDT">
    <%For Each Item In Model%>
    <li class="ui-corner-all ui-state-default"><a title="Edit Package <%=html.encode(Item)%>"
        href="<%=Url.RouteUrl(New With {.action = "Edit", .controller = "Package", .CurrentPackage = Item})%>">
        <img src='<%=Url.Image("edit_details.png")%>' alt="Edit" class="deleteicon" />
    </a><a title="Delete Package <%=html.encode(Item)%>" href="<%=Url.RouteUrl(New With {.action = "DeleteAll", .controller = "Package", .Package = Item})%>"
        class="ConfirmDeleteLink">
        <img src='<%=Url.Image("deleteicon.png")%>' alt="Delete" class="deleteicon" />
    </a>
        <%=Html.ActionLink(Item, "Details", New With {.id = Item})%>
    </li>
    <%Next%>
</ul>
<%Else %>
<h2>No Packages configured!</h2>
<%  End If%>
<%Html.RenderPartial("pvStatusInfo")%>