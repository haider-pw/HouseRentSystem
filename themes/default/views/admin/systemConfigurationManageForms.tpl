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
                            <th>Form Name</th>
                            <th>Form Path</th>
                            <th>Form CI Path</th>
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
                                    <div class="col-lg-8" id="selectParentMenu">
                                        <select data-placeholder="Select Parent Menu" class="chzn-select-deselect">
                                            <option value=""></option>
                                            <option>American Black Bear</option>
                                            <option>Asiatic Black Bear</option>
                                            <option>Brown Bear</option>
                                            <option>Giant Panda</option>
                                            <option>Sloth Bear</option>
                                            <option>Sun Bear</option>
                                            <option>Polar Bear</option>
                                            <option>Spectacled Bear</option>
                                        </select>
                                    </div>
                                </div>

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
    {{*-------------------Modals Finished--------------*}}

{{/block}}
{{block name="scripts"}}
    {{js('datatables/fnReloadAjax.js')}}
    <script>
        $(document).ready(function() {
            var oTable =  $('#ManageForms').dataTable({
                 "aoColumns": [
                     /* ID */   {
                         "bVisible":    false,
                         "bSortable":   false,
                         "bSearchable": false
                     },
                     /* Form Name */  null,
                     /* Form Path */  null,
                     /* Form CI Path */  null,
                     /* Actions */  null
                 ],

                "bServerSide":true,
                "bProcessing":true,
                "bJQueryUI": true,
                "sPaginationType": "full_numbers",
                //"bFilter":true,
                //"sServerMethod": "POST",
                "sAjaxSource": "{{base_url()}}admin/configurations/listForms_DT/",
                "iDisplayLength": 25,
                "aLengthMenu": [[2, 25, 50, -1], [2, 25, 50, "All"]],
                /*"sEcho": 1,
                "columns":[
                    {data:"FormName"},
                    {data:"FormPath"},
                    {data:"FormCIPath"},
                    { "data": null,
                        "defaultContent": "<a href='#editBtnModal' class='editBtnFunc' ><i style='color: #666666' class='fa fa-pencil fa-fw fa-2x'></i></a><a href='#' id='deleteBtn'><i style='color: #ff0000' class='fa fa-times fa-fw fa-2x'></i></a>",
                        "targets": -1
                    }
                ],*/
                'fnServerData'   : function(sSource, aoData, fnCallback){
                    $.ajax ({
                        'dataType': 'json',
                        'type'    : 'POST',
                        'url'     : sSource,
                        'data'    : aoData,
                        'success' : fnCallback
                    }); //end of ajax
                },
                'fnRowCallback': function(nRow, aData, iDisplayIndex, iDisplayIndexFull) {
                    $(nRow).attr("data-id",aData[0]);
                    return nRow;
                }
            });

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
                //$('#selectParentMenu div.chosen-container').removeAttr('style');
                $('#selectParentMenu div.chosen-container').css("width","100%");
            });



        });




    </script>
{{/block}}