<%@ Control Language="VB" Inherits="System.Web.Mvc.ViewUserControl(Of MaikKoster.MDT.MVC.PackageAssignmentsView)" %>
<div>
    <%Dim Type As String = ViewData("Type").ToString.Substring(0, 1)%>
    <%  Dim List = Me.Model.Assignments.Where(Function(a) a.Type = Type).ToList%>
    <%  If List.Count > 0 Then%>
    <table>
        <%For Each item In List%>
        <tr>
            <td>
                <%=Html.ActionLink(If(item.Instance <> "", item.Instance, "{NoNameAvailable}"), "Overview", "Identity", New With {.IdentityType = ViewData("Type").ToString, .IdentityID = item.ID}, New With {.target = "_blank", .class = "Reference"})%>
            </td>
        </tr>
        <%Next%>
    </table>
    <%  Else%>
        No current Assignments.
    <%  End If%>
</div>
