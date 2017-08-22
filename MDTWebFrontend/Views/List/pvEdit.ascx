<%@ Control Language="VB" Inherits="System.Web.Mvc.ViewUserControl(Of MaikKoster.MDT.Model.CustomList)" %>
<%  Using Html.BeginForm("Update", "List", New With {.ID = Model.ID}, FormMethod.Post, New With {.Class = "MDTForm"})%>
    <%=Html.ValidationSummary("Edit was unsuccessful. Please correct the errors and try again.")%>
    <div class="clear">
        <div id="details" class="ui-widget-content ui-corner-all mdt-widget">
            <div class="ui-widget-header mdt-widget-header">
                Configure custom List "<%=Html.Encode(Model.Name)%>"
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
                    <tr>
                        <td>
                            <label for="Description">Select Multiple</label>
                        </td>
                        <td>
                            <%=Html.CheckBox("Multiple", model.Multiple)%>
                            <%=Html.ValidationMessage("Multiple", "*")%>
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
            <h3>List Entries</h3>

            <ul class="MDTSortable">
                <%  Dim x As Integer%>
                <%For Each Item In Model.CustomListEntries.OrderBy(Function(e) e.Sequence)%>
                <li class="ui-corner-all ui-state-default">
                    <a title='Delete List Entry "<%=html.encode(Item.Text)%>" from custom List "<%=html.encode(model.Name)%>"' 
                        href="<%=Url.RouteUrl(New With {.action = "DeleteEntry", .controller = "List", .ID = model.ID, .ListEntryID = item.ID})%>" class="ConfirmDeleteLink">
                        <img src=<%=Url.Image("deleteicon.png")%> alt="Delete" class="deleteicon"/> 
                    </a>
                    <%=Html.Hidden("Entries_[" & x & "].ID", Item.ID, New With {.Class = "ItemName"})%>
                    <%=Html.Encode(Item.Text & " -> " & Item.Value)%>
                    <%x += 1%>
                </li>
                <%Next%>
            </ul>
    </div>
    <br class="clear"/>
    <hr />
    <br />
    <div id="NewListEntry" class="ui-widget-content ui-corner-all mdt-widget">
        <div class="ui-widget-header mdt-widget-header">
            Add new List Entry
        </div>
        <div class="Settings">  
            <table>
                <tr>
                    <td>
                        Text
                    </td>
                    <td>
                        <%=Html.TextBox("NewEntry.Text")%>
                        <%=Html.ValidationMessage("Text", "*")%>
                    </td>
                </tr>
                <tr>
                    <td>
                        Value
                    </td>
                    <td>
                        <%=Html.TextBox("NewEntry.Value")%>
                        <%=Html.ValidationMessage("Value", "*")%>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <br class="clear"/>
    <br />
    <input type="submit" value="Save" name="SubmitValues" class="ui-state-default fg-button ui-corner-all"/>
    <input type="submit" value="Cancel" name="SubmitValues" class="ui-state-default fg-button ui-corner-all"/>

<% End Using %>



