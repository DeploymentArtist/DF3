<%@ Page Title="" Language="VB" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage(Of IEnumerable (Of MaikKoster.MDT.MVC.Locale))" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Test
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Test</h2>

    <p>
        <%=Html.ActionLink("Create New", "Create")%>
    </p>
    
    <table>
        <tr>
            <th></th>
            <th>
                ID
            </th>
            <th>
                RefName
            </th>
            <th>
                ILANGUAGE
            </th>
            <th>
                IFLAGS
            </th>
            <th>
                SSPECIFICCULTURE
            </th>
            <th>
                IPARENT
            </th>
            <th>
                SNAME
            </th>
            <th>
                SSCRIPTS
            </th>
            <th>
                SENGLANGUAGE
            </th>
            <th>
                SABBREVLANGNAME
            </th>
            <th>
                SISO639LANGNAME
            </th>
            <th>
                SISO639LANGNAME2
            </th>
            <th>
                SNATIVELANGNAME
            </th>
            <th>
                ITEXTINFO
            </th>
            <th>
                ICOMPAREINFO
            </th>
            <th>
                IINPUTLANGUAGEHANDLE
            </th>
            <th>
                SENGDISPLAYNAME
            </th>
            <th>
                SNATIVEDISPLAYNAME
            </th>
        </tr>

    <% For Each item In Model%>
    
        <tr>
            <td>
                <%--<%=Html.ActionLink("Edit", "Edit", New With {.id = item.PrimaryKey})%> |
                <%=Html.ActionLink("Details", "Details", New With {.id = item.PrimaryKey})%>--%>
            </td>
            <td>
                <%= Html.Encode(item.ID) %>
            </td>
            <td>
                <%= Html.Encode(item.RefName) %>
            </td>
            <td>
                <%= Html.Encode(item.ILANGUAGE) %>
            </td>
            <td>
                <%= Html.Encode(item.IFLAGS) %>
            </td>
            <td>
                <%= Html.Encode(item.SSPECIFICCULTURE) %>
            </td>
            <td>
                <%= Html.Encode(item.IPARENT) %>
            </td>
            <td>
                <%= Html.Encode(item.SNAME) %>
            </td>
            <td>
                <%= Html.Encode(item.SSCRIPTS) %>
            </td>
            <td>
                <%= Html.Encode(item.SENGLANGUAGE) %>
            </td>
            <td>
                <%= Html.Encode(item.SABBREVLANGNAME) %>
            </td>
            <td>
                <%= Html.Encode(item.SISO639LANGNAME) %>
            </td>
            <td>
                <%= Html.Encode(item.SISO639LANGNAME2) %>
            </td>
            <td>
                <%= Html.Encode(item.SNATIVELANGNAME) %>
            </td>
            <td>
                <%= Html.Encode(item.ITEXTINFO) %>
            </td>
            <td>
                <%= Html.Encode(item.ICOMPAREINFO) %>
            </td>
            <td>
                <%= Html.Encode(item.IINPUTLANGUAGEHANDLE) %>
            </td>
            <td>
                <%= Html.Encode(item.SENGDISPLAYNAME) %>
            </td>
            <td>
                <%= Html.Encode(item.SNATIVEDISPLAYNAME) %>
            </td>
        </tr>
    
    <% Next%>

    </table>

</asp:Content>

