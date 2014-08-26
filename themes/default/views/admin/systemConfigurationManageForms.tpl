{{extends file='adminLayout.tpl'}}
{{block name="header"}}
    <title>Manage Forms</title>
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
                            <th>Form ID</th>
                            <th data-class="expand">Form Name</th>
                            <th data-hide="phone">Form Path</th>
                            <th data-hide="phone,tablet">Form CI Path</th>
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

    {{*Add New Form modal*}}
<div id="addNewFormModal" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title"><i style='color: #666666' class='fa fa-edit fa-fw fa-1x'></i>Edit</h4>
                </div>
                <div class="modal-body">
                    <div class="body collapse in" id="div-1">
                            <form class="form-horizontal" id="block-validate">
                                <div class="form-group">
                                    <label class="control-label col-lg-4" for="cMenuName">Menu Name</label>
                                    <div class="col-lg-8">
                                        <input type="text" class="form-control required" name="menuName" placeholder="Menu Name" id="cMenuName">
                                    </div>
                                </div><!-- /.form-group -->
                                <div class="form-group">
                                    <label class="control-label col-lg-4" for="cFormName">Form Name</label>
                                    <div class="col-lg-8">
                                        <input type="text" class="form-control required" name="formName" placeholder="Form Name" id="cFormName">
                                    </div>
                                </div><!-- /.form-group -->
                                <div class="form-group">
                                    <label class="control-label col-lg-4" for="cFormPath">Form Path</label>
                                    <div class="col-lg-8">
                                        <input type="text" class="form-control required" name="formPath" placeholder="Form Path" id="cFormPath">
                                    </div>
                                </div><!-- /.form-group -->
                                <div class="form-group">
                                    <label class="control-label col-lg-4">Form CI Path</label>
                                    <div class="col-lg-8">
                                        <input type="text" class="form-control required" name="formCIPath" placeholder="Form CI Path" id="cFormCIPath">
                                    </div>
                                </div><!-- /.form-group -->

                                <div class="form-group" id="selectTab_MainDiv">
                                    <label class="control-label col-lg-4">Select Tab</label>
                                    <div class="col-lg-8" id="selectTabName">
                                        <input type='hidden' class="required" name='selectTab' id='selectTab'/>
                                    </div>
                                </div><!-- /.form-group -->

                                <div class="form-group">
                                    <label class="control-label col-lg-4">Have Parent</label>
                                    <div class="col-lg-8" id="haveParentDiv">
                                        <input class="make-switch" id="haveParent" type="checkbox" data-on-color="success" data-on-text="Yes" data-off-text="NO" data-off-color="danger" disabled>
                                    </div>
                                </div><!-- /.row --><!-- /.row -->

                                <div class="form-group" id="selectParentMenu_MainDiv" style="display: none">
                                    <label class="control-label col-lg-4">Parent Form</label>
                                    <div class="col-lg-8" id="selectParentMenuDiv">
                                        <input type='hidden' name='input' id='selectParentMenu'/>
                                    </div>
                                </div>

                                <div class="form-group" id="selectTab_MainDiv">
                                    <label class="control-label col-lg-4">Menu Order</label>
                                    <div class="col-lg-8" id="selectMenuOrder">
                                        <select class="commonGeneralSelect2 required" name="selectMenuOrder">
                                            <option></option>
                                            <option value="1">1</option>
                                            <option value="2">2</option>
                                            <option value="3">3</option>
                                            <option value="4">4</option>
                                            <option value="5">5</option>
                                            <option value="6">6</option>
                                            <option value="7">7</option>
                                            <option value="8">8</option>
                                            <option value="9">9</option>
                                            <option value="10">10</option>
                                        </select>
                                    </div>
                                </div><!-- /.form-group -->

                                <div class="form-group">
                                    <label class="control-label col-lg-4">Show on Menu</label>
                                    <div class="col-lg-8" id="isMenuLink_createSwitchDiv">
                                        <input class="make-switch" id="isMenuLink_createSwitch" type="checkbox" data-on-color="success" data-on-text="Yes" data-off-text="NO" data-off-color="danger">
                                    </div>
                                </div><!-- /.row --><!-- /.row -->
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
            var selector = $('#ManageForms');
            var url = "{{base_url()}}admin/configurations/listForms_DT/";
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


            //Edit Button on Modal Window
            $('#ManageForms').on('click', '.editBtnFunc', function(e){
                e.preventDefault();
                var FormID = $(this).closest('tr').attr('data-id');
                //console.log(FormID);

                $.ajax({
                    type:"post",
                    url:"{{base_url()}}admin/configurations/GetFormData/"+FormID,
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
            //Edit Button
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
                   type:"post",
                   url:"{{base_url()}}admin/configurations/UpdateFormData/",
                   data: formData,
                    success: function(output){
                           if (output == true){
                               oTable.fnReloadAjax();
                    }
                }
                });
                //console.log(FormName);
            });

            $('#createFormBtn').on('click', function(e){
                e.stopImmediatePropagation();
                e.preventDefault();
                if($('#block-validate').valid()){
                    if(isMenuLink_createForm!='' && isMenuLink_createForm!=0){
                        var parentMenuID = $('#selectParentMenu').val();
                    }else{
                        var parentMenuID = '';
                    }
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

//            show the parent dropdown if the have parent switch is ON
            $("#haveParentDiv div.bootstrap-switch").on('click', function(e){
                if($(this).hasClass('bootstrap-switch-on')){
                   $('#selectParentMenu_MainDiv').css('display','block');
                   $('#selectParentMenuDiv input#selectParentMenu').addClass('required');
                   $('#selectParentMenuDiv div.select2-container').addClass('required');
                   $('#selectParentMenuDiv div.select2-container').attr('aria-required','true');
                   $('#selectParentMenuDiv input#selectParentMenu').attr('name','selectParentMenu');

                }
                else if($(this).hasClass('bootstrap-switch-off')){
                   $('#selectParentMenu_MainDiv').css('display','none');
                    $('#selectParentMenuDiv input#selectParentMenu').removeClass('required');
                    //$('#selectParentMenuDiv input#selectParentMenu').removeAttr('name');
                }
                //console.log('just a test if switch is ON or OFF');
            });

//            this will load the select dropdowns styles
            $("#addNewFormFunc").on('click', function(e){
                $('.select2-container').css("width","100%");
            });

 /*-----------------selectors of the Page-----------------------*/
            {{*The Selector for Selecting the Parent Menu*}}
            var selector = $('#selectTab');
            var url = "{{base_url()}}admin/configurations/loadAllTabNames/";
            var id = "TabID";
            var text = "TabName";
            var minInputLength = 0;
            var placeholder = "Select Tab";
            commonSelect2(selector,url,id,text,minInputLength,placeholder);

            {{*The Selector for Selecting the Parent Menu*}}
            $('#selectTab').on("select2-selecting", function(e) {

//                Run the other dropdown if first dropdown value is selected or changed
                var TabID = e.val;
                //console.log(TabID);
                var selector = $('#selectParentMenu');
                var url = "{{base_url()}}admin/configurations/loadAllParentFormNames/"+TabID;
                var id = "FormID";
                var text = "FormName";
                var minInputLength = 0;
                var placeholder = "Select Parent Menu";
                commonSelect2(selector,url,id,text,minInputLength,placeholder);
            });

 /*-----------------selectors of the Page-----------------------*/

            $("#isMenuLink_createSwitchDiv div.bootstrap-switch, #isMenuLinkDiv div.bootstrap-switch").on('click', function(e){
                if($(this).hasClass('bootstrap-switch-on')){
                    isMenuLink_createForm = 1;
                    isMenuLink_EditForm = 1;

                } else if($(this).hasClass('bootstrap-switch-off')) {
                    isMenuLink_createForm = 0;
                    isMenuLink_EditForm = 0;
                }
            });

            $('#selectTab').on("select2-selecting", function(e) {
                $('#haveParent').bootstrapSwitch('disabled', false);
            });
        });
    </script>
{{/block}}