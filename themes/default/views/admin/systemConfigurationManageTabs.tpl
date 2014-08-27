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
                            <div style="float:right; margin-right:10px; margin-top: 5px;"><a title="" id="addNewTabFunc" data-original-title="" href="#addNewTabBtnModal_ManageTabs" data-toggle="modal" class="btn btn-metis-5 btn-sm btn-grad btn-rect">Add New Form</a></div>
                        </header>
                        <div class="body" id="collapse4">
                            <table id="ManageTabs" class="table table-bordered table-condensed table-hover table-striped">
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

 {{*Edit Button Modal*}}
    <div id="editBtnModal_ManageTabs" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title"><i style='color: #666666' class='fa fa-edit fa-fw fa-1x'></i>Edit</h4>
                </div>
                <div class="modal-body">

                    <div class="body collapse in" id="div-1">
                        <form class="form-horizontal">
                            <input type="hidden" id="tabID"> {{*This field is for hidden ID, as HiddenID will be needed to update the form*}}
                            <div class="form-group">
                                <label class="control-label col-lg-4" for="text1">Tab Name</label>
                                <div class="col-lg-8">
                                    <input type="text" class="form-control" placeholder="Tab Name" id="tabName">
                                </div>
                            </div><!-- /.form-group -->
                            <div class="form-group">
                                <label class="control-label col-lg-4" for="pass1">Tab Order</label>
                                <div class="col-lg-8">
                                    <input type="text" data-placement="top" placeholder="Form Path" id="tabOrder" class="form-control">
                                </div>
                            </div><!-- /.form-group -->
                            <div class="form-group">
                                <label class="control-label col-lg-4">Tab Desc</label>
                                <div class="col-lg-8">
                                    <textarea class="form-control" id="tabDesc" placeholder="Form CI Path"></textarea>
                                </div>
                            </div><!-- /.form-group -->
                        </form>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" id="updateTabBtn" data-dismiss="modal">Update</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal --><!-- /#Edit Button Modal -->

    {{*Create New Tab Button Modal*}}
    <div id="addNewTabBtnModal_ManageTabs" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title"><i style='color: #666666' class='fa fa-edit fa-fw fa-1x'></i>Edit</h4>
                </div>
                <div class="modal-body">

                    <div class="body collapse in" id="div-1">
                        <form class="form-horizontal">
                            <input type="hidden" id="tabID"> {{*This field is for hidden ID, as HiddenID will be needed to update the form*}}
                            <div class="form-group">
                                <label class="control-label col-lg-4" for="text1">Tab Name</label>
                                <div class="col-lg-8">
                                    <input type="text" class="form-control" placeholder="Tab Name" id="cTabName">
                                </div>
                            </div><!-- /.form-group -->
                            <div class="form-group">
                                <label class="control-label col-lg-4" for="pass1">Tab Order</label>
                                <div class="col-lg-8">
                                    <input type="text" data-placement="top" placeholder="Form Path" id="cTabOrder" class="form-control">
                                </div>
                            </div><!-- /.form-group -->
                            <div class="form-group">
                                <label class="control-label col-lg-4">Tab Desc</label>
                                <div class="col-lg-8">
                                    <textarea class="form-control" id="cTabDesc" placeholder="Form CI Path"></textarea>
                                </div>
                            </div><!-- /.form-group -->
                        </form>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" id="createTabBtn" data-dismiss="modal">Create</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal --><!-- /#Create New Tab Button Modal -->

{{/block}}
{{block name="scripts"}}
    <script>
        $(document).ready(function(e){
            //Data Tables Script Here.
            var selector = $('#ManageTabs');
            var url = "{{base_url()}}admin/configurations/listTabs_DT/";
            var aoColumns =  [
                /* ID */   {
                    "bVisible":    false,
                    "bSortable":   false,
                    "bSearchable": false
                },
                /* Tab Name */  null,
                /* Tab Order */  null,
                /* Tab Desc */  null,
                /* Actions */  null
            ];
            commonDataTables(selector,url,aoColumns);
            //End Of dataTables Script..

    {{* ------------------Code Related to Edit/Update Modal----------------------- *}}
            //Edit Button in DataTables
            $('#ManageTabs').on('click', '.editBtnFunc_ManageTabs', function(e){
                e.preventDefault();
                var tabID = $(this).closest('tr').attr('data-id');
                //console.log(FormID);

                $.ajax({
                    type:"post",
                    url:"{{base_url()}}admin/configurations/GetTabData/"+tabID,
                    dataType:"json",
                    success:function(response){
                        if(!($.isEmptyObject(response))){
                            $.each(response,function(key,value){
                                $("#tabName").val(value.TabName);
                                $("#tabOrder").val(value.TabOrder);
                                $("#tabDesc").val(value.TabDesc);
                            });
                        }
                        $("#tabID").val(tabID);
                    }
                }); //---  End of $.ajax  ---//
            });

            //Update Button in the Edit/Update Modal.
            $('#updateTabBtn').on('click', function(e){
                e.preventDefault();
                var formData = {
                    TabID :     $("#tabID").val(),
                    TabName :   $("#tabName").val(),
                    TabOrder :   $("#tabOrder").val(),
                    TabDesc : $("#tabDesc").val()
                };
                $.ajax({
                    type:"post",
                    url:"{{base_url()}}admin/configurations/UpdateTabData/",
                    data: formData,
                    success: function(output){
                        if (output == true){
                            oTable.fnReloadAjax();
                        }
                    }
                });
                //console.log(FormName);
            });
   {{* ------------------End of Code Related to Edit/Update Modal----------------------- *}}


  {{* ------------------Code Related to Create new Tab Modal----------------------- *}}
            $("#addNewTabFunc").on('click', function(e){
                //$('.select2-container').css("width","100%");
            });

            $('#updateTabBtn').on('click', function(e){
                e.stopImmediatePropagation();
                e.preventDefault();
                if($('#block-validate').valid()){
                    var formData = {
                        MenuName : $("#cMenuName").val(),
                        FormName : $("#cFormName").val(),
                        FormPath :   $("#cFormPath").val(),
                        FormCIPath : $("#cFormCIPath").val(),
                        TabID : $('#selectTab').val(),
                        ParentMenuID : parentMenuID,
                        MenuOrder : $('#selectMenuOrder div.select2-container a.select2-choice span.select2-chosen').text(),
                        IsMenuLink : isMenuLink_createForm
                    };
                    $.ajax({
                        type:"post",
                        url:"{{base_url()}}admin/configurations/addNewForm/",
                        data: formData/*,
                         success: function(output){
                         if (output == true){
                         oTable.fnReloadAjax();
                         }
                         }*/
                    });

                    //Do Stuff After pressing the Create Button.
//                    Close the Modal
                    $('#addNewFormModal').modal('hide');
//                    Reset All the TextBoxes and CheckBoxes
                    $("#block-validate")[0].reset();
//                    Reset/Empty All the Select2 Dropdowns
                    jQuery('.select2-offscreen').select2('val', '');
                    //$("#selectTab, #selectParentMenu, .commonGeneralSelect2").select2("val", "");
//                    Remove/Hide the Parent DropDown As Everything is gonna Rest
                    $('#selectParentMenu_MainDiv').css('display','none');
                    $('#selectParentMenuDiv input#selectParentMenu').removeClass('required');
                }
                else{
                    //The Else Portion if you want Something else to Happen if not validated Form
                }
            });


            {{* ------------------End of Code Related to Create new Tab Modal----------------------- *}}
        });
    </script>
+{{/block}}