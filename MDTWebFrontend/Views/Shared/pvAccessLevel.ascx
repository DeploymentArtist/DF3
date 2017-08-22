<%@ Control Language="VB" Inherits="System.Web.Mvc.ViewUserControl" %>
<%="" %>
<%  Select Case If(Model, 0)%>
<%  Case MaikKoster.MDT.Model.Enums.AccessLevel.ReadOnly%>
    <%=Html.Image(Url.Image("Edit_ReadOnlyAccess_Shield.png"), "Read Only", New With {.title = "Read Only"})%>
<%  Case MaikKoster.MDT.Model.Enums.AccessLevel.Change%>
    <%=Html.Image(Url.Image("Edit_FullAccess_Shield.png"), "Change", New With {.title = "Change"})%>
<%  Case Else%>
    <%=Html.Image(Url.Image("Edit_NoAccess_Shield.png"), "No Access", New With {.title = "No Access"})%>
<%End Select%>