<%@ Control Language="VB" Inherits="System.Web.Mvc.ViewUserControl(Of MaikKoster.MDT.Model.Category)" %>
<%  Using Html.BeginForm("Update", "Category", New With {.ID = Model.ID}, FormMethod.Post, New With {.Class = "MDTForm"})%>
<%=Html.ValidationSummary("Edit was unsuccessful. Please correct the errors and try again.")%>
    <div class="clear">
        <div id="details" class="ui-widget-content ui-corner-all mdt-widget">
            <div class="ui-widget-header mdt-widget-header">
                Configure Category "<%=Html.Encode(Model.Name)%>"
            </div>
            <div class="Settings">  
                <table>
                    <tr>
                        <td>
                            <label for="Name">Name</label>
                        </td>
                        <td>
                            <%=Html.Hidden("ID", Model.ID)%>
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
    <br />
    <hr />
    <div id="Settings">
        <h3>Settings</h3>
        <div class="MDTGroupSortable">
            <%For Each Item In Model.Settings_Categories.OrderBy(Function(c) c.Sequence)%>
                <div class="portlet ui-widget ui-widget-content ui-helper-clearfix ui-corner-all">
                    <div class="portlet-header ui-widget-header ui-corner-all">
                        <a title='Remove Setting "<%=html.encode(Item.Column_name)%>" from Category "<%=html.encode(model.Name)%>"' href="<%=Url.RouteUrl(New With {.action = "DeleteSetting", .controller = "Category", .ID = model.ID, .Name = item.column_name})%>" class="ConfirmDeleteLink">
                            <img src=<%=Url.Image("deleteicon.png")%> alt="Delete" class="deleteicon"/> 
                        </a>
                        <%=Html.Encode(If(Item.Name <> "", Item.Name & " (" & Item.Column_Name & ")", Item.Column_Name))%>
                    </div>
		            <div class="portlet-content">
		                <%=Html.Hidden("Setting_" & Item.Column_Name, Item.Column_Name)%>
		                <ul>
		                    <%If Item.Description <> "" Then%>
		                    <li>
		                        <%=Html.Encode(Item.Description)%>
		                    </li>
		                    <%End If%>
		                    <%If Item.Type <> "" Then%>
		                        <% If Item.Type <> "List" Then%>
		                        <li>
		                            <%=Html.Encode(Item.Type)%>
		                        </li>
		                        <% ElseIf Item.Type = "List" AndAlso Not Item.List Is Nothing Then%>
		                        <li>
		                            <%=Html.Encode("List: " & Item.List.Name & If(Item.List.Multiple, " (Multiselect)", ""))%>
		                        </li>
		                        <% End If%>

		                    <%End If %>
		                    <%If Item.ReadOnly Then%>
		                    <li>
		                        Read Only
		                    </li>
		                    <%End If%>
		                </ul>
		            </div>
                </div>
            <%Next%>
        </div>
    </div>
    <br class="clear"/>
    <br />
    <hr />
    <br />
    <div class="clear">
        <div id="NewSetting" class="ui-widget-content ui-corner-all mdt-widget">
            <div class="ui-widget-header mdt-widget-header">
                Add new Setting
            </div>
            <div class="Settings">  
                <table>
                    <tr>
                        <td>
                            <label for="NewSetting.Column_Name">Column Name</label>
                        </td>
                        <td>
                            <%=Html.DropDownList("NewSetting.Column_Name", CType(ViewData("Settings"), SelectList), "...")%>
                            <%=Html.ValidationMessage("NewSetting.Column_Name", "*")%>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="NewSetting.Name">Name</label>
                        </td>
                        <td>
                            <%=Html.TextBox("NewSetting.Name")%>
                            <%=Html.ValidationMessage("NewSetting.Name", "*")%>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="NewSetting.Description">Description</label>
                        </td>
                        <td>
                            <%=Html.TextArea("NewSetting.Description", "", 4, 40, Nothing)%>
                            <%=Html.ValidationMessage("NewSetting.Description", "*")%>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="NewSetting.Type">Type</label>
                        </td>
                        <td>
                            <%=Html.DropDownList("NewSetting.Type", New SelectList(CType(ViewData("SettingTypes"), List(Of MaikKoster.MDT.Model.CustomList)), "ID", "Name"))%>
                            <%= Html.ValidationMessage("NewSetting.Type", "*") %>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="NewSetting.ReadOnly">ReadOnly</label>
                        </td>
                        <td>
                            <%=Html.CheckBox("NewSetting.ReadOnly", False)%>
                        </td>
                    </tr>
                </table>
             </div>
        </div>
    </div>
    <br class="clear" />
    <br />
<br />
<input type="submit" value="Save" name="SubmitValues" class="ui-state-default fg-button ui-corner-all"/>
<input type="submit" value="Cancel" name="SubmitValues" class="ui-state-default fg-button ui-corner-all"/>

<% End Using %>



