<%@ Control Language="VB" Inherits="System.Web.Mvc.ViewUserControl(Of MaikKoster.MDT.MVC.PaginationViewData)" %>

    <fieldset>
        <legend>Fields</legend>
        <p>
            PageIndex:
            <%= Html.Encode(Model.PageIndex) %>
        </p>
        <p>
            TotalPages:
            <%= Html.Encode(Model.TotalPages) %>
        </p>
        <p>
            PageSize:
            <%= Html.Encode(Model.PageSize) %>
        </p>
        <p>
            TotalCount:
            <%= Html.Encode(Model.TotalCount) %>
        </p>
        <p>
            PageActionLink:
            <%= Html.Encode(Model.PageActionLink) %>
        </p>
        <p>
            HasPreviousPage:
            <%= Html.Encode(Model.HasPreviousPage) %>
        </p>
        <p>
            HasNextPage:
            <%= Html.Encode(Model.HasNextPage) %>
        </p>
    </fieldset>
    <p>
        <%--<%=Html.ActionLink("Edit", "Edit", New With {.id = Model.PrimaryKey})%> |--%>
        <%=Html.ActionLink("Back to List", "Index") %>
    </p>


