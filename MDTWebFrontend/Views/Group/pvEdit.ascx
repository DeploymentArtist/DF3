<%@ Control Language="VB" Inherits="System.Web.Mvc.ViewUserControl(Of MaikKoster.MDT.Model.Group)" %>
<%  Using Html.BeginForm("Edit", "Group", New With {.ID = Model.ID}, FormMethod.Post, New With {.Class = "MDTForm"})%>
<%=Html.ValidationSummary("Edit was unsuccessful. Please correct the errors and try again.")%>
    <div class="clear">
        <div id="details" class="ui-widget-content ui-corner-all mdt-widget">
            <div class="ui-widget-header mdt-widget-header">
                Configure Group "<%=Html.Encode(Model.Name)%>"
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
    <div id="Categories">
        <h3>Categories</h3>
        <div class="MDTGroupSortable">
            <%For Each Item In Model.Categories_Groups.OrderBy(Function(c) c.Sequence)%>
                <div class="portlet ui-widget ui-widget-content ui-helper-clearfix ui-corner-all">
                    <div class="portlet-header ui-widget-header ui-corner-all">
                        <a title='Remove Category "<%=html.encode(Item.Category.Name)%>" from Group "<%=html.encode(model.Name)%>"' href="<%=Url.RouteUrl(New With {.action = "RemoveCategory", .controller = "Group", .ID = model.ID, .CategoryID = item.Category.ID})%>" class="ConfirmDeleteLink">
                            <img src=<%=Url.Image("deleteicon.png")%> alt="Delete" class="deleteicon"/> 
                        </a>
                        <a title='Edit Category "<%=html.encode(Item.Category.Name)%>"' href="<%=Url.RouteUrl(New With {.action = "Edit", .controller = "Category", .ID = item.Category.ID, .url = "Test"})%>">
                            <img src=<%=Url.Image("edit_details.png")%> alt="Edit" class="editicon"/> 
                        </a>
                        <%=Html.Encode(Item.Category.Name)%>
                    </div>
		            <div class="portlet-content">
		                <%=Html.Hidden("Category_" & Item.CategoryID, Item.CategoryID)%>
		                <%If Item.Category.Settings_Categories.Count > 0 Then%>
		                    <ul>
		                    <%For Each Setting In Item.Category.Settings_Categories.OrderBy(Function(s) s.Sequence)%>
		                        <li>
		                            <%=Html.Encode(If(Setting.Name <> "", Setting.Name & " (" & Setting.Column_Name & ")", Setting.Column_Name))%>
		                        </li>
		                    <%Next%>
		                    </ul>
		                <%End If%>
		            </div>
                </div>
            <%Next%>
        </div>
    </div>
    <br class="clear"/>
    <hr />
    <br />
    <div id="NewCategoryContainer" class="ui-widget-content ui-corner-all mdt-widget">
        <div class="ui-widget-header mdt-widget-header">
            Add new Category
        </div>
        <div class="Settings">  
            <table>
                <tr>
                    <td>
                        <%=Html.DropDownList("NewCategory", CType(ViewData("Categories"), SelectList), "...")%>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <br class="clear"/>
    <br />
    <input type="submit" value="Save" name="SubmitValues" class="ui-state-default fg-button ui-corner-all"/>
    <input type="submit" value="Cancel" name="SubmitValues" class="ui-state-default fg-button ui-corner-all"/>
    <br />
<%End Using%>


