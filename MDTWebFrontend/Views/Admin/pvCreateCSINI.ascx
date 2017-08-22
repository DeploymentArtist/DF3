<%@ Control Language="VB" Inherits="System.Web.Mvc.ViewUserControl(Of MaikKoster.MDT.MVC.CreateCustomSettingsIniView)" %>

    <% Using Html.BeginForm("CreateCSINI")%>

    <div class="clear">
        <div>
            <div id="commonconf" class="ui-widget-content ui-corner-all mdt-widget configuration">
                <div class="ui-widget-header mdt-widget-header">
                    Database configuration
                </div>
                <div class="Settings">  
                    <table>
                        <tr>
                            <td>
                                <label for="DatabaseServer">Database Server</label>
                            </td>
                            <td>
                                <%=Html.TextBox("DatabaseServer", Model.DatabaseServer)%>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="Instance">Instance</label>
                            </td>
                            <td>
                                <%=Html.TextBox("Instance", Model.Instance)%>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="DatabaseName">Database Name</label>
                            </td>
                            <td>
                                <%=Html.TextBox("DatabaseName", Model.DatabaseName)%>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="Share">SQL Share</label>
                            </td>
                            <td>
                                <%=Html.TextBox("Share", Model.SQLShare)%>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="NetworkLibrary">Network Library</label>
                            </td>
                            <td>
                                <select id="NetworkLibrary" name="NetworkLibrary">
                                    <option value="DBNMPNTW" selected="selected">Named Pipes</option>
                                    <option value="DBMSSOCN">TCP/IP Sockets</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="DatabaseUser">User</label>
                            </td>
                            <td>
                                <%=Html.TextBox("DatabaseUser", Model.DatabaseUser)%>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="DatabasePassword">Password</label>
                            </td>
                            <td>
                                <%=Html.TextBox("DatabasePassword", Model.DatabasePassword)%>
                            </td>
                        </tr>
                    </table>
                    <input type="submit" value="Create CustomSettings.ini" name="SaveChanges" class="ui-state-default fg-button ui-corner-all"/><br />
                    <br />
                    <a href="<%=Url.RouteUrl(New With {.action = "Configure", .controller = "Admin"})%>"
                        class="fg-button ui-state-default ui-corner-all linkbutton">
                        Back to Configuration</a>
                    <br />
                    <br />

                </div>
            </div>
            <div id="Div1" class="ui-widget-content ui-corner-all mdt-widget configuration">
                <div class="ui-widget-header mdt-widget-header">
                    Database Rules
                </div>
                <div class="Settings csini">  
                    <table>
                        <tr class="center">
                            <td>
                                
                            </td>
                            <td>
                                Locations
                            </td>
                            <td>
                                Settings
                            </td>
                            <td>
                                Roles
                            </td>
                            <td>
                                Applications
                            </td>
                            <td>
                                Packages
                            </td>
                            <td>
                                Administrators
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Computer
                            </td>
                            <td class="center">
                                <input type="checkbox" name="chkLocations" value="Locations" />
                            </td>
                            <td class="center">
                                <input type="checkbox" name="chkCSettings" value="ComputerSettings" />
                            </td>
                            <td class="center">
                                <input type="checkbox" name="chkCRoles" value="ComputerRoles" />
                            </td>
                            <td class="center">
                                <input type="checkbox" name="chkCApps" value="ComputerApps" />
                            </td>
                            <td class="center">
                                <input type="checkbox" name="chkCPackages" value="ComputerPackages" />
                            </td>
                            <td class="center">
                                <input type="checkbox" name="chkCAdmins" value="ComputerAdmins" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Location
                            </td>
                            <td class="center">
                                
                            </td>
                            <td class="center">
                                <input type="checkbox" name="chkLSettings" value="LocationSettings" />
                            </td>
                            <td class="center">
                                <input type="checkbox" name="chkLRoles" value="LocationRoles" />
                            </td>
                            <td class="center">
                                <input type="checkbox" name="chkLApps" value="LocationApps" />
                            </td>
                            <td class="center">
                                <input type="checkbox" name="chkLPackages" value="LocationPackages" />
                            </td>
                            <td class="center">
                                <input type="checkbox" name="chkLAdmins" value="LocationAdmins" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                MakeModel
                            </td>
                            <td>
                                
                            </td>
                            <td class="center">
                                <input type="checkbox" name="chkMMSettings" value="MakeModelSettings" />
                            </td>
                            <td class="center">
                                <input type="checkbox" name="chkMMRoles" value="MakeModelRoles" />
                            </td>
                            <td class="center">
                                <input type="checkbox" name="chkMMApps" value="MakeModelApps" />
                            </td>
                            <td class="center">
                                <input type="checkbox" name="chkMMPackages" value="MakeModelPackages" />
                            </td>
                            <td class="center">
                                <input type="checkbox" name="chkMMAdmins" value="MakeModelAdmins" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Role
                            </td>
                            <td>
                                
                            </td>
                            <td class="center">
                                <input type="checkbox" name="chkRSettings" value="RoleSettings" />
                            </td>
                            <td class="center">
                                
                            </td>
                            <td class="center">
                                <input type="checkbox" name="chkRApps" value="RoleApps" />
                            </td>
                            <td class="center">
                                <input type="checkbox" name="chkRPackages" value="RolePackages" />
                            </td>
                            <td class="center">
                                <input type="checkbox" name="chkRAdmins" value="RoleAdmins" />
                            </td>
                        </tr>                        
                        <tr>
                            <td>
                                Mapping
                            </td>
                            <td>
                            
                            </td>
                            <td>
                                
                            </td>
                            <td class="center">
                                <input type="checkbox" name="chkRoleMapping" value="RoleMapping" />
                            </td>
                            <td>
                            
                            </td>
                            <td class="center">
                                <input type="checkbox" name="chkPackageMapping" value="PackageMapping" />
                            </td>
                            <td>
                            
                            </td>
                        </tr>
                    </table>
                    <input type="button" value="Check all" id="btncsinicheckall" onclick="csinicheckall();" class="ui-state-default fg-button ui-corner-all"/>
                    <input type="button" value="Uncheck all" id="btncsiniuncheckall" onclick="csiniuncheckall();" class="ui-state-default fg-button ui-corner-all"/>
                </div>
            </div>

            <div id="Div2" style="width:200px;" class="ui-widget-content ui-corner-all mdt-widget configuration">
                <div class="ui-widget-header mdt-widget-header">
                    Sequence
                </div>
                <div>
                    <ul id="csinisequence" class="MDTSortable">
                        <li id="default" class="ui-state-default">Default<input type="hidden" name="x_Default" id="x_Default" value="Default" /></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>   

    <% End Using %>

<br class="clear" />