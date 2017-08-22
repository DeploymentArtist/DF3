<%@ Control Language="VB" Inherits="System.Web.Mvc.ViewUserControl(Of MaikKoster.MDT.Model.CustomList)" %>
<%="" %>
<%  If Model.Multiple Then%>
    <%Dim Values() = ViewData("Value").ToString.Split(";")%>
    <%If Model.CustomListEntries.Count > 0 Then%>
        <%Dim Temp = Model.CustomListEntries.ToList%>
        <%Dim MultiList As New List(Of MaikKoster.MDT.Model.CustomListEntry)%>
        <%For Each Item In Values%>
            <%Dim CurItem = Temp.Find(Function(f) f.Value = Item.Trim)%>
            <%If Not CurItem Is Nothing Then%>
                <%MultiList.Add(CurItem)%>
                <%Temp.Remove(CurItem)%>
            <%End If %>
        <%Next%>
        <%For Each Item In Temp%>
            <%MultiList.Add(Item)%>
        <%Next %>
        <%=Html.ListBox(ViewData("Name").ToString, New MultiSelectList(MultiList, "Value", "Text", Values))%>
        <%=Html.Hidden(ViewData("Name").ToString & ".Multi", "MultiSelect")%>
    <%End If %>
<%  Else%>
    <%=Html.DropDownList(ViewData("Name").ToString, New SelectList(Model.CustomListEntries, "Value", "Text", ViewData("Value")), "")%>
<%  End If%>