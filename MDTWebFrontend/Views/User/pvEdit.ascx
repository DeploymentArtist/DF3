<%@ Control Language="VB" Inherits="System.Web.Mvc.ViewUserControl(Of MaikKoster.MDT.Model.User)" %>
<%  Using Html.BeginForm("Edit", "User", Nothing, FormMethod.Post, New With {.Class = "MDTForm"})%>
    <div class="clear">
        <div id="details" class="ui-widget-content ui-corner-all mdt-widget">
            <div class="ui-widget-header mdt-widget-header">
                Edit User <%=Html.Encode(Model.Username)%>
            </div>
            <div class="Settings">  
                <%=Html.ValidationSummary("Edit was unsuccessful. Please correct the errors and try again.")%>
                <table>
                    <tr>
                        <td>
                            <label for="Username">Username</label>
                        </td>
                        <td>
                            <%=Html.Hidden("ID", Model.ID)%>
                            <%=Html.TextBox("Username", Model.Username)%>
                            <%= Html.ValidationMessage("Username", "*") %>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="Lastname">Lastname</label>
                        </td>
                        <td>
                            <%=Html.TextBox("Lastname", Model.Lastname)%>
                            <%= Html.ValidationMessage("Lastname", "*") %>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="Firstname">Firstname</label>
                        </td>
                        <td>
                            <%=Html.TextBox("Firstname", Model.Firstname)%>
                            <%= Html.ValidationMessage("Firstname", "*") %>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="IsAdmin">Administrator</label>
                        </td>
                        <td>
                            <%=Html.CheckBox("IsAdmin", Model.IsAdmin)%>
                            <%= Html.ValidationMessage("IsAdmin", "*") %>
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



