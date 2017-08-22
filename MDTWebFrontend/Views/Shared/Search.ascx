<%@ Control Language="VB" Inherits="System.Web.Mvc.ViewUserControl" %>
<%="" %>
<%  Dim Controller As String%>
<%  Controller = ViewContext.Controller.GetType().Name.Replace("Controller", "")%>
<div id="Search" style="float:right">
    <%  If Controller = "Computer" OrElse Controller = "Location" OrElse Controller = "MakeModel" OrElse Controller = "Role" Then%>
        <%Using Html.BeginForm("Search", Controller)%>
            Search <%=Html.TextBox("SearchItem")%> <input type="image" name="search" src='<%=Url.Image("search.png") %>' class="searchicon"/>
            
        <%End Using%>
    <%  Else%>
        <img src=<%=Url.Image("ajax-loader.gif")%> alt="Loading..." class="ajaxloader" style="display:none;"/>
        <div id="searchplaceholder">X</div>
    <%  End If%>
</div>