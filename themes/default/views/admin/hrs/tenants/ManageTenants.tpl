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
                            <h5>Manage Tenants</h5>
                            <div style="float:right; margin-right:10px; margin-top: 5px;"><a title="" id="addNewTenantFunc" data-original-title="" href="#addNewTenantModal" data-toggle="modal" class="btn btn-metis-5 btn-sm btn-grad btn-rect">Create New Tenant</a></div>
                        </header>
                        <div class="body" id="collapse4">
                            <table id="ManageTenants" class="table table-bordered table-condensed table-hover table-striped">
                                <thead>
                                <tr>
                                    <th>Tenant ID</th>
                                    <th data-class="expand">Full Name</th>
                                    <th data-hide="phone">Username</th>
                                    <th data-hide="phone,tablet">Mobile</th>
                                    <th data-hide="phone,tablet">CNIC</th>
                                    <th data-hide="phone,tablet">Email</th>
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


{{*Create New Tenant From Existing User*}}
    <div id="NewTenantExistingUserModal" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title"><i style='color: #666666' class='fa fa-edit fa-fw fa-1x'></i>Create New Tenant From Existing User</h4>
                </div>
                <div class="modal-body">
                    <div class="body collapse in" id="div-1">
                        <form class="form-horizontal">
                            {{*DataTables Grid Start Here*}}
                            <div class="row ui-sortable">
                                <div class="col-lg-12">
                                    <div class="body" id="collapse4">
                                        <table id="ShowUsersWithNoTenantsRecord"
                                               class="table table-bordered table-condensed table-hover table-striped">
                                            <thead>
                                            <tr>
                                                <th>User ID</th>
                                                <th data-class="expand">Full Name</th>
                                                <th data-hide="phone">Username</th>
                                                <th data-hide="phone,tablet">CNIC</th>
                                            </tr>
                                            </thead>
                                            <tbody></tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            {{*End of DataTables Grid Coding*}}
                        </form>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" id="CreateTenant" disabled data-dismiss="modal">Create</button>
                    <button type="button" class="btn btn-default" id="bacToCreateTenantType" data-dismiss="modal">Back</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal --><!-- /#Edit Button Modal -->

{{*Add New Tenant Modal*}}
    <div id="addNewTenantModal" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title"><i style='color: #666666' class='fa fa-edit fa-fw fa-1x'></i>Create New Tenant</h4>
                </div>
                <div class="modal-body">
                    <div class="body collapse in" id="div-1">
                        <p><i>Please Select The Option Below For Creating a New Tenant Record.</i></p>
                        <form class="form-horizontal">
                            <div class="radio">
                                <label>
                                    <input class="make-switch" id="NewTenantExistingUser" value="NewTenantExistingUser" type="radio" name="createTenantType" data-on-color="success" data-on-text="Yes" data-off-text="NO" data-off-color="danger">
                                    Create New Tenant From Existing User
                                </label>
                            </div>
                            <div class="radio">
                                <label>
                                    <input class="make-switch" id="NewTenantNewUser" value="NewTenantNewUser" type="radio" name="createTenantType" data-on-color="success" data-on-text="Yes" data-off-text="NO" data-off-color="danger">
                                    Create New User For New Tenant
                                </label>
                            </div>
                            </form>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" id="getCreateTenantType">Next</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal --><!-- /#Edit Button Modal -->
{{*-------------------Modals Finished--------------*}}

{{/block}}
{{block name="scripts"}}
    {{js('datatables/fnReloadAjax.js')}}
    <script>
    var oTable;
    $(document).ready(function() {
        oTable = '';
        var isMenuLink_createForm = '';
        var isMenuLink_EditForm = '';
        //Data Tables Script Here.
        var selector = $('#ManageTenants');
        var url = "{{base_url()}}admin/hrsTenants/listTenants_DT/";
        var aoColumns =  [
            /* Tenant ID */   {
                "bVisible":    false,
                "bSortable":   false,
                "bSearchable": false
            },
            /* Full Name */  null,
            /* Username */  null,
            /* Mobile */  null,
            /* CNIC */  null,
            /* Email */  null,
            /* Actions */  null
        ];
        commonDataTables(selector,url,aoColumns);
        //End Of dataTables Script..


        //Edit Button in DataTables
        $('#ManageTenants').on('click', '.editBtnFunc', function(e){
            e.preventDefault();
            var FormID = $(this).closest('tr').attr('data-id');
            //console.log(FormID);

            $.ajax({
                type:"post",
                url:"",
                dataType:"json",
                success:function(response){
                    if(!($.isEmptyObject(response))){
                        $.each(response,function(key,value){
                            $("#formName").val(value.FormName);
                            $("#formPath").val(value.FormPath);
                            $("#formCIPath").val(value.FormCIPath);
                            if(value.IsMenuLink !=='0'){
                                $("#isMenuLink").parent().parent().removeClass('bootstrap-switch-off');
                                $("#isMenuLink").parent().parent().addClass('bootstrap-switch-on');
                            }
                            else{
                                $("#isMenuLink").parent().parent().removeClass('bootstrap-switch-on');
                                $("#isMenuLink").parent().parent().addClass('bootstrap-switch-off');
                            }
                        });
                    }
                    $("#formID").val(FormID);
                }
            }); //---  End of $.ajax  ---//

        });

        //Delete Button in DataTables
        $('#ManageTenants').on('click', '.deleteBtnFunc', function(e){
            e.preventDefault();
            var TenantID = $(this).closest('tr').attr('data-id');
            //console.log(FormID);
            var data = {
               TID  : TenantID
            };
            $.ajax({
                type:"post",
                url:"{{base_url()}}admin/hrsTenants/deleteTenant/",
                data:data,
                success: function(output){
                    var data = output.split("::");
                    if (data[0] == "OK"){
                        $('#ManageTenants').dataTable().fnReloadAjax();
                        oTable.fnReloadAjax();
                        HRS.notification(data[1],data[2]);
                    }
                    else if(data[0] == "FAIL"){
                        HRS.notification(data[1],data[2]);
                    }
                }
            }); //---  End of $.ajax  ---//
        });


        //update Button on Edit Modal
        $('#updateFormBtn').on('click', function(e){
            e.preventDefault();
            var formData = {
                FormID :     $("#formID").val(),
                FormName :   $("#formName").val(),
                FormPath :   $("#formPath").val(),
                FormCIPath : $("#formCIPath").val(),
                IsMenuLink: isMenuLink_EditForm

            };
            $.ajax({
                type: "post",
                url: "{{base_url()}}admin/configurations/UpdateFormData/",
                data: formData,
                success: function (output) {
                    var data = output.split('::');
                    if (data[0] == "OK") {
                        oTable.fnReloadAjax();
                        HRS.notification(data[1], data[2]);
                    }
                    else if (data[0] == "FAIL") {
                        HRS.notification(data[1], data[2]);
                    }
                }
            });
            //console.log(FormName);
        });

        //BootStrap Switch for Selection of Type of Creating New Tenant.
        $('#addNewTenantModal').on('click','#getCreateTenantType',function(e){
            var NewTenantExistingUser = $('#NewTenantExistingUser');
            var NewTenantNewUser = $('#NewTenantNewUser');

            var NewTenantNewUserState = NewTenantNewUser.bootstrapSwitch('state');
            var NewTenantExistingUserState = NewTenantExistingUser.bootstrapSwitch('state');
/*            console.log('NewTenantExistingUser state is :' + NewTenantExistingUserState);
            console.log('NewTenantNewUser state is :' + NewTenantNewUserState);*/
            if(NewTenantExistingUserState === NewTenantNewUserState){
                HRS.notification('You Must Choose One From Radio Switches', 'warning');
            }
            else if(!(NewTenantExistingUserState === NewTenantNewUserState) && NewTenantExistingUserState === true){
                $('#addNewTenantModal').modal('hide');
                $('#NewTenantExistingUserModal').modal('show');

            }
            else if(!(NewTenantExistingUserState === NewTenantNewUserState) && NewTenantNewUserState === true){
                window.location = "{{url}}admin/hrsTenants/CreateNewTenant";
            }
        });
        $('#bacToCreateTenantType').on('click',function(e){
            $('#addNewTenantModal').modal('show');
        });

        //Coding For 1st Option(Creating Tenant From Existing User) Modal.
        //Data Tables Script To Select User for Creating New Tenant Here.
        var selector = $('#ShowUsersWithNoTenantsRecord');
        var url = "{{base_url()}}admin/hrsTenants/listUsersNoTenants_DT/";
        var aoColumns =  [
            /* User ID */   {
                "bVisible":    false,
                "bSortable":   false,
                "bSearchable": false
            },
            /* Full Name */  null,
            /* Username */  null,
            /* CNIC */  null
        ];
        commonDataTables(selector,url,aoColumns);
        //End Of dataTables Script..
        selector.on('click','tr',function (event) {
            $(oTable.fnSettings().aoData).each(function () {
                $(this.nTr).removeClass('row_selected');
            });
            $(event.target.parentNode).addClass('row_selected');
            $('#CreateTenant').removeAttr('disabled');
            var userID = $(this).attr('data-id');
            $('#CreateTenant').attr('data-user',userID);

        });
        $('#CreateTenant').on('click',function(e){
            var userID = $(this).attr('data-user');
            var data = {
                UID: userID
            };
            $.ajax({
                type: "post",
                url: "{{base_url()}}admin/hrsTenants/createTenantFromExistingUser/",
                data: data,
                success: function (output) {
                    var data = output.split('::');
                    if (data[0] == "OK") {
                        oTable.fnReloadAjax();
                        $('#ManageTenants').dataTable().fnReloadAjax();
                        HRS.notification(data[1], data[2]);
                    }
                    else if (data[0] == "FAIL") {
                        HRS.notification(data[1], data[2]);
                    }
                }
            });
        });

//        We need to see the Details for the Seletected Tenants, Following Function should Take us to the Tenant Details Page.
    $('#ManageTenants').on('click','.detailsBtnFunc', function (e) {
        e.preventDefault();
        var TenantID = $(this).closest('tr').attr('data-id');
        window.location = "{{url}}admin/hrsTenants/Details/"+TenantID;
    });
    });
    </script>
{{/block}}