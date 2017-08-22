<%@ Control Language="VB" Inherits="System.Web.Mvc.ViewUserControl(Of String)" %>
<%  Using Html.BeginForm("Edit", "Package", New With {.CurrentPackage = Model}, FormMethod.Post, New With {.Class = "MDTForm"})%>
    <div class="clear">
        <div id="details" class="ui-widget-content ui-corner-all mdt-widget">
            <div class="ui-widget-header mdt-widget-header">
                Edit Package "<%=Html.Encode(Model)%>"
            </div>
            <div class="Settings">  
                <%=Html.ValidationSummary("Edit was unsuccessful. Please correct the errors and try again.")%>
                <table>
                    <tr>
                        <td>
                            <label for="Package">New Package</label>
                        </td>
                        <td>
                            <%=Html.TextBox("NewPackage", If(ViewData("NewPackage") <> "", ViewData("NewPackage"), Model), New With {.style = "width:300px;"})%>
                            <%=Html.ValidationMessage("NewPackage", "*")%>
                            <a title="Search for Package in SCCM" href="<%=Url.RouteUrl(New With {.action = "SearchPackage", .controller = "Package", .IdentityID = 0, .Back = "Replace_" & Model})%>"
                                class="fg-button ui-state-default ui-corner-all linkbutton">
                                Search for Package in SCCM</a>
                        </td>
                    </tr>
                </table>
                <input type="submit" value="Update All" name="SaveChanges" class="ui-state-default fg-button ui-corner-all"/>
                <input type="submit" value="Cancel" name="SaveChanges" class="ui-state-default fg-button ui-corner-all"/>
              </div>
        </div>
    </div>
    <br class="clear" />
<% End Using %>

