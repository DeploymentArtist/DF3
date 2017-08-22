<%@ Control Language="VB" Inherits="System.Web.Mvc.ViewUserControl(Of IEnumerable (Of MaikKoster.MDT.Model.Settings_Application))" %>
<%=""%>
<%  If Model.Count > 0 Then%>
<ul class="MDT">
    <%For Each Item In Model%>
    <li class="ui-corner-all ui-state-default">
        <%=Html.Encode(Item.Name)%>
    </li>
    <%Next%>
</ul>
<%Else%>
    No Applications configured
<%  End If%>

