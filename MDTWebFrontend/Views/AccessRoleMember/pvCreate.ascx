<%@ Control Language="VB" Inherits="System.Web.Mvc.ViewUserControl(Of MaikKoster.MDT.Model.AccessRoleMember)" %>
<%="" %>
    <h2>
        <%=Html.Encode(String.Format("Create new Assignment for Role {0}", Model.AccessRole.Name))%>
    </h2>

    <%= Html.ValidationSummary("Create was unsuccessful. Please correct the errors and try again.") %>

    <%  Using Html.BeginForm("Create", "AccessRoleMember", New With {.ID = Model.AccessRoleID}, FormMethod.Post, New With {.Class = "MDTForm"})%>

        <fieldset>
            <p>
                <%=Html.Hidden("AccessRoleID")%>
                <label for="Username">Username:</label>
                <input type="text" name="Username" id="Username" class="UserAutocomplete" />
            </p>
            <%If Model.AccessRole.Type <> "A" Then%>
            <p>
                <label for="Instance">Instance:</label>
                <%= Html.ValidationMessage("Instance", "*") %>
                <%=Html.DropDownList("Instance", CType(ViewData("Instances"), SelectList))%>
            </p>
            <%End if %>
            <p>
        <input type="submit" value="Create" name="SubmitValues" class="ui-state-default fg-button ui-corner-all" />
        <input type="submit" value="Cancel" name="SubmitValues" class="ui-state-default fg-button ui-corner-all" />
            </p>
        </fieldset>

    <% End Using %>



