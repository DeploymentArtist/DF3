<%@ Control Language="VB" Inherits="System.Web.Mvc.ViewUserControl(Of IEnumerable (Of MaikKoster.MDT.Model.Settings_Administrator))" %>
<%=""%>
<%  If Model.Count > 0 Then%>
<ul class="MDT">
    <%For Each Item In Model%>
    <li class="ui-corner-all ui-state-default">
        <%=Html.Encode(Item.Administrators)%>
    </li>
    <%Next%>
</ul>
<%Else%>
    No Administrators configured
<%  End If%>

