<%@ Control Language="VB" Inherits="System.Web.Mvc.ViewUserControl(Of IEnumerable (Of MaikKoster.SCCM.Model.v_Program))" %>
<%="" %>
<div>

<h2>Select Program</h2>

    <%  If Model.Count > 0 Then%>
    <table>
        <tr class="ui-widget ui-widget-header">
            <th>
            </th>
            <th>
                ProgramName
            </th>
            <th>
                Comment
            </th>
            <th>
                Description
            </th>
        </tr>
        <% For Each item In Model%>
        <tr <%=Html.Encode(IIf(item.ProgramName.Contains("MDT"), " class='highlightmdtprg'", ""))%>>
            <td>
                <%If ViewData("Back") Is Nothing Then %>
                    <%=Html.ActionLink("Select", "List", New With {.IdentityType = ViewData("IdentityType"), .IdentityID = ViewData("IdentityID"), .PackageID = ViewData("PackageID"), .program = item.ProgramName})%> 
                <%Elseif ViewData("Back") = "Mapping" Then%>
                    <%=Html.ActionLink("Select", "Create", "PackageMapping", New With {.PackageID = ViewData("PackageID"), .Program = item.ProgramName}, Nothing)%>
                <%ElseIf ViewData("Back").ToString.Contains("Replace") Then%>
                    <%=Html.ActionLink("Select", "Edit", New With {.NewPackage = ViewData("PackageID") & ":" & item.ProgramName, .CurrentPackage = ViewData("Back").ToString.Remove(0,8)})%>
                <%Else %>
                    <%=Html.ActionLink("Select", "List", New With {.IdentityType = ViewData("IdentityType"), .IdentityID = ViewData("IdentityID"), .PackageID = ViewData("PackageID"), .program = item.ProgramName})%> 
                <%End If %>
            </td>
            <td>
                <%= Html.Encode(item.ProgramName) %>
            </td>
            <td>
                <%= Html.Encode(item.Comment) %>
            </td>
            <td>
                <%= Html.Encode(item.Description) %>
            </td>
        </tr>
        <% Next%>
    </table>
    <%Else%>
    No Programs found
    <%End If%>
</div>
<br />
<a title="Back to Search" href="<%=Url.RouteUrl(New With {.action = "SearchPackage", .controller = "Package", .IdentityType = ViewData("IdentityType"), .IdentityID = ViewData("IdentityID"), .Package = ViewData("PackageID"), .Back = ViewData("Back")})%>"
    class="fg-button ui-state-default ui-corner-all linkbutton">
    Back to Search</a>
<%If ViewData("Back") Is Nothing Then %>
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
<%End If%>

