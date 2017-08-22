<%@ Control Language="VB" Inherits="System.Web.Mvc.ViewUserControl(Of IEnumerable (Of MaikKoster.MDT.Model.LocationIdentity_DefaultGateway))" %>

<%=""%>
<%  If Model.Count > 0 Then%>
<ul class="MDT">
    <%For Each Item In Model%>
    <li class="ui-corner-all ui-state-default">
        <%=Html.Encode(Item.DefaultGateway)%>
    </li>
    <%Next%>
</ul>
<%Else%>
    No Gateways configured
<%  End If%>


    
