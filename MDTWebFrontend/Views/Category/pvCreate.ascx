<%@ Control Language="VB" Inherits="System.Web.Mvc.ViewUserControl(Of MaikKoster.MDT.Model.Category)" %>
<%  Using Html.BeginForm("Create", "Category", Nothing, FormMethod.Post, New With {.Class = "MDTForm"})%>
    <div class="clear">
        <div id="details" class="ui-widget-content ui-corner-all mdt-widget">
            <div class="ui-widget-header mdt-widget-header">
                Create New Category
            </div>
            <div class="Settings">  
                <%= Html.ValidationSummary("Create was unsuccessful. Please correct the errors and try again.") %>
                <table>
                    <tr>
                        <td>
                            <label for="Name">Name</label>
                        </td>
                        <td>
                            <%= Html.TextBox("Name", Model.Name) %>
                            <%= Html.ValidationMessage("Name", "*") %>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="Description">Description</label>
                        </td>
                        <td>
                            <%= Html.TextBox("Description", Model.Description) %>
                            <%= Html.ValidationMessage("Description", "*") %>
                        </td>
                    </tr>
                </table>
                <input type="submit" value="Save" name="SubmitValues" class="ui-state-default fg-button ui-corner-all"/>
                <input type="submit" value="Cancel" name="SubmitValues" class="ui-state-default fg-button ui-corner-all"/>
             </div>
        </div>
    </div>
    <br class="clear" />
<% End Using %>   




