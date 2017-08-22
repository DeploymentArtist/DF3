<%@ Control Language="VB" Inherits="System.Web.Mvc.ViewUserControl(Of IEnumerable (Of MaikKoster.SCCM.Model.v_Package))" %>
<%="" %>
<h2>
    Search for SCCM Package</h2>
<%  Using Html.BeginForm("SearchPackage", "Package", New With {.IdentityType = ViewData("IdentityType"), .IdentityID = ViewData("IdentityID"), .Back = ViewData("Back")}, FormMethod.Post, New With {.Class = "MDTForm"})%>
<%=Html.TextBox("Package")%>
    <input type="submit" name="Search" value="Search" class="ui-state-default fg-button ui-corner-all" /><input type="Submit" name="Search" value="Cancel" class="ui-state-default fg-button ui-corner-all" />
<br />
<br />
<div>
    <%If Not Model Is Nothing Then %>
    <%  If Model.Count > 0 Then%>
    <table>
        <tr class="ui-widget ui-widget-header">
            <th>
            </th>
            <th>
                Name
            </th>
            <th>
                Version
            </th>
            <th>
                Manufacturer
            </th>
            <th>
                Description
            </th>
        </tr>
        <% For Each item In Model%>
        <tr>
            <td>
                <%=Html.ActionLink("Select", "GetPrograms", New With {.IdentityType = ViewData("IdentityType"), .IdentityID = ViewData("IdentityID"), .PackageID = item.PackageID, .Back = ViewData("Back")})%>
            </td>
            <td>
                <%= Html.Encode(item.Name) %>
            </td>
            <td>
                <%= Html.Encode(item.Version) %>
            </td>
            <td>
                <%= Html.Encode(item.Manufacturer) %>
            </td>
            <td>
                <%= Html.Encode(item.Description) %>
            </td>
        </tr>
        <% Next%>
    </table>
    <%Else%>
    No package found
    <%  End If%>
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
<%  End Using%>