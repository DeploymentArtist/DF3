<%@ Control Language="VB" Inherits="System.Web.Mvc.ViewUserControl(Of IEnumerable (Of MaikKoster.MDT.Model.Settings_Role))" %>
<%=""%>
<br />
<%  Dim x As Integer = 0%>
    <%  Using Html.BeginForm("Update", "Role", New With {.IdentityType = ViewData("IdentityType"), .IdentityID = ViewData("IdentityID")}, FormMethod.Post, New With {.Class = "MDTForm"})%>
    <%  If Model.Count > 0 Then%>
    <ul class="MDTSortable">
        <%For Each Item In Model%>
        <li class="ui-corner-all ui-state-default">
            <input type="image" title="Delete Role" value="<%=html.encode(item.Sequence) %>"
                name='SubmitValues' src="<%=url.image("deleteicon.png") %>"  class="deleteicon"/>
            <%=Html.Hidden("Roles[" & x & "].Roles", Item.Role, New With {.Class = "ItemName"})%>
            <%-- <%=Html.Encode(Item.Role)%>--%>
            <%=Html.ActionLink(Item.Role, "Overview", "Identity", New With {.IdentityType = "Role", .IdentityID = Item.ID}, New With {.target = "_blank", .class = "Reference"})%>
            <%x += 1%>
        </li>
        <%Next%>
    </ul>
    <%  End If%>
    <br class="clear"/>
    <div id="NewRoleContainer" class="ui-widget-content ui-corner-all mdt-widget">
        <div class="ui-widget-header mdt-widget-header">
            Add Role
        </div>
        <div class="Settings">
            <%If CType(ViewData("Roles"), SelectList).Count > 0 Then%>
            <%=Html.DropDownList("NewRole", CType(ViewData("Roles"), SelectList), "", New With {.class = "enablesavebutton"})%>
            <%Else %> 
            No Roles available
            <% End If%>
            <br />
            <br />
        </div>
    </div>
    <br class="clear"/>
    <br />
<input type="submit" value="Save" name="SubmitValues" class="ui-state-default fg-button ui-corner-all savebutton" disabled="disabled"/>
<input type="submit" value="Cancel" name="SubmitValues" class="ui-state-default fg-button ui-corner-all"/>
<%  End Using%>