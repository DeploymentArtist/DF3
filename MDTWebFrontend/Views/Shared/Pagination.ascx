<%@ Control Language="VB" Inherits="System.Web.Mvc.ViewUserControl(Of MaikKoster.MDT.MVC.PaginationViewData)" %>
<ul class="pagination-clean">
    <%="" %>
    <%  If (Model.HasPreviousPage) Then%>
    <li class="previous"><a href="<%= model.PageActionLink.Replace("%7Bpage%7D", (Model.PageIndex - 1).ToString())%>">
        « Previous</a></li>
    <%  Else%>
    <li class="previous-off">« Previous</li>
    <% End If%>
    <%For page As Integer = 1 To Model.TotalPages%>
    <%If page = Model.PageIndex Then%>
    <li class="active">
        <%=page.ToString%></li>
    <% Else%>
    <li><a href="<%=model.PageActionLink.Replace("%7Bpage%7D", page.ToString)%>">
        <%=page.ToString%></a></li>
    <% End If%>
    <%Next%>
    <%If Model.HasNextPage Then%>
    <li class="next"><a href="<%=Model.PageActionLink.Replace("%7Bpage%7D", (Model.PageIndex + 1).ToString())%>">
        Next »</a></li>
    <% Else%>
    <li class="next-off">Next »</li>
    <% End If%>
</ul>
