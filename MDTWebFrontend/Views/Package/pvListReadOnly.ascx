<%@ Control Language="VB" Inherits="System.Web.Mvc.ViewUserControl(Of IEnumerable (Of MaikKoster.MDT.Model.Settings_Package))" %>
<%=""%>
<%  If Model.Count > 0 Then%>
<ul class="MDT">
    <%For Each Item In Model%>
    <li class="ui-corner-all ui-state-default">
        <%=Html.Encode(Item.Packages)%>
    </li>
    <%Next%>
</ul>
<%Else%>
    No Packages configured
<%  End If%>

