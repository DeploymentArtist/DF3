<%@ Control Language="VB" Inherits="System.Web.Mvc.ViewUserControl(Of MaikKoster.MDT.MVC.ConfigurationView)" %>
    <%="" %>
    <%=Html.ValidationSummary("Edit was unsuccessful. Please correct the errors and try again.")%>

    <% Using Html.BeginForm("Configure", "Admin", Nothing, FormMethod.Post, New With {.Class = "MDTForm"})%>
    <%Dim DBStatus = Model.DBStatus%>
    <%=Html.Hidden("OldStatus", DBStatus)%>
    <div class="clear">
        <div>
            <div id="commonconf" style="width:200px;" class="ui-widget-content ui-corner-all mdt-widget configuration">
                <div class="ui-widget-header mdt-widget-header">
                    Common settings
                </div>
                <div class="Settings">  
                    <table>
                        <tr>
                            <td>
                                <label for="EnhancedSecurity">Enable enhanced features / security</label>
                            </td>
                            <td>
                                <% If DBStatus = MaikKoster.MDT.MVC.MDTRepository.DatabaseStatus.NoConnection OrElse DBStatus = MaikKoster.MDT.MVC.MDTRepository.DatabaseStatus.NoMDTDatabase OrElse DBStatus = MaikKoster.MDT.MVC.MDTRepository.DatabaseStatus.MDT2008 OrElse DBStatus = MaikKoster.MDT.MVC.MDTRepository.DatabaseStatus.MDT2010 Then%>
                                <%=Html.CheckBox("EnhancedSecurity", Model.Configuration.EnhancedSecurity, New With {.disabled = "true"})%>
                                <% Else%>
                                <%=Html.CheckBox("EnhancedSecurity", Model.Configuration.EnhancedSecurity)%>
                                <% End If%>
                                <%= Html.ValidationMessage("EnhancedSecurity", "*") %>
                            </td>
                        </tr>
                    </table>
                    <input type="submit" value="Save Changes" name="SaveChanges" class="ui-state-default fg-button ui-corner-all"/>
                    <input type="submit" value="Cancel" name="SaveChanges" class="ui-state-default fg-button ui-corner-all"/>
                </div>
                <br />
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
                    <table>
                        <tr title="MDT database server name">
                            <td>
                                <label for="MDTDBServer">Database Server</label>
                            </td>
                            <td>
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
                    <input type="submit" value="Test MDT DB connection" name="SaveChanges" class="ui-state-default fg-button ui-corner-all"/>
                    <% If (Model.MDTConnectionTest = "" OrElse Model.MDTConnectionTest = "success") AndAlso (DBStatus = MaikKoster.MDT.MVC.MDTRepository.DatabaseStatus.MDT2008 OrElse DBStatus = MaikKoster.MDT.MVC.MDTRepository.DatabaseStatus.MDT2010 OrElse DBStatus = MaikKoster.MDT.MVC.MDTRepository.DatabaseStatus.FrontEndBeta2 OrElse DBStatus = MaikKoster.MDT.MVC.MDTRepository.DatabaseStatus.FrontEndBeta2NotEnabled) Then%>
                    <input type="submit" value="Upgrade Database" name="SaveChanges" class="ui-state-default fg-button ui-corner-all"/>
                    <% End If%>
                    <% If Model.MDTConnectionTest = "" AndAlso DBStatus = MaikKoster.MDT.MVC.MDTRepository.DatabaseStatus.MDT2008 Then%>
                    <input type="submit" value="Upgrade MDT 2008 Database to MDT 2010" name="SaveChanges" class="ui-state-default fg-button ui-corner-all"/>
                    <% End If%>
                    <input type="submit" value="Create new MDT Database" name="SaveChanges" class="ui-state-default fg-button ui-corner-all"/>
                    <input type="submit" value="Create customsettings.ini" name="SaveChanges" class="ui-state-default fg-button ui-corner-all"/>
                </div>
            </div>
            <div id="sccmdbconfiguration" style="width:325px;" class="ui-widget-content ui-corner-all mdt-widget configuration">
                <div class="ui-widget-header header mdt-widget-header">
                    SCCM Database configuration
                </div>
                <div class="Settings">
                    <table>
                        <tr title="SCCM database server name">
                            <td>
                                <label for="SCCMDBServer">Database Server</label>
                            </td>
                            <td>
                                <%=Html.TextBox("SCCMDBServer", Model.Configuration.SCCMDBServer)%>
                                <%=Html.ValidationMessage("SCCMDBServer", "*")%>
                            </td>
                        </tr>
                        <tr title="SCCM database name">
                            <td>
                                <label for="SCCMDBName">Database Name</label>
                            </td>
                            <td>
                                <%If Model.SCCMDatabases.Count > 0 Then%>
                                <%=Html.DropDownList("SCCMDBName", New SelectList(Model.SCCMDatabases, Model.Configuration.SCCMDBName), "")%>
                                <%=Html.ValidationMessage("SCCMDBName", "*")%>
                                <%Else %>
                                <%=Html.TextBox("SCCMDBName", Model.Configuration.SCCMDBName)%>
                                <%=Html.ValidationMessage("SCCMDBName", "*")%>
                                <%End If%>
                            </td>
                        </tr>
                        <tr title="Enabling this option will use the configured Application pool user account for authentication">
                            <td>
                               <label for="SCCMDBIntegratedSecurity">Integrated Security</label>
                            </td>
                            <td>
                                <%=Html.CheckBox("SCCMDBIntegratedSecurity", Model.Configuration.SCCMDBIntegratedSecurity)%>
                                <%=Html.ValidationMessage("SCCMDBIntegratedSecurity", "*")%>
                            </td>
                        </tr>
                        <tr title="Username for SCCM database authentication">
                            <td>
                                <label for="SCCMDBUser">User</label>
                            </td>
                            <td>
                                <% If Model.Configuration.SCCMDBIntegratedSecurity Then%>
                                <%=Html.TextBox("SCCMDBUser", Model.Configuration.SCCMDBUser, New With {.disabled = "true"})%>
                                <% Else%>
                                <%=Html.TextBox("SCCMDBUser", Model.Configuration.SCCMDBUser)%>
                                <% End If%>
                                <%=Html.ValidationMessage("SCCMDBUser", "*")%>
                            </td>
                        </tr>
                        <tr title="Password for SCCM database authentication">
                            <td>
                                <label for="SCCMDBPassword">Password</label>
                            </td>
                            <td>
                                <% If Model.Configuration.SCCMDBIntegratedSecurity Then%>
                                <%=Html.Password("SCCMDBPassword", Model.Configuration.SCCMDBPassword, New With {.disabled = "true"})%>
                                <% Else%>
                                <%=Html.Password("SCCMDBPassword", Model.Configuration.SCCMDBPassword)%>
                                <% End If%>
                                <%=Html.ValidationMessage("SCCMDBPassword", "*")%>
                            </td>
                        </tr>
                        <tr title="Enabling this option will return all available packages from the configured SCCM server if opening the package search page">
                            <td>
                                <label for="ReturnAllOnInitialSCCMSearch">Return all available packages on initial search</label>
                            </td>
                            <td>
                                <%=Html.CheckBox("ReturnAllOnInitialSCCMSearch", Model.Configuration.ReturnAllOnInitialSCCMSearch)%>
                                <%= Html.ValidationMessage("ReturnAllOnInitialSCCMSearch", "*") %>
                            </td>
                        </tr>
                    </table>
                    <input type="submit" value="Test SCCM DB connection" name="SaveChanges" class="ui-state-default fg-button ui-corner-all"/>
                </div>
            </div>
        </div>
    </div>
    <% End Using %>
<br class="clear"/>


