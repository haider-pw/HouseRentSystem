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
                            <div style="float:right; margin-right:10px; margin-top: 5px;">
                                {{*Select2 DropDown to select the Group*}}
                                <input type='hidden' name='selectGroup' id='selectGroup'/>
                            </div>
                        </header>
                        <div class="body" id="collapse4">
                            <table id="ManageFormsInGroups" class="table table-bordered table-condensed table-hover table-striped">
                                <thead>
                                <tr>
                                    <th>Form ID</th>
                                    <th data-class="expand">Form Name</th>
                                    <th data-hide="phone">Form CI Path</th>
                                    <th data-hide="phone">Show On Menu</th>
                                    <th data-hide="phone">GroupIDs</th>
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
                    <h4 class="modal-title"><i style='color: #666666' class='fa fa-edit fa-fw fa-1x'></i>Edit Group</h4>
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
                                    <input type="text" data-placement="top" placeholder="Group Description" id="groupDesc" class="form-control">
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
                    <h4 class="modal-title"><i style='color: #666666' class='fa fa-edit fa-fw fa-1x'></i>Create New Group</h4>
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

            {{*The Selector for Selecting the User Group*}}
            var selector = $('#selectGroup');
            var url = "{{base_url()}}admin/usersManageUsers/loadAllUserGroups/";
            var id = "GroupID";
            var text = "GroupName";
            var minInputLength = 0;
            var placeholder = "Select User Group";
            commonSelect2(selector,url,id,text,minInputLength,placeholder);
            $('.select2-container').css("width","223px");
            //End of the CommonSelect2 function


            //Data Tables Script Here.
            var selector = $('#ManageFormsInGroups');
            var url = "{{base_url()}}admin/usersManagePermissions/listFormsInGroups_DT/0";
            var aoColumns =  [
                /* ID */   {
                    "bVisible":    false,
                    "bSortable":   false,
                    "bSearchable": false
                },
                /* Form Name */  null,
                /* Form CI Path */  null,
                /* IsMenuLink */ {
                    "bVisible":    true,
                    "bSortable":   false,
                    "bSearchable": false
                },
                /* GroupIDs */  {
                    "bVisible":    false,
                    "bSortable":   false,
                    "bSearchable": false
                },
                /* Actions */  null
            ];

            var RowCallBack = "var isMainForm=aData[2].split('/');if(aData[2]!='#'){if(isMainForm[2]==='#'){$('td:eq(1)',nRow).css('background-color','#C3FECC')}}" + " $('td:eq(3) input.make-switch', nRow).attr('group-ids',aData[4]);" +
                    "var isMenuLink = aData[3]; if(isMenuLink === '1'){ $('td:eq(2)',nRow).html('<span class=\"label label-success\">Yes</span>'); } else { $('td:eq(2)',nRow).html('<span class=\"label label-danger\">No</span>'); }";
            var DrawCallback = "var GroupID = url.split('/').pop(); $('input.make-switch').each(function(e){ var groups = $(this).attr('group-ids').split(','); if(eval(GroupID) !== 0 && eval(GroupID)>0){ if(eval(GroupID)===1){ $(this).attr('data-checked','true'); $(this).attr('disabled','true'); } else if(eval(GroupID)!==1 && eval(GroupID)>1){ if (groups.length == 1) { $(this).attr('data-checked','false'); }else if (groups.length == 2){ $(this).attr('data-checked','true'); }}} else if(eval(GroupID) === 0){ $(this).attr('data-checked','false'); }}); "+"HRS.checkboxSwitches();" + "$('input.make-switch').on('switchChange.bootstrapSwitch',function(e,t){var n=$(this).closest('tr').attr('data-id');var r={GroupID:GroupID,FormID:n,State:t};$.ajax({url:'http://localhost/projects/HouseRentSystem/admin/usersManagePermissions/insertInToFormInGroups',data:r,type:'POST',success:function(e){var t=e.split('::');if(t[0]=='OK'){oTable.fnReloadAjax();HRS.notification(t[1],t[2])}else if(t[0]=='FAIL'){HRS.notification(t[1],t[2])}}})})";
            commonDataTables(selector,url,aoColumns,RowCallBack,DrawCallback);
            //End Of dataTables Script..

            //Doing Some Function if select2 has selected some item
            $('#selectGroup').on("select2-selecting", function(e) {
                var GroupID = e.val;
                url = "{{base_url()}}admin/usersManagePermissions/listFormsInGroups_DT/"+GroupID;
                //$('#ManageFormsInGroups').dataTable().api().ajax.url(url).load();
                //oTable.fnReloadAjax('google.com');
                oTable.fnDestroy();
                commonDataTables(selector,url,aoColumns,RowCallBack,DrawCallback);
            });
            //End of the CommonSelect2 function

            //update record on switch change
        });
    </script>
{{/block}}