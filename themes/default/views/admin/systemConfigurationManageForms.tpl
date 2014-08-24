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

                        <div class="body collapse in" id="div-1" style="">
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
                                    <div class="col-lg-8">
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
                    <div class="body collapse in" id="div-1" style="">
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
                                    <label class="control-label col-lg-4">Have Parent</label>
                                    <div class="col-lg-8" id="haveParentDiv">
                                        <input class="make-switch" id="haveParent" type="checkbox" data-on-color="success" data-on-text="Yes" data-off-text="NO" data-off-color="danger">
                                    </div>
                                </div><!-- /.row --><!-- /.row -->

                                <div class="form-group" id="selectParentMenu_MainDiv" style="display: none">
                                    <label class="control-label col-lg-4">Parent Form</label>
                                    <div class="col-lg-8">
                                        <input type='hidden' name='input' id='selectParentMenu'/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-lg-4">Show on Menu</label>
                                    <div class="col-lg-8" id="isMenuLink_createSwitchDiv">
                                        <input class="make-switch" id="isMenuLink_createSwitch" type="checkbox" data-on-color="success" data-on-text="Yes" data-off-text="NO" data-off-color="danger">
                                    </div>
                                </div><!-- /.row --><!-- /.row -->

                            </form>
                        </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" id="createFormBtn" data-dismiss="modal">Create</button>
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
        $(document).ready(function() {
            var isMenuLink_createForm = 1;
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
                FormCIPath : $("#formCIPath").val()
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
                e.preventDefault();
                var formData = {
                    FormName : $("#formName").val(),
                    FormPath :   $("#formPath").val(),
                    FormCIPath : $("#formCIPath").val(),
                    IsMenuLink : isMenuLink_createForm
                }
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

            });

            $("#haveParentDiv div.bootstrap-switch").on('click', function(e){
                if($(this).hasClass('bootstrap-switch-on')){
                   $('#selectParentMenu_MainDiv').css('display','block');
                }
                else if($(this).hasClass('bootstrap-switch-off')){
                   $('#selectParentMenu_MainDiv').css('display','none');
                }
                //console.log('just a test if switch is ON or OFF');
            });

//            this will load the select dropdowns styles
            $("#addNewFormFunc").on('click', function(e){
                $('.select2-container').css("width","100%");
            });

            $('#selectParentMenu').select2({
               minimumInputLength:1,
               placeholder:"Select Parent Menu",
                ajax: {
                    type:"post",
                    url: "{{base_url()}}admin/configurations/loadAllParentFormNames/",
                    dataType: 'json',
                    quietMillis: 100,
                    data: function(term, page) {
                        return {
                            term: term, //search term
                            page_limit: 10 // page size
                        };
                    },
                    results: function(data, page ) {
                        var newData = [];
/*                        for ( var i = 0; i < data.length; i++ ) {
                            newData.push({
                                id: data[i].FormID,  //id part present in data
                                text: data[i].FormName  //string to be displayed
                            });

                        }*/

                        $.each(data, function (index,value) {
                            newData.push({
                                id: value.FormID,  //id part present in data
                                text: value.FormName  //string to be displayed
                            });
                        });

/*                        _.each(data, function (item) {
                            newData.push({
                                id: item.FormID,  //id part present in data
                                text: item.FormName  //string to be displayed
                            });
                        });*/
                        return { results: newData };
                    }

                }
            });

            $("#isMenuLink_createSwitchDiv div.bootstrap-switch").on('click', function(e){
                if($(this).hasClass('bootstrap-switch-on')){
                    isMenuLink_createForm = 1;
                } else if($(this).hasClass('bootstrap-switch-off')) {
                    isMenuLink_createForm = 0;
                }
            });



        });




    </script>
{{/block}}