<%@ Page Title="" Language="VB" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage(Of MaikKoster.MDT.Model.MakeModelIdentity)" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Create
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <%  Using Html.BeginForm("Create", "MakeModel", Nothing, FormMethod.Post, New With {.Class = "MDTForm"})%>
    <div class="clear">
        <div id="details" class="ui-widget-content ui-corner-all mdt-widget">
            <div class="ui-widget-header mdt-widget-header">
                Create New MakeModel
            </div>
            <div class="Settings">  
                <%= Html.ValidationSummary("Create was unsuccessful. Please correct the errors and try again.") %>
                <table>
                    <tr>
                        <td width="119px">
                            <label for="Make">Make</label>
                        </td>
                        <td>
                            <%= Html.TextBox("Make", Model.Make) %>
                            <%= Html.ValidationMessage("Make", "*") %>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="Model">Model</label>
                        </td>
                        <td>
                            <%=Html.TextBox("Model", Model.Model)%>
                            <%=Html.ValidationMessage("Model", "*")%>
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

