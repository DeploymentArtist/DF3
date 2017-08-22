<%@ Control Language="VB" Inherits="System.Web.Mvc.ViewUserControl(Of MaikKoster.MDT.Model.AccessRole)" %>

    <fieldset>
        <legend>Fields</legend>
        <p>
            ID:
            <%= Html.Encode(Model.ID) %>
        </p>
        <p>
            Description:
            <%= Html.Encode(Model.Description) %>
        </p>
        <p>
            Type:
            <%=Html.Encode(Model.TypeName)%>
        </p>
        <p>
            Details:
            <%= Html.Encode(Model.Details) %>
        </p>
        <p>
            Settings:
            <%= Html.Encode(Model.Settings) %>
        </p>
        <p>
            Applications:
            <%= Html.Encode(Model.Applications) %>
        </p>
        <p>
            Packages:
            <%= Html.Encode(Model.Packages) %>
        </p>
        <p>
            Administrators:
            <%= Html.Encode(Model.Administrators) %>
        </p>
        <p>
            Gateways:
            <%= Html.Encode(Model.Gateways) %>
        </p>
        <p>
            Roles:
            <%= Html.Encode(Model.Roles) %>
        </p>
        <p>
            Name:
            <%= Html.Encode(Model.Name) %>
        </p>
        <p>
            Default:
            <%= Html.Encode(Model.Default) %>
        </p>
    </fieldset>
<p>
        <a title="Edit Access Role" href="<%=Url.RouteUrl(New With {.action = "Edit", .controller = "AccessRole", .ID = Model.ID})%>"
            class="fg-button ui-state-default ui-corner-all linkbutton EditIdentity" style="color: #2E6E9E;">
            Edit Access Role</a>
            
        <a title="Back to List>" href="<%=Url.RouteUrl(New With {.action = "List", .controller = "AccessRole"})%>"
            class="fg-button ui-state-default ui-corner-all linkbutton" style="color: #2E6E9E;">
            Back to List</a>

        <a title="Delete Access Role <%=html.encode(Model.Name)%>" href="<%=Url.RouteUrl(New With {.action = "Delete", .controller = "AccessRole", .ID = Model.ID})%>"
            class="fg-button ui-state-default ui-corner-all linkbutton DeleteIdentity" style="color: #2E6E9E;">
            Delete Access Role</a>
</p>


