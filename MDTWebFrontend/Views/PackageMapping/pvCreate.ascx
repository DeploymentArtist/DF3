<%@ Control Language="VB" Inherits="System.Web.Mvc.ViewUserControl(Of MaikKoster.MDT.Model.PackageMapping)" %>
<%  Using Html.BeginForm("Create", "PackageMapping", Nothing, FormMethod.Post, New With {.Class = "MDTForm"})%>
    <div class="clear">
        <div id="details" class="ui-widget-content ui-corner-all mdt-widget">
            <div class="ui-widget-header mdt-widget-header">
                Create new Package Mapping
            </div>
            <div class="Settings">  
                <%= Html.ValidationSummary("Create was unsuccessful. Please correct the errors and try again.") %>
                <table>
                    <tr>
                        <td>
                            <label for="Package">Package</label>
                        </td>
                        <td>
                            <%=Html.TextBox("Package", Model.Package, New With {.style = "width:300px;"})%>
                            <%=Html.ValidationMessage("Package", "*")%>
                            <a title="Search for Package in SCCM" href="<%=Url.RouteUrl(New With {.action = "SearchPackage", .controller = "Package", .IdentityID = 0, .Back = "Mapping"})%>"
                                class="fg-button ui-state-default ui-corner-all linkbutton">
                                Search for Package in SCCM</a>
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

