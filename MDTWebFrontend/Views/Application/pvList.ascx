<%@ Control Language="VB" Inherits="System.Web.Mvc.ViewUserControl(Of IEnumerable (Of MaikKoster.MDT.Model.Settings_Application))" %>
<%=""%>
<br />
<%  Dim x As Integer = 0%>
<%  Using Html.BeginForm("Update", "Application", New With {.IdentityType = ViewData("IdentityType"), .IdentityID = ViewData("IdentityID")}, FormMethod.Post, New With {.Class = "MDTForm"})%>
    <%  If Model.Count > 0 Then%>
    <ul class="MDTSortable ui-helper-clearfix">
        <%For Each Item In Model%>
        <li class="ui-corner-all ui-state-default" >
            <input type="image" title="Delete Application" value="<%=html.encode(item.Sequence) %>"
                name='EditSequence' src="<%=url.image("deleteicon.png") %>" class="deleteicon"/>
            <%=Html.Hidden("Applications[" & x & "].Applications", Item.Applications, New With {.Class = "ItemName"})%>
            <%=Html.Encode(Item.Name)%>
            <%x += 1%>
        </li>
        <%Next%>
    </ul>
    <%  End If%>
    <br class="clear"/>
    <div id="NewApplicationContainer" class="ui-widget-content ui-corner-all mdt-widget">
        <div class="ui-widget-header mdt-widget-header">
            Add Application
        </div>
        <div class="Settings">
            <% Dim AvailableApps As List(Of MaikKoster.MDT.Model.Application) = ViewData("AvailableApps")%>  
            <% If AvailableApps.Count > 0 Then%>
            <%=Html.DropDownList("NewApplication", New SelectList(CType(ViewData("AvailableApps"), List(Of MaikKoster.MDT.Model.Application)), "GUIDString", "Name"), "", New With {.class = "enablesavebutton"})%>    
            <% Else%>
            No applications available
            <% End If%>
            <br />
            <br />
        </div>
    </div>
    <br class="clear"/>
    <br />
    <input type="submit" value="Save" name="EditSequence" class="ui-state-default fg-button ui-corner-all savebutton" disabled="disabled"/>
    <input type="submit" value="Cancel" name="EditSequence" class="ui-state-default fg-button ui-corner-all"/>
 
<%  End Using%>
