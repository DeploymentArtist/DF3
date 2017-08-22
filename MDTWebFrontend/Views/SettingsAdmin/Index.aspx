<%@ Page Title="" Language="VB" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div id="tabs">
        <ul>
            <li>
                <%=Html.ActionLink("Settings", "Overview", "SettingsAdmin", Nothing, Nothing)%></li>
            <li>
                <%=Html.ActionLink("Categories", "List", "Category", Nothing, Nothing)%></li>   
            <li>
                <%=Html.ActionLink("Groups", "List", "Group", Nothing, Nothing)%></li>
            <li>
                <%=Html.ActionLink("Lists", "List", "List", Nothing, Nothing)%></li>
        </ul>
    </div>

</asp:Content>
