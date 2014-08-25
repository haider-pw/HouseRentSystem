/**
 * Created by HaiderHassan on 8/22/14.
 */

;(function(window) {
    var
    // Is Modernizr defined on the global scope
        Modernizr = typeof Modernizr !== "undefined" ? Modernizr : false,
    // whether or not is a touch device
        isTouchDevice = Modernizr ? Modernizr.touch : !!('ontouchstart' in window || 'onmsgesturechange' in window),
    // Are we expecting a touch or a click?
        buttonPressedEvent = (isTouchDevice) ? 'touchstart' : 'click',
        HRS = function() {
            this.init();
        };

    // Initialization method
    HRS.prototype.init = function() {
        this.isTouchDevice = isTouchDevice;
        this.buttonPressedEvent = buttonPressedEvent;
    };

    HRS.prototype.getViewportHeight = function() {

        var docElement = document.documentElement,
            client = docElement.clientHeight,
            inner = window.innerHeight;

        if (client < inner)
            return inner;
        else
            return client;
    };

    HRS.prototype.getViewportWidth = function() {

        var docElement = document.documentElement,
            client = docElement.clientWidth,
            inner = window.innerWidth;

        if (client < inner)
            return inner;
        else
            return client;
    };

    // Creates a "HRS(House Rent System)" object.
    window.HRS = new HRS();
})(this);

/*----------- BEGIN toggleButtons CODE -------------------------*/
$.each($('.make-switch'), function () {
    $(this).bootstrapSwitch({
        onText: $(this).data('onText'),
        offText: $(this).data('offText'),
        onColor: $(this).data('onColor'),
        offColor: $(this).data('offColor'),
        size: $(this).data('size'),
        labelText: $(this).data('labelText')
    });
});
/*----------- END toggleButtons CODE -------------------------*/


/*----------- DataTables Common Script only will need parameters to send and call the function -------------------------*/
function commonDataTables(selector,url,aoColumns){
    var responsiveHelper;
    var breakpointDefinition = {
        tablet: 1024,
        phone : 480
    };
      oTable = selector.dataTable({
        sPaginationType: 'bootstrap',
        oLanguage      : {
            sLengthMenu: '_MENU_ records per page'
        },
        "autoWidth" : false,
        "aoColumns":aoColumns,
        "bServerSide":true,
        "bProcessing":true,
        "bJQueryUI": true,
        "sPaginationType": "full_numbers",
        "sAjaxSource": url,
        "iDisplayLength": 25,
        "aLengthMenu": [[2, 25, 50, -1], [2, 25, 50, "All"]],
        'fnServerData'   : function(sSource, aoData, fnCallback){
            $.ajax ({
                'dataType': 'json',
                'type'    : 'POST',
                'url'     : sSource,
                'data'    : aoData,
                'success' : fnCallback
            }); //end of ajax
        },
        'fnRowCallback': function(nRow, aData, iDisplayIndex, iDisplayIndexFull) {
            $(nRow).attr("data-id",aData[0]);
            responsiveHelper.createExpandIcon(nRow);
            return nRow;
        },
        fnPreDrawCallback: function () {
            // Initialize the responsive datatables helper once.
            if (!responsiveHelper) {
                responsiveHelper = new ResponsiveDatatablesHelper(selector, breakpointDefinition);
            }
        },
        fnDrawCallback : function (oSettings) {
            // Respond to windows resize.
            responsiveHelper.respond();
        }
    });
}

/*----------- END DataTables Common Script -------------------------*/


/*----------- Select2 DropDown Common Script  -------------------------*/
//For ServerSide Script
function commonSelect2(selector,url,id,text,minInputLength,placeholder){
    selector.select2({
        minimumInputLength:minInputLength,
        placeholder:placeholder,
        ajax: {
            type:"post",
            url: url,
            dataType: 'json',
            quietMillis: 100,
            data: function(term, page) {
                return {
                    term: term, //search term
                    page_limit: 10 // page size
                };
            },
            results: function(data, page) {
                var newData = [];
                $.each(data, function (index,value) {
                    newData.push({
                        id: value[id],  //id part present in data
                        text: value[text]  //string to be displayed
                    });
                });
                return { results: newData };
            }
        }
    });
}
//For General Purpose without serverSide Processing
    $(".commonGeneralSelect2").select2({
        placeholder: "Select a State",
        allowClear: true
    });
/*----------- End of Select2 DropDown Common Script  -------------------------*/

;(function($){
    "use strict";
    HRS.formValidation = function() {
        /*----------- BEGIN validationEngine CODE -------------------------*/
        $('#popup-validation').validationEngine();
        /*----------- END validationEngine CODE -------------------------*/
        $('#block-validate').validate({
//            ignore: null,
            ignore: ".ignore, .select2-input",
            rules: {
                required2: "required",
                email2: {
                    required: true,
                    email: true
                },
                date2: {
                    required: true,
                    date: true
                },
                url2: {
                    required: true,
                    url: true
                },
                password2: {
                    required: true,
                    minlength: 5
                },
                confirm_password2: {
                    required: true,
                    minlength: 5,
                    equalTo: "#password2"
                },
                agree2: "required",
                digits: {
                    required: true,
                    digits: true
                },
                range: {
                    required: true,
                    range: [5, 16]
                }
            },
            errorClass: 'help-block',
            errorElement: 'span',
            highlight: function(element, errorClass, validClass) {
                $(element).parents('.form-group').removeClass('has-success').addClass('has-error');
            },
            unhighlight: function(element, errorClass, validClass) {
                $(element).parents('.form-group').removeClass('has-error').addClass('has-success');
            }
        });
        /*----------- END validate CODE -------------------------*/
    };
    return HRS;
})(jQuery);