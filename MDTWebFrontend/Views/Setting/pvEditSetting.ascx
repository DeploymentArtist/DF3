<%@ Control Language="VB" Inherits="System.Web.Mvc.ViewUserControl(Of MaikKoster.MDT.Model.Settings_Categories)" %>

    <%=Html.ValidationSummary("Edit was unsuccessful. Please correct the errors and try again.")%>

    <% Using Html.BeginForm() %>

        <fieldset>
            <legend>Fields</legend>
            <p>
                <label for="CategoryID">CategoryID:</label>
                <%= Html.TextBox("CategoryID", Model.CategoryID) %>
                <%= Html.ValidationMessage("CategoryID", "*") %>
            </p>
            <p>
                <label for="Column_Name">Column_Name:</label>
                <%= Html.TextBox("Column_Name", Model.Column_Name) %>
                <%= Html.ValidationMessage("Column_Name", "*") %>
            </p>
            <p>
                <label for="Sequence">Sequence:</label>
                <%= Html.TextBox("Sequence", Model.Sequence) %>
                <%= Html.ValidationMessage("Sequence", "*") %>
            </p>
            <p>
                <label for="Description">Description:</label>
                <%= Html.TextBox("Description", Model.Description) %>
                <%= Html.ValidationMessage("Description", "*") %>
            </p>
            <p>
                <label for="ReadOnly">ReadOnly:</label>
                <%= Html.TextBox("ReadOnly", Model.ReadOnly) %>
                <%= Html.ValidationMessage("ReadOnly", "*") %>
            </p>
            <p>
                <label for="Type">Type:</label>
                <%= Html.TextBox("Type", Model.Type) %>
                <%= Html.ValidationMessage("Type", "*") %>
            </p>
            <p>
                <label for="Name">Name:</label>
                <%= Html.TextBox("Name", Model.Name) %>
                <%= Html.ValidationMessage("Name", "*") %>
            </p>
            <p>
                <input type="submit" value="Save" />
            </p>
        </fieldset>

    <% End Using %>

    <div>
        <%=Html.ActionLink("Back to List", "Index") %>
    </div>


