<%@ Control Language="VB" Inherits="System.Web.Mvc.ViewUserControl(Of IEnumerable (Of MaikKoster.MDT.Model.User))" %>
<%="" %>

<h2> Step 1 - Choose the User(s)</h2>
<br />
<%  If Model.Count > 20 Then%>
    <input type="submit" value="Cancel" name="SubmitValues" class="ui-state-default fg-button ui-corner-all" />
    <input type="submit" value="Next" name="SubmitValues" class="ui-state-default fg-button ui-corner-all" />
<%End If%>
<br />
<%  Using Html.BeginForm("Step1", "AccessRoleMember", New With {.ID = ViewData("ID")}, FormMethod.Post, New With {.Class = "MDTForm"})%>
<%If Model.Count > 0 Then%>
    <%Dim x As Integer%>
    <table>
        <tr class="ui-widget ui-widget-header">
            <th></th>
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
            <td align="center">
                <%=Html.Hidden(String.Format("Users1[{0}].ID", x), item.ID)%>
                <%=Html.CheckBox(String.Format("Users1[{0}].Checked", x), item.Checked)%>
            </td>
            <td>
                <%=Html.Hidden(String.Format("Users1[{0}].Username", x), item.Username)%>
                <%=Html.Encode(item.Username)%>
            </td>
            <td>
                <%=Html.Hidden(String.Format("Users1[{0}].Lastname", x), item.Lastname)%>
                <%=Html.Encode(item.Lastname)%>
            </td>
            <td>
                <%=Html.Hidden(String.Format("Users1[{0}].Firstname", x), item.Firstname)%>
                <%=Html.Encode(item.Firstname)%>
            </td>
        </tr>
        <%x += 1%>
    <% Next%>

    </table>
<%End If %>
    
    <br />
    <br />
    <input type="submit" value="Cancel" name="SubmitValues" class="ui-state-default fg-button ui-corner-all" />
    <input type="submit" value="Next" name="SubmitValues" class="ui-state-default fg-button ui-corner-all" />

<%End Using %>    
    



