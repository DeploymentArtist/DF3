<%@ Control Language="VB" Inherits="System.Web.Mvc.ViewUserControl(Of MaikKoster.MDT.Model.AccessRoleMember)" %>
<%="" %>
    <%=Html.ValidationSummary("Edit was unsuccessful. Please correct the errors and try again.")%>

    <% Using Html.BeginForm() %>

        <fieldset>
            <legend>Fields</legend>
            <p>
                <label for="AccessRoleID">AccessRoleID:</label>
                <%= Html.TextBox("AccessRoleID", Model.AccessRoleID) %>
                <%= Html.ValidationMessage("AccessRoleID", "*") %>
            </p>
            <p>
                <label for="UserID">UserID:</label>
                <%= Html.TextBox("UserID", Model.UserID) %>
                <%= Html.ValidationMessage("UserID", "*") %>
            </p>
            <p>
                <label for="ID">ID:</label>
                <%= Html.TextBox("ID", Model.ID) %>
                <%= Html.ValidationMessage("ID", "*") %>
            </p>
            <p>
                <label for="Instance">Instance:</label>
                <%= Html.TextBox("Instance", Model.Instance) %>
                <%= Html.ValidationMessage("Instance", "*") %>
            </p>
            <p>
                <input type="submit" value="Save" />
            </p>
        </fieldset>

    <% End Using %>

    <div>
        <%=Html.ActionLink("Back to List", "Index") %>
    </div>


