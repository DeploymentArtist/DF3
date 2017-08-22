<%@ Control Language="VB" Inherits="System.Web.Mvc.ViewUserControl" %>
<%="" %>
<%  If Not ViewData("ErrorText") Is Nothing OrElse Not ViewData("ResultText") Is Nothing Then%>
    <div id="StatusText" class="ui-widget-content ui-corner-all mdt-widget">
        <div class="ui-widget-header mdt-widget-header">
            Status Information
        </div>
        <div class="savedchanges">
            <%If Not ViewData("ErrorText") Is Nothing AndAlso ViewData("ErrorText") <> "" Then%>
            <p class="error">
                <%=Html.Encode(ViewData("ErrorText"))%>
            </p>
            <% End If %>
            <%=Html.Encode(ViewData("ResultText"))%>
            <br />
        </div>
    </div>
    <br class="clear"/>
    <br />
<%  End If%>