<%@ Control Language="VB" Inherits="System.Web.Mvc.ViewUserControl(Of MaikKoster.MDT.MVC.PackageAssignmentsView)" %>
<%="" %>
<br />
<h2>
    Current assignments for Package <%=Html.Encode(Model.Package)%>
</h2>
    <div class="clear">
        <div id="details" class="ui-widget-content ui-corner-all mdt-widget">
            <div class="ui-widget-header mdt-widget-header">
                Locations
            </div>
            <div class="Settings">  
                <%ViewData("Type") = "Location"%>    
                <%Html.RenderPartial("pvListByType")%><br />           
             </div>
        </div>
        <div id="Div1" class="ui-widget-content ui-corner-all mdt-widget">
            <div class="ui-widget-header mdt-widget-header">
                MakeModels
            </div>
            <div class="Settings">  
                <%ViewData("Type") = "MakeModel"%>    
                <%Html.RenderPartial("pvListByType")%><br />           
             </div>
        </div>
        <div id="Div2" class="ui-widget-content ui-corner-all mdt-widget">
            <div class="ui-widget-header mdt-widget-header">
                Roles
            </div>
            <div class="Settings">  
                <%ViewData("Type") = "Role"%>    
                <%Html.RenderPartial("pvListByType")%><br />           
             </div>
        </div>
        <div id="Div3" class="ui-widget-content ui-corner-all mdt-widget">
            <div class="ui-widget-header mdt-widget-header">
                Computers
            </div>
            <div class="Settings">  
                <%ViewData("Type") = "Computer"%>    
                <%Html.RenderPartial("pvListByType")%><br />           
             </div>
        </div>
    </div>
    <br class="clear" />
    <br />
    <br />
    <%=Html.ActionLink("Back to Overview", "ListAll", Nothing, New With {.class = "ui-state-default fg-button ui-corner-all"})%>
    <br />
    <br />
