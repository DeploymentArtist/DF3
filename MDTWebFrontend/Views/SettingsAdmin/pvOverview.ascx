<%@ Control Language="VB" Inherits="System.Web.Mvc.ViewUserControl" %>

<h2>Manage Settings</h2>
<br />
<%="" %>
<%If ViewData("SettingCreated") <> "" then  %>
    <p class="savedchanges"><%=html.encode(string.Format("Created Custom Setting {0}", ViewData("SettingCreated"))) %></p>
<%End If %>
<%=Html.ActionLink("Add Custom Setting", "Create", "SettingsAdmin", Nothing, New With {.class = "fg-button ui-state-default ui-corner-all linkbutton"})%><br />
<br />