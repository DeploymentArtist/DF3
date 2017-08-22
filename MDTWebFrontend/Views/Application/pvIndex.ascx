<%@ Control Language="VB" Inherits="System.Web.Mvc.ViewUserControl(Of List (Of MaikKoster.MDT.MVC.NameValue))" %>
<br />
<%=""%>
<%  If Model.Count > 0 Then%>
<ul class="MDT">
    <%For Each Item In Model%>
    <li class="ui-corner-all ui-state-default">
            <a title="Edit Application <%=html.encode(Item.Name)%>" href="<%=Url.RouteUrl(New With {.action = "Edit", .controller = "Application", .id = Item.Value})%>">
            <img src="<%=Url.Image("edit_details.png")%>" alt="Edit" class="deleteicon"/> </a>
        <a title="Delete Application <%=html.encode(Item.Name)%> and all references" href="<%=Url.RouteUrl(New With {.action = "DeleteAll", .controller = "Application", .Application = Item.Value})%>"
            class="ConfirmDeleteLink">
            <img src="<%=Url.Image("deleteicon.png")%>" alt="Delete" class="deleteicon"/> </a>
        <%=Html.ActionLink(Item.Name, "Details", New With {.id = Item.Value})%>
    </li>
    <%Next%>
</ul>
<%Else%>
<h2>No Applications configured!</h2>
<%  End If%>
<br />
<%=Html.ActionLink("Upload MDT Applications.xml file", "Upload", "Application", Nothing, New With {.class = "fg-button ui-state-default ui-corner-all linkbutton"})%><br />
<br />
<%Html.RenderPartial("pvStatusInfo")%>