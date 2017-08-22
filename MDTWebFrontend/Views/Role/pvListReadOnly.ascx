<%@ Control Language="VB" Inherits="System.Web.Mvc.ViewUserControl(Of IEnumerable (Of MaikKoster.MDT.Model.Settings_Role))" %>
<%=""%>
<%  If Model.Count > 0 Then%>
<ul class="MDT">
    <%For Each Item In Model%>
    <li class="ui-corner-all ui-state-default">
        <%-- <%=Html.Encode(Item.Role)%>--%>
        <%=Html.ActionLink(Item.Role, "Overview", "Identity", New With {.IdentityType = "Role", .IdentityID = Item.ID}, New With {.target = "_blank", .class = "Reference"})%>
    </li>
    <%Next%>
</ul>
<%Else%>
    No Roles configured
<%  End If%>