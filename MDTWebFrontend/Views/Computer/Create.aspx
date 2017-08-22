<%@ Page Title="" Language="VB" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage(Of MaikKoster.MDT.Model.ComputerIdentity)" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Create
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <%  Using Html.BeginForm("Create", "Computer", Nothing, FormMethod.Post, New With {.Class = "MDTForm"})%>
    <div class="clear">
        <div id="details" class="ui-widget-content ui-corner-all mdt-widget">
            <div class="ui-widget-header mdt-widget-header">
                Create New Computer
            </div>
            <div class="Settings">  
                    <%= Html.ValidationSummary("Create was unsuccessful. Please correct the errors and try again.") %>
                <table>
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
                            <label for="AssetTag">AssetTag</label>
                        </td>
                        <td>
                            <%= Html.TextBox("AssetTag", Model.AssetTag) %>
                            <%= Html.ValidationMessage("AssetTag", "*") %>
                            <%=Html.ValidationMessage("Identifier", "*")%>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="UUID">UUID</label>
                        </td>
                        <td>
                            <%= Html.TextBox("UUID", Model.UUID) %>
                            <%= Html.ValidationMessage("UUID", "*") %>
                            <%= Html.ValidationMessage("Identifier", "*")%>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="SerialNumber">Serial Number</label>
                        </td>
                        <td>
                            <%= Html.TextBox("SerialNumber", Model.SerialNumber) %>
                            <%= Html.ValidationMessage("SerialNumber", "*") %>
                            <%=Html.ValidationMessage("Identifier", "*")%>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="MacAddress">MAC Address</label>
                        </td>
                        <td>
                            <%= Html.TextBox("MacAddress", Model.MacAddress) %>
                            <%= Html.ValidationMessage("MacAddress", "*") %>
                            <%=Html.ValidationMessage("Identifier", "*")%>
                        </td>
                    </tr>
                </table>
                <input type="submit" value="Create" name="SubmitValues" class="ui-state-default fg-button ui-corner-all"/>
                <input type="submit" value="Cancel" name="SubmitValues" class="ui-state-default fg-button ui-corner-all"/>
             </div>
        </div>
    </div>
    <br class="clear" />
    <% End Using %>   
</asp:Content>

