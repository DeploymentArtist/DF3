var MyUI;
var Link;

function AddLoadHandler() {
    $.ajaxSetup({ cache: false });
    $("#tabs").tabs();
    $("#tabs").bind('tabsshow', function(event, ui) {
        AddClickHandler(ui);
        AddFormHandler(ui);
    });
    $("#tabs").bind('tabsselect', function(event, ui) {
        $('.ajaxloader').show();
    });

    $('a.linkbutton').click(function() {
        window.location.href = this.href;
    });

    AddLinkButtonHover();

    $('input:submit, .button').addClass('ui-corner-all');

    $('a.IndexConfirmDeleteLink').click(function(e) {
        e.preventDefault();
        Link = this.href;
        var msg;
        msg = this.title + "?";
        confirm(msg, function() {
            $.post(Link, function() {
                //reload page
                window.location = window.location;
            });
        });
    });

    $('.tablesorter').tablesorter();

    $('input[type="file"].enablesavebutton').change(function() {
        EnableSaveButton();
    });
}

function AddClickHandler(ui) {
    $('.ajaxloader').hide();
    $('a', ui.panel).unbind();
    $('a:not(.DeleteLink, .DeleteIdentity, .Reference)', ui.panel).click(function() {
        $('.ajaxloader').show();
        $(ui.panel).load(this.href, function() {
            AddClickHandler(ui);
            AddFormHandler(ui);
        });
        return false;
    });

    $('a.DeleteLink', ui.panel).unbind();
    $('a.DeleteLink', ui.panel).click(function() {
        $(ui.panel).load(this.href, { TestParam: 1 }, function() {
            AddClickHandler(ui);
            AddFormHandler(ui);
        });
        return false;
    });

    $('a.ConfirmDeleteLink', ui.panel).unbind();
    $('a.ConfirmDeleteLink', ui.panel).click(function(e) {
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

    $('button', ui.panel).unbind();
    $('button.DeleteIdentity', ui.panel).click(function(e) {
        e.preventDefault();
        Link = this.value;
        var $msg;
        $msg = this.title;
        confirm($msg, function() {
            window.location.href = Link;
        });
    });

    $('a.DeleteIdentity', ui.panel).click(function(e) {
        e.preventDefault();
        Link = this.href;
        var msg;
        msg = this.title + "?";
        confirm(msg, function() {
            window.location.href = Link;
        });
    });

    $('.deleteitem').unbind();
    $(".deleteitem").click(function() {
        var $lnk;
        $lnk = '../../DeleteItem';
        $lnk = $lnk + '/<%=ViewData("IdentityType") %>';
        $lnk = $lnk + '/<%=ViewData("IdentityID") %>';
        var $name;
        $name = $(this).parent("li").find(".ItemName").attr("name");
        $name = $name.substr(0, $name.indexOf("[") - 1);
        $lnk = $lnk + '/' + $name;
        $lnk = $lnk + '/' + $(this).parent("li").find(".ItemName").val();
        $(ui.panel).load($lnk, { TestParam: 1 }, function() {
            AddClickHandler(ui);
            AddFormHandler(ui);
        });
    });

    $('button.linkbutton', ui.panel).unbind();
    $('button.linkbutton', ui.panel).click(function(e) {
        $('.ajaxloader').show();
        $(ui.panel).load(this.value, function() {
            AddClickHandler(ui);
            AddFormHandler(ui);
        });
        //return false;
    });

    $('input[type="text"].enablesavebutton').focus(function() {
        EnableSaveButton();
    });

    $('input[type="file"].enablesavebutton').change(function() {
        EnableSaveButton();
    });
    
    $('select.enablesavebutton').change(function() {
        EnableSaveButton();
    });

    $('ul.MDTSortable').sortable({
        update: function(event, ui) {
            EnableSaveButton();
        }
    });

    $(".MDTGroupSortable").sortable({
        
    });

    AddLinkButtonHover();


    $('input.AdministratorAutocomplete').autocomplete('../../../Administrator/ListAvailableAdministrators');
    //$('input.UserAutocomplete').autocomplete('/User/acList');

    BindCollapsible();

    $('.tablesorter').tablesorter();

    $("select[multiple]").asmSelect({
        sortable: true,
        animate: true,
        addItemTarget: 'bottom'
    });

    $("#SCCMDBIntegratedSecurity").click(function() {
        if ($(this).is(':checked')) {
            $('#SCCMDBUser').attr('disabled', true);
            $('#SCCMDBPassword').attr('disabled', true);
        }
        else {
            $('#SCCMDBUser').removeAttr('disabled');
            $('#SCCMDBPassword').removeAttr('disabled');
        };
    });

    $("#MDTDBIntegratedSecurity").click(function() {
        if ($(this).is(':checked')) {
            $('#MDTDBUser').attr('disabled', true);
            $('#MDTDBPassword').attr('disabled', true);
        }
        else {
            $('#MDTDBUser').removeAttr('disabled');
            $('#MDTDBPassword').removeAttr('disabled');
        };
    });

    $('.csini input:checkbox').click(function() {
        var chk = $(this).attr('checked');
        var ce = $(this).val();
        if (chk) {
            // Add new element to End of Rules Sequence
            $('#csinisequence').append('<li class="ui-state-default">' +
                          ce + '<input type="hidden" id="x_' + ce + '" name="x_' + ce + '" value="' + ce + '"></li>');
            // show the uncheck all button if necessary
            $('#btncsiniuncheckall').show();
        }
        else {
            // Remove element from Rules Sequence
            $('#' + ce).parent().remove();
            // show the checkall button if necessary
            $('#btncsinicheckall').show();
        }
    });

}

function AddLinkButtonHover() {
    $('.fg-button').hover(function() {
        $(this).addClass("ui-state-hover");
    },
	            function() {
	                $(this).removeClass("ui-state-hover");
	            });
}


function AddFormHandler(ui) {
    MyUI = ui;
    var options = {
        target: ui.panel,
        success: FormSuccess,
        beforeSubmit: FormSubmit
    };

    $('.MDTForm').ajaxForm(options);
}

function FormSubmit(formData, jqForm, options) {
    $('.ajaxloader').show();
    return true;
}

function FormSuccess(responseText, StatusText) {
    AddClickHandler(MyUI);
    AddFormHandler(MyUI);
}

function confirm(message, callback) {
    $('#confirm').modal({
        close: false,
        position: ["20%", ],
        overlayId: 'confirmModalOverlay',
        containerId: 'confirmModalContainer',
        onShow: function(dialog) {
            dialog.data.find('.confirmmessage').append(message);
            //$('#confirmModalContainer').addClass('ui-widget');

            // if the user clicks "yes"
            dialog.data.find('.yes').click(function() {
                // call the callback
                if ($.isFunction(callback)) {
                    callback.apply();
                }
                // close the dialog
                $.modal.close();
            });
        }
    });

}

function CollapsibleTable() {
    var toggleMinus = '<%=Url.Image("minus.png") %>';
    var togglePlus = '<%=Url.Image("plus.png") %>';
    var $subHead = $('tbody th:first-child');

    $subHead.prepend('<img src="' + toggleMinus + '" alt="collapse this section" />');

    $('img', $subHead).addClass('clickable').click(function() {

        var toggleSrc = $(this).attr('src');

        if (toggleSrc == toggleMinus) {

            $(this).attr('src', togglePlus).parents('tr').siblings().fadeOut('fast');

        } else {

            $(this).attr('src', toggleMinus).parents('tr').siblings().fadeIn('fast');

        }
    })
}

function BindCollapsible() {
    $(".collapsible").toggle(
                function() {
                    $(this).parent().find("table").hide("fast");
                },

                function() {
                    $(this).parent().find("table").show("fast");
                });
}

function EnableSaveButton() {
    $('input.savebutton').removeAttr('disabled');
}

function csinicheckall() {
    $('.csini input:checkbox:not(:checked)').each(function() {
        this.checked = true;
        var ce = $(this).val();
        $('#csinisequence').append('<li class="ui-state-default">' +
                          ce + '<input type="hidden" id="x_' + ce + '" name="x_' + ce + '" value="' + ce + '"></li>');
    });
    $('#btncsiniuncheckall').show();
    $('#btncsinicheckall').hide();
}

function csiniuncheckall() {
    $('.csini input:checkbox').each(function() { this.checked = false; });
    $('#csinisequence').children(':not(#default)').remove();
    $('#btncsiniuncheckall').hide();
    $('#btncsinicheckall').show();
}