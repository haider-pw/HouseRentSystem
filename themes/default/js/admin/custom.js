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

function commonDataTables(selector,url,aoColumns){
    var responsiveHelper;
    var breakpointDefinition = {
        tablet: 1024,
        phone : 480
    };
    var oTable =  selector.dataTable({
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
        //"bFilter":true,
        //"sServerMethod": "POST",
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
            return nRow;
        },
        fnPreDrawCallback: function () {
            // Initialize the responsive datatables helper once.
            if (!responsiveHelper) {
                responsiveHelper = new ResponsiveDatatablesHelper(selector, breakpointDefinition);
            }
        },
        fnRowCallback  : function (nRow) {
            responsiveHelper.createExpandIcon(nRow);
        },
        fnDrawCallback : function () {
            // Respond to windows resize.
            responsiveHelper.respond();
        }
    });
}