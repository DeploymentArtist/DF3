<%@ Control Language="VB" Inherits="System.Web.Mvc.ViewUserControl(Of IEnumerable (Of MaikKoster.MDT.Model.Settings_Package))" %>
<%="" %>
<%-- <%  If Model.Count > 0 Then%>
<table>
    <tr>
        <th>
            Packages
        </th>
        <th>
        </th>
    </tr>
    <% For Each item In Model%>
    <tr>
        <td>
            <%=Html.Encode(item.Packages)%>
        </td>
        <td>
            <%=Html.ActionLink("Delete", "Delete", "Package", New With {.IdentityType = ViewData("IdentityType"), .IdentityID = ViewData("IdentityID"), .Sequence = item.Sequence}, New With {.Class = "DeleteLink"})%>
        </td>
    </tr>
    <% Next%>
</table>
<br />
<%  End If%>--%>
<%--<%  Dim x As Integer = 0%>
<%  If Model.Count > 0 Then%>
<%--><%  Using Html.BeginForm("Sort", "Package", New With {.IdentityType = ViewData("IdentityType"), .IdentityID = ViewData("IdentityID")}, FormMethod.Post, New With {.Class = "MDTForm"})%>--%>
<%--<ul >
    <%For Each Item In Model%>
    <li class="ui-corner-all ui-state-default">
        <%=Html.Image("../../../images/deleteicon.png", "Delete Item", New With {.Class = "deleteitem", .Title = "Delete Package"})%>
        <%=Html.Hidden("Packages[" & x & "].Packages", Item.Packages, New With {.Class = "ItemName", .Name = "Package"})%>
        <%=Html.Encode(Item.Packages)%>
        <%x += 1%>
        <%-- <%=Html.ActionLink("Delete", "Delete", "Package", New With {.IdentityType = ViewData("IdentityType"), .IdentityID = ViewData("IdentityID"), .Sequence = Item.Sequence}, New With {.Class = "DeleteLink"})%>--%>
    <%-- %></li>
    <%Next%>
</ul>
<br />--%>
<%-- %><input type="submit" value="Save Changes" name="EditSequence" class="MDTSortable FloatStop" />
<input type="submit" value="Cancel" name="EditSequence" class="MDTSortable" />
<%-- <%  End Using%>--%>
<%-- <%  End If%>
<%  Using Html.BeginForm("Add", "Package", New With {.IdentityType = ViewData("IdentityType"), .IdentityID = ViewData("IdentityID")}, FormMethod.Post, New With {.Class = "MDTForm"})%>
<p>
    <label for="Package">
        New Package:</label>
    <%=Html.TextBox("Package", "", New With {.Class = "PackageAutocomplete"})%>
    <%=Html.ValidationMessage("Packages", "*")%>
</p>
<p>
    <input type="submit" value="Add" name="AddPackage" />
    <input type="submit" value="Cancel" name="AddPackage" />
</p>
<%  End Using%>--%>

<%=""%>
<%  Dim x As Integer = 0%>

<%  Using Html.BeginForm("Update", "Package", New With {.IdentityType = ViewData("IdentityType"), .IdentityID = ViewData("IdentityID")}, FormMethod.Post, New With {.Class = "MDTForm"})%>
<%  If Model.Count > 0 Then%>
<ul class="MDTSortable">
    <%For Each Item In Model%>
    <li class="ui-corner-all ui-state-default">
        <%=Html.Image("~/assets/images/deleteicon.png", "Delete Item", New With {.Class = "deleteitem", .Title = "Delete Package"})%>
        <%=Html.Hidden("Packages[" & x & "].Packages", Item.Packages, New With {.Class = "ItemName"})%>
        <%=Html.Encode(Item.Packages)%>
        <%x += 1%>
        <%-- <%=Html.ActionLink("Delete", "Delete", "Package", New With {.IdentityType = ViewData("IdentityType"), .IdentityID = ViewData("IdentityID"), .Sequence = Item.Sequence}, New With {.Class = "DeleteLink"})%>--%>
    </li>
    <%Next%>
</ul>
<%  End If%>
 <p>
    <label for="NewPackage">
        New Package:</label>
    <%=Html.TextBox("NewPackage", "", New With {.Class = "PackageAutocomplete"})%>
    <%--<%=Html.ValidationMessage("Packages", "*")%>--%>
</p>
<%=Html.TextBox("Test", Guid.NewGuid.ToString)%>
<br />
<input type="submit" value="Add Package" name = "EditSequence" class="ui-state-default fg-button ui-corner-all"/>
<input type="submit" value="Save Changes" name="EditSequence" class="ui-state-default fg-button ui-corner-all"/>
<input type="submit" value="Cancel" name="EditSequence" class="ui-state-default fg-button ui-corner-all"/>
<%  End Using%>