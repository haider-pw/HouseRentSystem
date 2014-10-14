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


{{*Edit Button Modal*}}
    <div id="editBtnModal" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title"><i style='color: #666666' class='fa fa-edit fa-fw fa-1x'></i>Edit</h4>
                </div>
                <div class="modal-body">

                    <div class="body collapse in" id="div-1">
                        <form class="form-horizontal">
                            <input type="hidden" id="formID">
                            <div class="form-group">
                                <label class="control-label col-lg-4" for="text1">Form Name</label>
                                <div class="col-lg-8">
                                    <input type="text" class="form-control" placeholder="Form Name" id="formName">
                                </div>
                            </div><!-- /.form-group -->
                            <div class="form-group">
                                <label class="control-label col-lg-4" for="pass1">Form Path</label>
                                <div class="col-lg-8">
                                    <input type="text" data-placement="top" placeholder="Form Path" id="formPath" class="form-control">
                                </div>
                            </div><!-- /.form-group -->
                            <div class="form-group">
                                <label class="control-label col-lg-4">Form CI Path</label>
                                <div class="col-lg-8">
                                    <input type="text" class="form-control" id="formCIPath" placeholder="Form CI Path">
                                </div>
                            </div><!-- /.form-group -->

                            <div class="form-group">
                                <label class="control-label col-lg-4">Show on Menu</label>
                                <div class="col-lg-8" id="isMenuLinkDiv">
                                    <input class="make-switch" id="isMenuLink" type="checkbox" data-on-color="success" data-on-text="Yes" data-off-text="NO" data-off-color="danger">
                                </div>
                            </div><!-- /.row --><!-- /.row -->

                        </form>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" id="updateFormBtn" data-dismiss="modal">Update</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
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
                    Create New Tenant from Existing User or Create New User for New Tenant
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" id="getCreateTenantType">Next</button>
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

            $.ajax({
                type:"post",
                url:"",
                success: function(output){
                    var data = output.split("::");
                    if (data[0] == "OK"){
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
    });
    </script>
{{/block}}