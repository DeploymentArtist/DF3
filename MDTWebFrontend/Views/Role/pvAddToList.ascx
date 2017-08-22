<%@ Control Language="VB" Inherits="System.Web.Mvc.ViewUserControl(Of iqueryable(of MaikKoster.MDT.Model.RoleIdentity))" %>


<div><%Html.DropDownList("Role", Model.ToList)%></div>
