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
                            <h5>Manage Groups</h5>
                            <div style="float:right; margin-right:10px; margin-top: 5px;"><a title="" id="addNewGroupFunc" data-original-title="" href="#addNewGroupModal" data-toggle="modal" class="btn btn-metis-5 btn-sm btn-grad btn-rect">Add New Group</a></div>
                        </header>
                        <div class="body" id="collapse4">
                            <table id="ManageGroups" class="table table-bordered table-condensed table-hover table-striped">
                                <thead>
                                <tr>
                                    <th>Group ID</th>
                                    <th data-class="expand">Group Name</th>
                                    <th data-hide="phone">Group Desc</th>
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
                            <input type="hidden" id="groupID">
                            <div class="form-group">
                                <label class="control-label col-lg-4" for="groupName">Group Name</label>
                                <div class="col-lg-8">
                                    <input type="text" class="form-control" name="groupName" placeholder="Group Name" id="groupName">
                                </div>
                            </div><!-- /.form-group -->
                            <div class="form-group">
                                <label class="control-label col-lg-4" for="groupDesc">Group Description</label>
                                <div class="col-lg-8">
                                    <input type="text" data-placement="top" placeholder="Form Path" id="groupDesc" class="form-control">
                                </div>
                            </div><!-- /.form-group -->
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

{{*Add New Group modal*}}
    <div id="addNewGroupModal" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title"><i style='color: #666666' class='fa fa-edit fa-fw fa-1x'></i>Edit</h4>
                </div>
                <div class="modal-body">
                    <div class="body collapse in" id="div-1">
                        <form class="form-horizontal" id="createGroupModelForm">
                            <div class="form-group">
                                <label class="control-label col-lg-4" for="cGroupName">Group Name</label>
                                <div class="col-lg-8">
                                    <input type="text" class="form-control required" name="groupName" placeholder="Group Name" id="cGroupName">
                                </div>
                            </div><!-- /.form-group -->
                            <div class="form-group">
                                <label class="control-label col-lg-4" for="cGroupDesc">Group Description</label>
                                <div class="col-lg-8">
                                    <input type="text" class="form-control required" name="groupDesc" placeholder="Describe Group" id="cGroupDesc">
                                </div>
                            </div><!-- /.form-group -->
                            {{*<input type="submit" value="Validate" class="btn btn-primary">*}}
                        </form>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" id="createFormBtn">Create</button>
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
        var selector = $('#ManageGroups');
        var url = "{{base_url()}}admin/usersManageUsers/listGroups_DT/";
        var aoColumns =  [
            /* ID */   {
                "bVisible":    false,
                "bSortable":   false,
                "bSearchable": false
            },
            /* Group Name */  null,
            /* Group Desc */  null,
            /* Actions */  null
        ];
        commonDataTables(selector,url,aoColumns);
        //End Of dataTables Script..


        //Edit Button in DataTables
        $('#ManageGroups').on('click', '.editBtnFunc', function(e){
            e.preventDefault();
            var GroupID = $(this).closest('tr').attr('data-id');
            //console.log(FormID);

            $.ajax({
                type:"post",
                url:"{{base_url()}}admin/usersManageUsers/GetGroupData/"+GroupID,
                dataType:"json",
                success:function(response){
                    if(!($.isEmptyObject(response))){
                        $.each(response,function(key,value){
                            $("#formName").val(value.GroupName);
                            $("#formPath").val(value.GroupDesc);
                        });
                    }
                    $("#groupID").val(GroupID);
                }
            }); //---  End of $.ajax  ---//

        });

        //Delete Button in DataTables
        $('#ManageGroups').on('click', '.deleteBtnFunc', function(e){
            e.preventDefault();
            var GroupID = $(this).closest('tr').attr('data-id');
            //console.log(FormID);

            $.ajax({
                type:"post",
                url:"{{base_url()}}admin/usersManageUsers/deleteGroup/"+GroupID,
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
        //Edit Button
        $('#updateFormBtn').on('click', function(e){
            e.preventDefault();
            var formData = {
                GroupID :     $("#groupID").val(),
                GroupName :   $("#groupName").val(),
                GroupDesc :   $("#groupDesc").val()
            };
            $.ajax({
                type: "post",
                url: "{{base_url()}}admin/configurations/UpdateGroupData/",
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

        $('#createFormBtn').on('click', function(e){
            e.stopImmediatePropagation();
            e.preventDefault();
            var selector = $('#createGroupModelForm');
            HRS.formValidation(selector);
            if(selector.valid()){
                var formData = {
                    GroupName : $("#cGroupName").val(),
                    GroupDesc : $("#cGroupDesc").val()
                };
                $.ajax({
                    type: "post",
                    url: "{{base_url()}}admin/usersManageUsers/addNewGroup/",
                    data: formData,
                    success: function (output) {
                        var data = output.split("::");
                        if (data[0] == "OK") {
                            oTable.fnReloadAjax();
                            HRS.notification(data[1], data[2]);
                        }
                        else if(data[0]=="FAIL") {
                            HRS.notification(data[1], data[2]);
                        }
                    }
                });

                //Do Stuff After pressing the Create Button.
//                    Close the Modal
                $('#addNewGroupModal').modal('hide');
//                    Reset All the TextBoxes and CheckBoxes
                $("#createGroupModelForm")[0].reset();
            }
            else{
                //The Else Portion if you want Something else to Happen if not validated Form
            }
        });
    });
    </script>
{{/block}}