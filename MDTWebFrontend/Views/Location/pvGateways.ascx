<%@ Control Language="VB" Inherits="System.Web.Mvc.ViewUserControl(Of IEnumerable (Of MaikKoster.MDT.Model.LocationIdentity_DefaultGateway))" %>

<%=""%>
<%-- <%  Dim x As Integer = 0%>--%>
<%  Using Html.BeginForm("AddGateway", "Location", New With {.IdentityType = ViewData("IdentityType"), .IdentityID = ViewData("IdentityID")}, FormMethod.Post, New With {.Class = "MDTForm"})%>
    <%  If Model.Count > 0 Then%>
    <ul class="MDT">
        <%For Each Item In Model%>
        <li class="ui-corner-all ui-state-default">
            <a title="Delete Default Gateway <%=html.encode(Item.DefaultGateway)%>" href="<%=Url.RouteUrl(New With {.action = "DeleteGateway", .controller = "Location", .IdentityType = "Location", .IdentityID = Item.ID, .Gateway=item.DefaultGateway})%>"
                class="ConfirmDeleteLink">
                <img src=<%=Url.Image("deleteicon.png")%> alt="Delete" class="deleteicon"/> </a>
                <%-- <%=Html.Hidden("Gateways[" & x & "].DefaultGateway", Item.DefaultGateway, New With {.Class = "ItemName"})%>--%>
            <%=Html.Encode(Item.DefaultGateway)%>
            <%--<%x += 1%>--%>
        </li>
        <%Next%>
    </ul>
    <%  End If%>

    <br class="clear"/>
    <div id="NewGatewayContainer" class="ui-widget-content ui-corner-all mdt-widget">
        <div class="ui-widget-header mdt-widget-header">
            Add new Gateway
        </div>
        <div class="Settings">
            <%=Html.TextBox("NewGateway", "", New With {.class = "enablesavebutton"})%>
            <%=Html.ValidationMessage("NewGateway")%>
            <br />
        </div>
    </div>
    <br class="clear"/>
    <br />
    <br />
    <input type="submit" value="Save" name="EditSequence" class="ui-state-default fg-button ui-corner-all savebutton" disabled="disabled"/>
    <%-- <input type="submit" value="Cancel" name="EditSequence" class="ui-state-default fg-button ui-corner-all"/>--%>
<%  End Using%>

    
