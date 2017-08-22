<%@ Control Language="VB" Inherits="System.Web.Mvc.ViewUserControl(Of IEnumerable (Of MaikKoster.SCCM.Model.v_Package))" %>
<%="" %>
<h2>
    Search for SCCM Packages</h2>
<%  Using Html.BeginForm("SearchPackages", "Package", New With {.IdentityType = ViewData("IdentityType"), .IdentityID = ViewData("IdentityID")}, FormMethod.Post, New With {.Class = "MDTForm"})%>
<%=Html.TextBox("Package")%>
    <input type="submit" name="Search" value="Search" class="ui-state-default fg-button ui-corner-all" /><input type="Submit" name="Search" value="Add selected" class="ui-state-default fg-button ui-corner-all" /><input type="Submit" name="Search" value="Cancel" class="ui-state-default fg-button ui-corner-all" />
<br />
<br />
<div>
    <% If Not Model Is Nothing Then%>
    <% If Model.Count > 0 Then%>
    <% Dim x As Integer%>
    <table>
        <% For Each item In Model%>
        <tr style="font-size:larger; font-weight:bold" class="ui-widget ui-widget-header">
            <td colspan="2">
                <%=Html.Encode(item.CombinedName)%>
            </td>
        </tr>
            <% For Each Prg In item.v_Program.Where(Function(p) (p.ProgramFlags And 1) And Not p.Comment.Contains("Hidden")).OrderBy(Function(o) o.ProgramName)%>
            <tr <%=Html.Encode(IIf(Prg.ProgramName.Contains("MDT"), " class='highlightmdtprg'", ""))%>>
                <td>
                    <%=Html.Hidden(String.Format("Programs[{0}].MDTName", x), String.Format("{0}:{1}", item.PackageID, Prg.ProgramName))%>
                    <%=Html.CheckBox(String.Format("Programs[{0}].Checked", x), Prg.Checked, New With {.style = "padding-left:1em;padding-right:1em;"})%>
                    <%=Html.Encode(Prg.ProgramName)%>
                </td>
                <td>
                    <%=Html.Encode(Prg.Comment)%>
                </td>
            </tr>
            <% x += 1%>
            <% Next%>
        <% Next%>
    </table>
    <% Else%>
    No package found
    <% End If%>
    <%Else %>
    
    <%End If %>
    </div>
<br />
    
<br />
<%-- %><%  If ViewData("IdentityType") <> "" Then%>
<a title="Cancel" href="<%=Url.RouteUrl(New With {.controller = "Package", .action = "List", .IdentityType = ViewData("IdentityType"), .IdentityID = ViewData("IdentityID")})%>"
    class="fg-button ui-state-default ui-corner-all linkbutton">
    Cancel</a>
<%  Else%>
<a title="Cancel" href="<%=Url.RouteUrl(New With {.controller = "Package", .action = "Edit"})%>"
    class="fg-button ui-state-default ui-corner-all linkbutton">
    Cancel</a>
<%  End If%>--%>

<input type="Submit" name="Search" value="Add selected" class="ui-state-default fg-button ui-corner-all" /><input type="Submit" name="Search" value="Cancel" class="ui-state-default fg-button ui-corner-all" />

<%-- <%If ViewData("Back") Is Nothing Then %>
<a title="Cancel" href="<%=Url.RouteUrl(New With {.controller = "Package", .action = "List", .IdentityType = ViewData("IdentityType"), .IdentityID = ViewData("IdentityID")})%>"
    class="fg-button ui-state-default ui-corner-all linkbutton">
    Cancel</a>
<%ElseIf ViewData("Back") = "Mapping" Then%>
<a title="Cancel" href="<%=Url.RouteUrl(New With {.controller = "PackageMapping", .action = "Create"})%>"
    class="fg-button ui-state-default ui-corner-all linkbutton">
    Cancel</a>
<%ElseIf ViewData("Back").ToString.Contains("Replace") Then%>
<a title="Cancel" href="<%=Url.RouteUrl(New With {.controller = "Package", .action = "ListAll"})%>"
    class="fg-button ui-state-default ui-corner-all linkbutton">
    Cancel</a>
<%Else %>
<a title="Cancel" href="<%=Url.RouteUrl(New With {.controller = "Package", .action = "List", .IdentityType = ViewData("IdentityType"), .IdentityID = ViewData("IdentityID")})%>"
    class="fg-button ui-state-default ui-corner-all linkbutton">
    Cancel</a>
<%End If%>--%>
<%  End Using%>