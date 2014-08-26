{{extends file='adminLayout.tpl'}}
{{block name="header"}}
    <title>Manage Tabs</title>
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
                            <h5>Manage Forms</h5>
                            <div style="float:right; margin-right:10px; margin-top: 5px;"><a title="" id="addNewFormFunc" data-original-title="" href="#addNewFormModal" data-toggle="modal" class="btn btn-metis-5 btn-sm btn-grad btn-rect">Add New Form</a></div>
                        </header>
                        <div class="body" id="collapse4">
                            <table id="ManageForms" class="table table-bordered table-condensed table-hover table-striped">
                                <thead>
                                <tr>
                                    <th>Tab ID</th>
                                    <th data-class="expand">TabName</th>
                                    <th>Tab Order</th>
                                    <th data-hide="phone,tablet">Tab Desc</th>
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
    <script>
        $(document).ready(function(e){
            //Data Tables Script Here.
            var selector = $('#ManageForms');
            var url = "{{base_url()}}admin/configurations/listTabs_DT/";
            var aoColumns =  [
                /* ID */   {
                    "bVisible":    false,
                    "bSortable":   false,
                    "bSearchable": false
                },
                /* Form Name */  null,
                /* Form Path */  null,
                /* Form CI Path */  null,
                /* Actions */  null
            ];
            commonDataTables(selector,url,aoColumns);
            //End Of dataTables Script..
        });
    </script>
+{{/block}}