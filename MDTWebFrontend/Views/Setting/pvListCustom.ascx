<%@ Control Language="VB" Inherits="System.Web.Mvc.ViewUserControl(Of IEnumerable (Of MaikKoster.MDT.Model.CustomSetting))" %>
<%="" %>
<br />
<%  If CType(ViewData("AccessLevel"), MaikKoster.MDT.Model.Enums.AccessLevel) = MaikKoster.MDT.Model.Enums.AccessLevel.Change Then%>
    <%If Model.Count > 20 Then%>
        <p>
            <a title="Edit Settings" href="<%=Url.RouteUrl(New With {.action = "EditCustom", .controller = "Setting", .IdentityType = ViewData("IdentityType"), .IdentityID = ViewData("IdentityID")})%>"
            class="fg-button ui-state-default ui-corner-all linkbutton" style="color: #2E6E9E;">Edit Settings</a>
        </p>
    <%End If %>
<%End If %>
<div class="ui-widget ui-widget-content ui-corner-all Settings">
    <%If Model.Count >= 0 Then%>
        <%  Dim Category As String%>
        <%  Dim First As Boolean = True%>
        <%  For Each item In Model%>
            <%  If Category <> item.Category Then%>
                <%Category = item.Category%>
                <%If First Then%>
                    <%First = False%>
                <%Else%>
                    </table> </div>
                <%End If%>
            
                <div class="ui-helper-reset ui-helper-clearfix">
                <div class="ui-widget-header collapsible category">
                    <%=Html.Encode(Category)%>
                </div>
                <table width="100%">
            <%End If%>
            <tr>
            <td class="settingname" <%=Html.Encode(If(item.Description <> "", "title='" & item.Description & "'", ""))%>>
                <%=Html.Encode(If(item.Name <> "", item.Name,  item.Column_Name))%>
            </td>
            <td class="settingvalue" <%=Html.Encode(If(item.Description <> "", "title='" & item.Description & "'", ""))%>>
                <%Html.RenderAction("RenderValue", "List", New With {.ID = IIf(item.ListID Is Nothing, 0, item.ListID), .Type = item.Column_Type, .Value = item.Column_Value})%>
                <%-- <%=Html.Encode(If(item.Column_Type = "Password", New String("*", item.Column_Value.Length), item.Column_Value))%>--%>
            </td>
            </tr>
            <%-- <div class="clear"></div>--%>
            <%-- <li <%=Html.Encode(If(item.Description <> "", "title='" & item.Description & "'", ""))%>>
                <%=Html.Encode(If(item.Name <> "", item.Name,  item.Column_Name))%>:
                <%=html.Encode(If (item.Column_Type="Password", New String("*", item.Column_Value.Length), item.Column_Value))  %>
            </li>--%>
        <%Next%>
        
        </table>
        </div>
    <%End If%>
</div>  
<br class="clear" />  
<%  If CType(ViewData("AccessLevel"), MaikKoster.MDT.Model.Enums.AccessLevel) = MaikKoster.MDT.Model.Enums.AccessLevel.Change Then%>
    <p>
        <a title="Edit Settings" href="<%=Url.RouteUrl(New With {.action = "EditCustom", .controller = "Setting", .IdentityType = ViewData("IdentityType"), .IdentityID = ViewData("IdentityID")})%>"
        class="fg-button ui-state-default ui-corner-all linkbutton" style="color: #2E6E9E;">Edit Settings</a>
    </p>
<%End If %>


