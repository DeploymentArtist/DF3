<%@ Control Language="VB" Inherits="System.Web.Mvc.ViewUserControl(Of MaikKoster.MDT.MVC.ConfigurationView)" %>

    <%="" %>
    <%=Html.ValidationSummary("Edit was unsuccessful. Please correct the errors and try again.")%>

    <% Using Html.BeginForm("CreateDatabaseStep2", "Admin", Nothing, FormMethod.Post, New With {.Class = "MDTForm"})%>
    <%Dim DBStatus = Model.DBStatus%>
    <%=Html.Hidden("OldStatus", DBStatus)%>
    <div class="clear">
        <div>
            <div id="commonconf" style="width:200px;" class="ui-widget-content ui-corner-all mdt-widget configuration">
                <%--<div class="ui-widget-header mdt-widget-header">
                    Common settings
                </div>
                <div class="Settings">  
                    <input type="submit" value="Back" name="SaveChanges" class="ui-state-default fg-button ui-corner-all"/>
                    <input type="submit" value="Cancel" name="SaveChanges" class="ui-state-default fg-button ui-corner-all"/>
                    <input type="submit" value="Create Database" name="SaveChanges" class="ui-state-default fg-button ui-corner-all"/>
                </div>
                <br />--%>
                <div class="ui-widget-header mdt-widget-header">
                    Status Information
                </div>
                <div class="output"> 
                    <%If Model.ResultText <> "" Then%>
                        <p class="savedchanges">
                            <%=Html.Encode(Model.ResultText)%>
                        </p>
                    <%End If%>
                    <%If Model.ErrorText <> "" Then%>
                        <p class="error">
                            <%=Html.Encode(Model.ErrorText)%>
                        </p>
                    <%End If%>
                </div>
            </div> 
            <div id="mdtdbconfiguration" style="width:325px;" class="ui-widget-content ui-corner-all mdt-widget configuration">
                <div class="ui-widget-header header mdt-widget-header">
                    MDT Database configuration
                </div>
                <div class="Settings">
                    <table width="100%">
                        <tr title="MDT database server name">
                            <td>
                                <label for="MDTDBServer">Database Server</label>
                            </td>
                            <td>
                                <%=Html.Hidden("NewOrExisting", Model.NewOrExisting)%>
                                <%=Html.TextBox("MDTDBServer", Model.Configuration.MDTDBServer)%>
                                <%= Html.ValidationMessage("MDTDBServer", "*") %>
                            </td>
                        </tr>
                        <tr title="MDT database name">
                            <td>
                                <label for="MDTDBName">Database Name</label>
                            </td>
                            <td>
                                <%If Model.MDTDatabases.Count > 0 Then%>
                                <%=Html.DropDownList("MDTDBName", New SelectList(Model.MDTDatabases, Model.Configuration.MDTDBName), "")%>
                                <%=Html.ValidationMessage("MDTDBName", "*")%>
                                <%Else %>
                                <%=Html.TextBox("MDTDBName", Model.Configuration.MDTDBName)%>
                                <%=Html.ValidationMessage("MDTDBName", "*")%>
                                <%End If %>
                            </td>
                        </tr>
                        <tr title="Enabling this option will use the configured Application pool user account for authentication">
                            <td>
                               <label for="MDTDBIntegratedSecurity">Integrated Security</label>
                            </td>
                            <td>
                                <%=Html.CheckBox("MDTDBIntegratedSecurity", Model.Configuration.MDTDBIntegratedSecurity)%>
                                <%=Html.ValidationMessage("MDTDBIntegratedSecurity", "*")%>
                            </td>
                        </tr>
                        <tr title="Username for MDT database authentication">
                            <td>
                                <label for="MDTDBUser">Username</label>
                            </td>
                            <td><% If Model.Configuration.MDTDBIntegratedSecurity Then%>
                                <%=Html.TextBox("MDTDBUser", Model.Configuration.MDTDBUser, New With {.disabled = "true"})%>
                                <% Else%>
                                <%=Html.TextBox("MDTDBUser", Model.Configuration.MDTDBUser)%>
                                <% End If%>
                                <%=Html.ValidationMessage("MDTDBUser", "*")%>
                            </td>
                        </tr>
                        <tr title="Password for MDT database authentication">
                            <td>
                                <label for="MDTDBPassword">Password</label>
                            </td>
                            <td>
                                <% If Model.Configuration.MDTDBIntegratedSecurity Then%>
                                <%=Html.Password("MDTDBPassword", Model.Configuration.MDTDBPassword, New With {.disabled = "true"})%>
                                <% Else%>
                                <%=Html.Password("MDTDBPassword", Model.Configuration.MDTDBPassword)%>
                                <% End If%>
                                <%=Html.ValidationMessage("MDTDBPassword", "*")%>
                            </td>
                        </tr>
                    </table>
                    <input type="submit" value="Back" name="SaveChanges" class="ui-state-default fg-button ui-corner-all"/>
                    <input type="submit" value="Cancel" name="SaveChanges" class="ui-state-default fg-button ui-corner-all"/>
                    <input type="submit" value="Create Database" name="SaveChanges" class="ui-state-default fg-button ui-corner-all"/>
                </div>
            </div>
        </div>
    </div>
    <% End Using %>
<br class="clear"/>