<%@ Control Language="VB" Inherits="System.Web.Mvc.ViewUserControl(Of MaikKoster.MDT.Model.ComputerIdentity)" %>
<%  Using Html.BeginForm("Edit", "Computer", New With {.IdentityID = ViewData("IdentityID")}, FormMethod.Post, New With {.Class = "MDTForm"})%>
<div class="clear">
    <div id="details" class="ui-widget-content ui-corner-all mdt-widget">
        <div class="ui-widget-header mdt-widget-header">
            Computer Details
        </div>
        <div class="Settings">
            <%=Html.ValidationSummary("Edit was unsuccessful. Please correct the errors and try again.")%>
            <table>
                <tr>
                    <td width="99px">
                        ID
                    </td>
                    <td>
                        <%= Html.Encode(Model.ID) %>
                        <%=Html.Hidden("ID")%>
                    </td>
                </tr>
                <tr>
                    <td>
                        Description
                    </td>
                    <td>
                        <%= Html.TextBox("Description", Model.Description) %>
                        <%= Html.ValidationMessage("Description", "*") %>
                    </td>
                </tr>
                <tr>
                    <td>
                        AssetTag
                    </td>
                    <td>
                        <%= Html.TextBox("AssetTag", Model.AssetTag) %>
                        <%= Html.ValidationMessage("AssetTag", "*") %>
                    </td>
                </tr>
                <tr>
                    <td>
                        UUID
                    </td>
                    <td>
                        <%= Html.TextBox("UUID", Model.UUID) %>
                        <%= Html.ValidationMessage("UUID", "*") %>
                    </td>
                </tr>
                <tr>
                    <td>
                        Serial Number
                    </td>
                    <td>
                        <%= Html.TextBox("SerialNumber", Model.SerialNumber) %>
                        <%= Html.ValidationMessage("SerialNumber", "*") %>
                    </td>
                </tr>
                <tr>
                    <td>
                        MAC Address
                    </td>
                    <td>
                        <%= Html.TextBox("MacAddress", Model.MacAddress) %>
                        <%= Html.ValidationMessage("MacAddress", "*") %>
                    </td>
                </tr>
            </table>
            <input type="submit" value="Save" name="SubmitValues" class="ui-state-default fg-button ui-corner-all" />
            <input type="submit" value="Cancel" name="SubmitValues" class="ui-state-default fg-button ui-corner-all" />
        </div>
    </div>
</div>
<br class="clear" />
<% End Using %>
