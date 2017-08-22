<%@ Control Language="VB" Inherits="System.Web.Mvc.ViewUserControl(Of string)" %>
<%  Using Html.BeginForm("Edit", "Administrator", New With {.ID = Model}, FormMethod.Post, New With {.Class = "MDTForm"})%>
    <div class="clear">
        <div id="details" class="ui-widget-content ui-corner-all mdt-widget">
            <div class="ui-widget-header mdt-widget-header">
                Edit Administrator "<%=Html.Encode(Model)%>"
            </div>
            <div class="Settings">  
                <%=Html.ValidationSummary("Edit was unsuccessful. Please correct the errors and try again.")%>
                <table>
                    <tr>
                        <td>
                            <label for="NewAdministrator">Administrator</label>
                        </td>
                        <td>
                            <%=Html.TextBox("NewAdministrator", Model, New With {.style = "width:300px;"})%>
                            <%=Html.ValidationMessage("NewAdministrator", "*")%>
                        </td>
                    </tr>
                </table>
                <input type="submit" value="Update All" name="SaveChanges" class="ui-state-default fg-button ui-corner-all"/>
                <input type="submit" value="Cancel" name="SaveChanges" class="ui-state-default fg-button ui-corner-all"/>
             </div>
        </div>
    </div>
    <br class="clear" />
<% End Using %>


