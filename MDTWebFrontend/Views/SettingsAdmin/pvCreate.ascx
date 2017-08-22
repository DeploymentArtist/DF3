<%@ Control Language="VB" Inherits="System.Web.Mvc.ViewUserControl" %>
<%  Using Html.BeginForm("Create", "SettingsAdmin", Nothing, FormMethod.Post, New With {.Class = "MDTForm"})%>
    <div class="clear">
        <div id="details" class="ui-widget-content ui-corner-all mdt-widget">
            <div class="ui-widget-header mdt-widget-header">
                Create New Custom Setting
            </div>
            <div class="Settings">  
                <%= Html.ValidationSummary("Create was unsuccessful. Please correct the errors and try again.") %>
                <table>
                    <tr>
                        <td>
                            <label for="CustomSetting">New Custom Setting</label>
                        </td>
                        <td>
                            <%=Html.TextBox("CustomSetting")%>
                            <%=Html.ValidationMessage("CustomSetting", "*")%>
                        </td>
                    </tr>
                </table>
                <input type="submit" value="Create" name="SubmitValues" class="ui-state-default fg-button ui-corner-all"/>
                <input type="submit" value="Cancel" name="SubmitValues" class="ui-state-default fg-button ui-corner-all"/>
             </div>
        </div>
    </div>
    <br class="clear" />
<% End Using %>   