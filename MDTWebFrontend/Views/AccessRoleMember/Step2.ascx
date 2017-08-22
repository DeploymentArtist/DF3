<%@ Control Language="VB" Inherits="System.Web.Mvc.ViewUserControl(Of IEnumerable (Of MaikKoster.MDT.Model.User))" %>
<%="" %>

<h2> Step 2 - Choose the Instance(s)</h2>
<br />
<%  Using Html.BeginForm("Step2", "AccessRoleMember", New With {.ID = ViewData("ID")}, FormMethod.Post, New With {.Class = "MDTForm"})%>
<%If Model.Count > 0 Then%>
    <%Dim x As Integer%>
    <table>
        <tr class="ui-widget ui-widget-header">
            <th>
                Username
            </th>
            <th>
                Lastname
            </th>
            <th>
                Firstname
            </th>
        </tr>

    <% For Each item In Model%>
    
        <tr>
            <td>
                <%=Html.Hidden(String.Format("Users2[{0}].Username", x), item.Username)%>
                <%=Html.Encode(item.Username)%>
            </td>
            <td>
                <%=Html.Hidden(String.Format("Users2[{0}].ID", x), item.ID)%>
                <%=Html.Encode(item.Lastname)%>
            </td>
            <td>
                <%=Html.Encode(item.Firstname)%>
            </td>
        </tr>
        <%x += 1%>
    <% Next%>

    </table>
<%End If %>
    <br />
    <hr />
    <br />
<%  Dim Instances = CType(ViewData("Instances"), List(Of MaikKoster.MDT.MVC.InstanceView))%>

<%  If Instances.Count > 20 Then%>
    <input type="submit" value="Cancel" name="SubmitValues" class="ui-state-default fg-button ui-corner-all" />
    <input type="submit" value="Next" name="SubmitValues" class="ui-state-default fg-button ui-corner-all" />
<%End If%>
<br />

<%  If Instances.Count > 0 Then%>
    <%Dim x As Integer%>
    <table>
        <tr class="ui-widget ui-widget-header">
            <th></th>
            <th>
                Name
            </th>
        </tr>

    <% For Each item In Instances%>
    
        <tr>
            <td align="center">
                <%=Html.Hidden(String.Format("Instances[{0}].ID", x), item.ID)%>
                <%=Html.CheckBox(String.Format("Instances[{0}].Checked", x), item.Checked)%>
            </td>
            <td>
                <%=Html.Encode(item.Name)%>
            </td>
        </tr>
        <%x += 1%>
    <% Next%>

    </table>
<%End If %>
    
    <br />
    <input type="submit" value="Back" name="SubmitValues" class="ui-state-default fg-button ui-corner-all" />
    <input type="submit" value="Cancel" name="SubmitValues" class="ui-state-default fg-button ui-corner-all" />
    <input type="submit" value="Finish" name="SubmitValues" class="ui-state-default fg-button ui-corner-all" />
    

<%End Using %>    
    



