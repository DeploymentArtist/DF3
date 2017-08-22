<%@ Control Language="VB" Inherits="System.Web.Mvc.ViewUserControl(Of IEnumerable (Of MaikKoster.MDT.Model.Settings_Package))" %>
<%=""%>
<br />
<%  Dim x As Integer = 0%>
    <%  Using Html.BeginForm("Update", "Package", New With {.IdentityType = ViewData("IdentityType"), .IdentityID = ViewData("IdentityID")}, FormMethod.Post, New With {.Class = "MDTForm"})%>
    <%  If Model.Count > 0 Then%>
    <ul class="MDTSortable">
        <%For Each Item In Model%>
        <li class="ui-corner-all ui-state-default">
            <input type="image" title="Delete Package" value="<%=html.encode(item.Sequence) %>"
                name='EditSequence' src="<%=url.Image("deleteicon.png") %>"  class="deleteicon"/>
            <%=Html.Hidden("Packages[" & x & "].Packages", Item.Packages, New With {.Class = "ItemName"})%>
            <%=Html.Encode(Item.Packages)%>
            <%x += 1%>
        </li>
        <%Next%>
    </ul>
    <%  End If%>
    <br class="clear"/>
    <div id="NewPackageContainer" class="ui-widget-content ui-corner-all mdt-widget">
        <div class="ui-widget-header mdt-widget-header">
            Add Package
        </div>
        <div class="Settings">
            <%=Html.TextBox("NewPackage", If(ViewData("PackageID") <> "", ViewData("PackageID") & ":" & ViewData("Program"), ""), New With {.class = "enablesavebutton", .style = "width:300px;"})%>

            <a title="Search for Package in SCCM" href="<%=Url.RouteUrl(New With {.action = "SearchPackages", .controller = "Package", .IdentityType = ViewData("IdentityType"), .IdentityID = ViewData("IdentityID")})%>"
            class="fg-button ui-state-default ui-corner-all linkbutton">
            Search for Package in SCCM</a>
            <br />
        </div>
    </div>
    <br class="clear"/>
    <br />
    <input type="submit" value="Save" name="EditSequence" class="ui-state-default fg-button ui-corner-all savebutton" disabled="disabled"/>
    <input type="submit" value="Cancel" name="EditSequence" class="ui-state-default fg-button ui-corner-all"/>
<%  End Using%>
