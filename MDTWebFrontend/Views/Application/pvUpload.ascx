<%@ Control Language="VB" Inherits="System.Web.Mvc.ViewUserControl" %>
<%  If ViewData("Show") Then%>
<%  Using (Html.BeginForm("Upload", "Application", FormMethod.Post, New With {.enctype = "multipart/form-data", .class = "MDTForm"}))%>  
        <div id="UploadApplicationContainer" class="ui-widget-content ui-corner-all mdt-widget">
        <div class="ui-widget-header mdt-widget-header">
            Upload MDT Applications.xml file
        </div>
        <div class="Settings">
            <table>
                <tr>
                    <td colspan="2">
                        <input type="file" name="ApplicationXML" id="File1" style="width:450px" class="enablesavebutton"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="radio" name="Synchronize" value="Synchronize" checked="checked" />
                    </td>
                    <td>
                        <b>Synchronize</b> (Update existing, Add new, Delete removed applications)
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="radio" name="Synchronize" value="Update" />
                    </td>
                    <td>
                        <b>Update only</b> (Update existing, Add new applications. Don't delete applications imported earlier)
                    </td>
                </tr>
            </table>
            <input type="submit" name="UploadXML" value="Upload" class="ui-state-default fg-button ui-corner-all savebutton" disabled="disabled"/>
            <input type="submit" name="UploadXML" value="Cancel" class="ui-state-default fg-button ui-corner-all" />
            <br />
        </div>
    </div>
    <br class="clear"/>
    <br />
<%End Using%>
<%End If%>
<%  Html.RenderPartial("pvStatusInfo")%>