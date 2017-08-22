<%@ Control Language="VB" Inherits="System.Web.Mvc.ViewUserControl(Of MaikKoster.MDT.MVC.NameValue)" %>
<%  Using Html.BeginForm("Edit", "Application", New With {.ID = Model}, FormMethod.Post, New With {.Class = "MDTForm"})%>
    <div class="clear">
        <div id="details" class="ui-widget-content ui-corner-all mdt-widget">
            <div class="ui-widget-header mdt-widget-header">
                Edit Application "<%=Html.Encode(Model.Name)%>"
            </div>
            <div class="Settings">  
                <%-- <%=Html.ValidationSummary("Edit was unsuccessful. Please correct the errors and try again.")%>--%>
                <table>
                    <tr>
                        <td>
                            <label for="NewApplication">Application</label>
                        </td>
                        <td>
                            <%=Html.DropDownList("NewApplication", New SelectList(CType(ViewData("Applications"), List(Of MaikKoster.MDT.MVC.NameValue)), "Value", "Name", Model.Value), "", New With {.class = "enablesavebutton"})%>    
                            <%-- <%=Html.TextBox("NewApplication", Model.Name, New With {.style = "width:300px;"})%>
                            <%=Html.ValidationMessage("NewApplication", "*")%>--%>
                        </td>
                    </tr>
                </table>
                <input type="submit" value="Update All" name="SaveChanges" class="ui-state-default fg-button ui-corner-all savebutton" disabled="disabled"/>
                <input type="submit" value="Cancel" name="SaveChanges" class="ui-state-default fg-button ui-corner-all"/>
             </div>
        </div>
        <br class="clear"/>
        <br />
        <div id="Info" class="ui-widget-content ui-corner-all mdt-widget">
            <div class="ui-widget-header mdt-widget-header">
                Important Information
            </div>
            <div class="Settings">  
                <p>
                    On updating all current Instances of the application <b>"<%=Html.Encode(Model.Name)%>"</b> will be replaced with the selected application!
                </p>
             </div>
        </div>
    </div>
    <br class="clear" />
<% End Using %>


