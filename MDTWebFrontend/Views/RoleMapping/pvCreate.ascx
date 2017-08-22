<%@ Control Language="VB" Inherits="System.Web.Mvc.ViewUserControl(Of MaikKoster.MDT.Model.RoleMappingView)" %>
<%  Using Html.BeginForm("Create", "RoleMapping", Nothing, FormMethod.Post, New With {.Class = "MDTForm"})%>
<%  Dim Roles = CType(ViewData("Roles"), SelectList)%>
    <div class="clear">
        <div id="details" class="ui-widget-content ui-corner-all mdt-widget">
            <div class="ui-widget-header mdt-widget-header">
                Create new Role Mapping
            </div>
            <div class="Settings">  
                <%= Html.ValidationSummary("Create was unsuccessful. Please correct the errors and try again.") %>
                <table>
                    <tr>
                        <td>
                            <label for="Role">Role</label>
                        </td>
                        <td>
                            <%If Roles.Count > 0 Then%>
                                <%=Html.DropDownList("ID", Roles, "")%>
                            <%Else %>
                                No Roles configured!
                            <%End If%>
                            <%=Html.ValidationMessage("ID", "*")%>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="ARPName">ARP Name</label>
                        </td>
                        <td>
                            <%=Html.TextBox("ARPName", Model.ARPName, New With {.style = "width:300px;"})%>
                            <%= Html.ValidationMessage("ARPName", "*") %>
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

