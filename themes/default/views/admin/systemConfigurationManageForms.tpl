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

{{/block}}
{{block name="scripts"}}
    <script>
        $(document).ready(function() {
            $('#ManageForms').dataTable({

                "serverSide":true,
                "bProcessing":true,
                "sServerMethod": "POST",
                "sAjaxSource": "{{base_url()}}admin/configurations/listForms_DT/",
                "iDisplayLength": 10,
                "aLengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
                "sEcho": 1,
                "columns":[
                    {data:"FormName"},
                    {data:"FormPath"},
                    {data:"FormCIPath"},
                    { "data": null,
                        "defaultContent": "<button>Edit</button>",
                        "targets": -1
                    }
                ],
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
        } );
    </script>
{{/block}}