<%@ Page Title="" Language="VB" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage(Of IEnumerable (Of MaikKoster.MDT.Model.CustomSetting))" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    ObjectResultTest
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        ObjectResultTest</h2>
        <%=""%>
    <%If Model.Count >= 0 Then%>
        <%  Dim Category As String%>
        <%  Dim First As Boolean = True%>
        <%  For Each item In Model%>
        <%  If Category <> item.Category Then%>
            <%Category = item.Category%>
            <%If First Then%>
                <%First = False%>
            <%Else%>
                </ul> </div>
            <%End If%>
            <div class="ui-helper-reset ui-helper-clearfix">
            <div class="ui-widget-header collapsible">
                <%=Html.Encode(Category)%>
            </div>
            <ul>
            <%End If%>
            <li>
                <%=Html.Encode(item.Column_Name)%>:
                <%=Html.Encode(item.Column_Value)%>
            </li>
            <%Next%>
            </div>
            <table>
                <tr>
                    <th>
                    </th>
                    <th>
                        Group
                    </th>
                    <th>
                        Category
                    </th>
                    <th>
                        Column_Name
                    </th>
                    <th>
                        Column_Value
                    </th>
                    <th>
                        Description
                    </th>
                    <th>
                        ReadOnly
                    </th>
                    <th>
                        Column_Type
                    </th>
                    <th>
                        ID
                    </th>
                    <th>
                        Type
                    </th>
                </tr>
                <% For Each item In Model%>
                <tr>
                    <td>
                        <%=Html.ActionLink("Edit", "Edit", New With {.id = item.ID})%>
                        |
                        <%=Html.ActionLink("Details", "Details", New With {.id = item.ID})%>
                    </td>
                    <td>
                        <%= Html.Encode(item.Group) %>
                    </td>
                    <td>
                        <%= Html.Encode(item.Category) %>
                    </td>
                    <td>
                        <%= Html.Encode(item.Column_Name) %>
                    </td>
                    <td>
                        <%= Html.Encode(item.Column_Value) %>
                    </td>
                    <td>
                        <%= Html.Encode(item.Description) %>
                    </td>
                    <td>
                        <%= Html.Encode(item.ReadOnly) %>
                    </td>
                    <td>
                        <%= Html.Encode(item.Column_Type) %>
                    </td>
                    <td>
                        <%= Html.Encode(item.ID) %>
                    </td>
                </tr>
                <% Next%>
            </table>
            <%End If%>
</asp:Content>
