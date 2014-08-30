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
                            <h5>Manage Forms</h5>
                            <div style="float:right; margin-right:10px; margin-top: 5px;"><a title="" id="createNewUserBtn" data-original-title="" href="{{url}}admin/usersManageUsers/CreateUser" class="btn btn-metis-5 btn-sm btn-grad btn-rect">Create New User</a></div>
                        </header>
                        <div class="body" id="collapse4">
                            <table id="ListUsers" class="table table-bordered table-condensed table-hover table-striped">
                                <thead>
                                <tr>
                                    <th>User ID</th>
                                    <th data-class="expand">GroupID</th>
                                    <th data-hide="phone">Full Name</th>
                                    <th data-hide="phone,tablet">Username</th>
                                    <th data-hide="phone,tablet">Mobile</th>
                                    <th data-hide="phone,tablet">Email</th>
                                    <th data-hide="phone,tablet">Group</th>
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
        /**
         * @var oTable will be Global variable.
         *
         **/
        var oTable;
        $(document).ready(function(e){
            oTable = '';
            //Data Tables Script Here.
            var selector = $('#ListUsers');
            var url = "{{base_url()}}admin/usersManageUsers/listUsers_DT/";
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
                /* Description */  null
            ];
            commonDataTables(selector,url,aoColumns);
            //End Of dataTables Script..
        });
    </script>
{{/block}}