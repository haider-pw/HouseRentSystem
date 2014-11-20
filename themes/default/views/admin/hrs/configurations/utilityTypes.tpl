{{extends file="adminLayout.tpl"}}
{{block name="header"}}
<title>{{$title}}</title>
{{/block}}

{{block name="content"}}
    <div class="outer">
        <div class="inner">
            {{*DataTables Grid Start Here*}}
            <div class="row ui-sortable">
                <div class="col-lg-12">
                    <div class="box">
                        <header>
                            <div class="icons">
                                <i class="fa fa-table"></i>
                            </div>
                            <h5>Manage Utility Types</h5>
                            <div style="float:right; margin-right:10px; margin-top: 5px;"><a data-original-title="" href="#addNewPropertyModal_ManageProperties" data-toggle="modal" class="btn btn-metis-5 btn-sm btn-grad btn-rect">Add New Property</a></div>
                        </header>
                        <div class="body" id="collapse4">
                            <table id="ManageUtilityTypes" class="table table-bordered table-condensed table-hover table-striped">
                                <thead>
                                <tr>
                                    <th>Utility ID</th>
                                    <th data-class="expand">Utility Type Name</th>
                                    <th data-hide="phone">Description</th>
                                    <th>Actions</th>
                                </tr>
                                </thead>
                                <tbody></tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            {{*End of DataTables Grid Coding*}}
        </div>
    </div>
    {{*End of the Main Content View*}}

    {{*Hidden Models Below for Actions of the View*}}

{{/block}}
{{block name="scripts"}}
    {{js('datatables/fnReloadAjax.js')}}
<script>
    var oTable;
    $('document').ready(function (e) {
        oTable = '';
        //Data Tables Script Here.
        var selector = $('#ManageUtilityTypes');
        var url = "{{base_url()}}admin/hrsConfigurations/listUtilityTypes_DT/";
        var aoColumns =  [
            /* ID */   {
                "bVisible":    false,
                "bSortable":   false,
                "bSearchable": false
            },
            /* Utility Type Name */  null,
            /* Description */  null,
            /* Actions */  null,
        ];
        commonDataTables(selector,url,aoColumns);
        //End Of dataTables Script..
    });
</script>
{{/block}}
