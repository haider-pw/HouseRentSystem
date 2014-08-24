/**
 * Created by HaiderHassan on 8/22/14.
 */
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