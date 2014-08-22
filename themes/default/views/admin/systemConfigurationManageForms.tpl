{{extends file='adminLayout.tpl'}}
{{block name="header"}}
    <title>Manage Forms</title>
{{/block}}
{{block name="content"}}
    <div class="outer">
        <div class="inner">


            <div class="row ui-sortable">
                <div class="col-lg-12">
                    <div class="box">
                        <header>
                            <div class="icons">
                                <i class="fa fa-table"></i>
                            </div>
                            <h5>Manage Forms</h5>
                        </header>
                        <div class="body" id="collapse4">
                        <table id="ManageForms" class="table table-bordered table-condensed table-hover table-striped">
                        <thead>
                        <tr>
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
                                        <input class="make-switch" type="checkbox" data-on-color="success" data-on-text="Yes" data-off-text="NO" data-off-color="danger" checked>
                                    </div>
                                </div><!-- /.row --><!-- /.row -->

                            </form>
                        </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Update</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal --><!-- /#helpModal -->
{{/block}}
{{block name="scripts"}}
    <script>
        $(document).ready(function() {
            var oTable = $('#ManageForms').dataTable({

                "bServerSide":true,
                "bProcessing":true,
                "bJQueryUI": true,
                "sPaginationType": "full_numbers",
                //"bFilter":true,
                //"sServerMethod": "POST",
                "sAjaxSource": "{{base_url()}}admin/configurations/listForms_DT/",
                "iDisplayLength": 2,
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
                }
            });

            //Edit Button on Modal Window
            $('#ManageForms').on('click', '.editBtnFunc', function(e){
                e.preventDefault();
                //var aPos = oTable.fnGetPosition( this );
                //var aData = oTable.fnGetData( aPos[0] );
                console.log(oTable);
            });
            //Edit Button
        } );


    </script>
{{/block}}