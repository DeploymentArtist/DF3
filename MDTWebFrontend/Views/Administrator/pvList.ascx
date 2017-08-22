<%@ Control Language="VB" Inherits="System.Web.Mvc.ViewUserControl(Of IEnumerable (Of MaikKoster.MDT.Model.Settings_Administrator))" %>
<%=""%>
<br />
<%  Dim x As Integer = 0%>
<%  Using Html.BeginForm("Update", "Administrator", New With {.IdentityType = ViewData("IdentityType"), .IdentityID = ViewData("IdentityID")}, FormMethod.Post, New With {.Class = "MDTForm"})%>
    <%  If Model.Count > 0 Then%>
    <ul class="MDTSortable">
        <%For Each Item In Model%>
        <li class="ui-corner-all ui-state-default">
            <input type="image" title="Delete Role" value="<%=html.encode(item.Sequence) %>"
                name='EditSequence' src="<%=url.image("deleteicon.png") %>"  class="deleteicon" />
            <%=Html.Hidden("Administrators[" & x & "].Administrators", Item.Administrators, New With {.Class = "ItemName"})%>
            <%=Html.Encode(Item.Administrators)%>
            <%x += 1%>
        </li>
        <%Next%>
    </ul>
    <%  End If%>

    <br class="clear"/>
    <div id="NewAdministratorContainer" class="ui-widget-content ui-corner-all mdt-widget">
        <div class="ui-widget-header mdt-widget-header">
            Add Administrator
        </div>
        <div class="Settings">
            <%=Html.TextBox("NewAdministrator", "", New With {.Class = "AdministratorAutocomplete enablesavebutton", .style = "width:300px;"})%>
            <br />
        </div>
    </div>
    <br class="clear"/>
    <br />
    <br />
    <input type="submit" value="Save" name="EditSequence" class="ui-state-default fg-button ui-corner-all savebutton" disabled="disabled"/>
    <input type="submit" value="Cancel" name="EditSequence" class="ui-state-default fg-button ui-corner-all"/>
<%  End Using%>

