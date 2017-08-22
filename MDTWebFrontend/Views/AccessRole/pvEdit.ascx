<%@ Control Language="VB" Inherits="System.Web.Mvc.ViewUserControl(Of MaikKoster.MDT.Model.AccessRole)" %>
<%  Using Html.BeginForm("Edit", "AccessRole", New With {.ID = Model.ID}, FormMethod.Post, New With {.Class = "MDTForm"})%>
    <div class="clear">
        <div id="details" class="ui-widget-content ui-corner-all mdt-widget">
            <div class="ui-widget-header mdt-widget-header">
                Create new Access Role
            </div>
            <div class="Settings">  
                <%=Html.ValidationSummary("Edit was unsuccessful. Please correct the errors and try again.")%>
                <table>
                    <tr>
                        <td>
                            <label for="Name">Name</label>
                        </td>
                        <td>
                            <%=Html.Hidden("ID", Model.ID)%>
                            <%= Html.TextBox("Name") %>
                            <%= Html.ValidationMessage("Name", "*") %>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="Description">Description</label>
                        </td>
                        <td>
                            <%= Html.TextBox("Description") %>
                            <%= Html.ValidationMessage("Description", "*") %>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="Type">Type</label>
                        </td>
                        <td>
                            <%=Html.DropDownList("Type", New SelectList(CType(ViewData("AccessLevelTypes"), List(Of SelectListItem)), "Value", "Text", Model.Type))%>
                            <%= Html.ValidationMessage("Type", "*") %>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="Details">Details</label>
                        </td>
                        <td>
                            <%=Html.DropDownList("Details", New SelectList(CType(ViewData("AccessLevels"), List(Of MaikKoster.Utilities.Enums.EnumEntity)), "ID", "Name", "Details"))%>
                            <%= Html.ValidationMessage("Details", "*") %>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="Settings">Settings</label>
                        </td>
                        <td>
                            <%=Html.DropDownList("Settings", New SelectList(CType(ViewData("AccessLevels"), List(Of MaikKoster.Utilities.Enums.EnumEntity)), "ID", "Name", "Settings"))%>
                            <%= Html.ValidationMessage("Settings", "*") %>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="Applications">Applications</label>
                        </td>
                        <td>
                            <%=Html.DropDownList("Applications", New SelectList(CType(ViewData("AccessLevels"), List(Of MaikKoster.Utilities.Enums.EnumEntity)), "ID", "Name", "Applications"))%>
                            <%= Html.ValidationMessage("Applications", "*") %>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="Packages">Packages</label>
                        </td>
                        <td>
                            <%=Html.DropDownList("Packages", New SelectList(CType(ViewData("AccessLevels"), List(Of MaikKoster.Utilities.Enums.EnumEntity)), "ID", "Name", "Packages"))%>
                            <%= Html.ValidationMessage("Packages", "*") %>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="Administrators">Administrators</label>
                        </td>
                        <td>
                            <%=Html.DropDownList("Administrators", New SelectList(CType(ViewData("AccessLevels"), List(Of MaikKoster.Utilities.Enums.EnumEntity)), "ID", "Name", "Administrators"))%>
                            <%= Html.ValidationMessage("Administrators", "*") %>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="Gateways">Gateways</label>
                        </td>
                        <td>
                            <%=Html.DropDownList("Gateways", New SelectList(CType(ViewData("AccessLevels"), List(Of MaikKoster.Utilities.Enums.EnumEntity)), "ID", "Name", "Gateways"))%>
                            <%= Html.ValidationMessage("Gateways", "*") %>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="Roles">Roles</label>
                        </td>
                        <td>
                            <%=Html.DropDownList("Roles", New SelectList(CType(ViewData("AccessLevels"), List(Of MaikKoster.Utilities.Enums.EnumEntity)), "ID", "Name", "Roles"))%>
                            <%= Html.ValidationMessage("Roles", "*") %>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="Default">Default</label>
                        </td>
                        <td>
                            <%=Html.CheckBox("Default", Model.Default)%>
                            <%= Html.ValidationMessage("Default", "*") %>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="GroupID">Group</label>
                        </td>
                        <td>
                            <%=Html.DropDownList("GroupID", CType(ViewData("Groups"), SelectList))%>
                            <%=Html.ValidationMessage("GroupID", "*")%>
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




