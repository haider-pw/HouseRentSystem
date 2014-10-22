{{extends file='adminLayout.tpl'}}
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
                            <h5>Manage Properties</h5>
                            <div style="float:right; margin-right:10px; margin-top: 5px;"><a title="" id="addNewTabFunc" data-original-title="" href="#addNewPropertyModal_ManageProperties" data-toggle="modal" class="btn btn-metis-5 btn-sm btn-grad btn-rect">Add New Property</a></div>
                        </header>
                        <div class="body" id="collapse4">
                            <table id="ManageResidentials" class="table table-bordered table-condensed table-hover table-striped">
                                <thead>
                                <tr>
                                    <th>Residential ID</th>
                                    <th data-class="expand">TypeID</th>
                                    <th data-class="expand">Res No.</th>
                                    <th data-class="expand">TypeName</th>
                                    <th data-hide="phone">Rooms</th>
                                    <th data-hide="phone,tablet">Kitchens</th>
                                    <th data-hide="phone,tablet">Bathrooms</th>
                                    <th data-hide="phone,tablet">Description</th>
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
{{/block}}
{{block name="scripts"}}
    {{js('datatables/fnReloadAjax.js')}}
    <script>
        /**
         * @var oTable will be Global variable.
         *
         **/
        var oTable;
        $(document).ready(function(e){
            oTable = '';
            //Data Tables Script Here.
            var selector = $('#ManageResidentials');
            var url = "{{base_url()}}admin/properties/listResidentials_DT/";
            var aoColumns =  [
                /* ID */   {
                    "bVisible":    false,
                    "bSortable":   false,
                    "bSearchable": false
                },
                {
                    "bVisible":    false,
                    "bSortable":   false,
                    "bSearchable": false
                },
                /* Type */  null,
                /* Type */  null,
                /* Rooms */  null,
                /* Kitchens */  null,
                /* Bathrooms */  null,
                /* Description */  null,
                /* Actions */  null
            ];
            commonDataTables(selector,url,aoColumns);
            //End Of dataTables Script..
        });
    </script>
{{/block}}