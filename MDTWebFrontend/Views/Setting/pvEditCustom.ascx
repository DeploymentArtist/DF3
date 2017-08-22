<%@ Control Language="VB" Inherits="System.Web.Mvc.ViewUserControl(Of IEnumerable (Of MaikKoster.MDT.Model.CustomSetting))" %>
<%="" %>

    <%Using Html.BeginForm("EditCustom", "Setting", Nothing, FormMethod.Post, New With {.Class = "MDTForm"})%>
        <%If Model.Count > 20 Then%>
            <p class="clear">
                <input type="submit" value="Save" name="SubmitValues" class="ui-state-default fg-button ui-corner-all"/>
                <input type="submit" value="Cancel" name="SubmitValues" class="ui-state-default fg-button ui-corner-all"/>
            </p>
        <%End If %>
    <%Dim x As Integer%>
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
                            <%=Html.Hidden(String.Format("CustomSettings[{0}].Column_Name", x), item.Column_Name)%>
                        <%-- <label><%=Html.Encode(If(item.Name <> "", item.Name, item.Column_Name))%>:</label>--%>
                            <%=Html.Encode(If(item.Name <> "", item.Name,  item.Column_Name))%>
                        </td>
                        <td class="settingvalue" <%=Html.Encode(If(item.Description <> "", "title='" & item.Description & "'", ""))%>>
                            <%If item.ReadOnly then%>
                                <%Html.RenderAction("RenderValue", "List", New With {.ID = IIf(item.ListID Is Nothing, 0, item.ListID), .Type = item.Column_Type, .Value = item.Column_Value})%>
                            <%Else %>
                                <%Select item.Column_Type%>
                                <%Case "Text", "Password"%>
                                    <%=Html.TextBox(String.Format("CustomSettings[{0}].Column_Value", x), item.Column_Value)%>
                                <%Case "List"%>
                                    <%Html.RenderAction("RenderList", "List", New With {.ID = IIf(item.ListID Is Nothing, 0, item.ListID), .Type = item.Column_Type, .Name = String.Format("CustomSettings[{0}].Column_Value", x), .Value = item.Column_Value})%>
                                <%Case Else%>
                                    <%=Html.TextBox(String.Format("CustomSettings[{0}].Column_Value", x), item.Column_Value)%>
                                <%End Select %>
                            <%End If %>
                        </td>
                    </tr>
                        <%x += 1%>
                <%Next%>
                </table>
                </div>
            <%End If%>
        </div>    
        <br class="clear" /> 
        <p class="clear">
            <input type="submit" value="Save" name="SubmitValues" class="ui-state-default fg-button ui-corner-all"/>
            <input type="submit" value="Cancel" name="SubmitValues" class="ui-state-default fg-button ui-corner-all"/>
        </p>

    <%End Using%>
