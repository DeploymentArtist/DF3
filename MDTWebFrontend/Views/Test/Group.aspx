<%@ Page Title="" Language="VB" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage(Of MaikKoster.MDT.Model.Group)" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Group</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <%--    <script type="text/javascript" language="javascript">
        $(function() {
            $('ul.MDTSortable').sortable({
                update: function(event, ui) {

                    $('input.MDTSortable').show();
                }
            });
        });
        
    </script>--%>
    
 <%--   	<script type="text/javascript">
    	    $(function() {
    	        $(".MDTGroupSortable").sortable({
    	            connectWith: '.column'
    	        });

    	        var Link;
    	        $('a.ConfirmDeleteLink').unbind();
    	        $('a.ConfirmDeleteLink').click(function(e) {
    	            e.preventDefault();
    	            Link = this.href;
    	            var msg;
    	            msg = this.title + "?";
    	            confirm(msg, function() {
    	                $(ui.panel).load(Link, { TestParam: 1 }, function() {
    	                    AddClickHandler(ui);
    	                    AddFormHandler(ui);
    	                });
    	            });
    	        });

    	        //    	        $(".portlet").addClass("ui-widget ui-widget-content ui-helper-clearfix ui-corner-all")
    	        //			.find(".portlet-header")
    	        //				.addClass("ui-widget-header ui-corner-all")
    	        //				.prepend('<span class="ui-icon ui-icon-plusthick"></span>')
    	        //				.end()
    	        //			.find(".portlet-content");

    	        //    	        $(".portlet-header .ui-icon").click(function() {
    	        //    	            $(this).toggleClass("ui-icon-minusthick");
    	        //    	            $(this).parents(".portlet:first").find(".portlet-content").toggle();
    	        //    	        });

    	        $(".column").disableSelection();
    	    });
	</script>--%>
	
	<style type="text/css">

	</style>
    
    <h2>Configure Group "<%=Html.Encode(Model.Name)%>"</h2>


<%  Using Html.BeginForm("EditGroup", "Test", New With {.ID = Model.ID}, FormMethod.Post, New With {.Class = "MDTForm"})%>

    <fieldset>
        <p>
            <%=Html.Hidden("ID", Model.ID)%>
            <label for="Name">Name:</label>
            <%= Html.TextBox("Name", Model.Name) %>
            <%= Html.ValidationMessage("Name", "*") %>
        </p>
        <p>
            <label for="Description">Description:</label>
            <%= Html.TextBox("Description", Model.Description) %>
            <%= Html.ValidationMessage("Description", "*") %>
        </p>
    </fieldset>
    
<div id="Categories">
    <div class="MDTGroupSortable">
        <%For Each Item In Model.Categories_Groups.OrderBy(Function(c) c.Sequence)%>
            <div class="portlet ui-widget ui-widget-content ui-helper-clearfix ui-corner-all">
                <div class="portlet-header ui-widget-header ui-corner-all"><%=Html.Encode(Item.Category.Name)%>
                    <a title='Remove Category "<%=html.encode(Item.Category.Name)%>" from Group "<%=html.encode(model.Name)%>"' href="<%=Url.RouteUrl(New With {.action = "RemoveCategory", .controller = "Group", .ID = model.ID, .CategoryID = item.Category.ID})%>" class="ConfirmDeleteLink">
                        <img src=<%=Url.Image("deleteicon.png")%> alt="Delete" class="deleteicon" style="float:right"/> 
                    </a>
                </div>
		        <div class="portlet-content">
		            <%=Html.Hidden("Category_" & Item.CategoryID, Item.CategoryID)%>
		            <%If Item.Category.Settings_Categories.Count > 0 Then%>
		                <ul>
		                <%For Each Setting In Item.Category.Settings_Categories%>
		                    <li>
		                        <%=Html.Encode(If(Setting.Name <> "", Setting.Name & " (" & Setting.Column_Name & ")", Setting.Column_Name))%>
		                    </li>
		                <%Next%>
		                </ul>
		            <%End If%>
		        </div>
            </div>
        <%Next%>
    </div>
</div>
<br class="clear"/>
    <input type="submit" value="Save" name="SubmitValues" class="ui-state-default fg-button ui-corner-all"/>
    <input type="submit" value="Cancel" name="SubmitValues" class="ui-state-default fg-button ui-corner-all"/>
<%End Using%>
</asp:Content>

