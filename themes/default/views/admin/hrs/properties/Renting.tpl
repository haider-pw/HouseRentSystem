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
                            <h5>Property Renting</h5>
                            <div style="float:right; margin-right:10px; margin-top: 5px;">
                            <input type='hidden' name='selectVacancyType' id='selectVacancyType'/>
                                </div>
                        </header>
                        <div class="body" id="collapse4">
                            <table id="PropertyRenting" class="table table-bordered table-condensed table-hover table-striped">
                                <thead>
                                <tr>
                                    <th>Residential ID</th>
                                    <th>ResTypeID</th>
                                    <th>VacID</th>
                                    <th data-class="expand">Property No.</th>
                                    <th data-hide="phone">TypeName</th>
                                    <th data-hide="phone,tablet">Description</th>
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
{{/block}}
{{block name="scripts"}}
{{js('datatables/fnReloadAjax.js')}}
<script>
    var oTable;
    $(document).ready(function(e){
        oTable = '';
        {{*The Selector for Selecting the User Group*}}
        var selector = $('#selectVacancyType');
        var url = "{{base_url()}}admin/properties/loadAllVacancyTypes/";
        var id = "VacID";
        var text = "TypeName";
        var minInputLength = 0;
        var placeholder = "Select Vacancy Type";
        commonSelect2(selector,url,id,text,minInputLength,placeholder);
        $('.select2-container').css("width","223px");
        //End of the CommonSelect2 function

        //Doing Some Function if select2 has selected some item
        $('#selectVacancyType').on("select2-selecting", function(e) {
            var VacancyType = e.val;
            url = "{{base_url()}}admin/properties/listProperties_DT/"+VacancyType;
            //$('#ManageFormsInGroups').dataTable().api().ajax.url(url).load();
            //oTable.fnReloadAjax('google.com');
            oTable.fnDestroy();
            commonDataTables(selector,url,aoColumns,RowCallBack,DrawCallback);
        });
        //End of the CommonSelect2 function

        //Data Tables Script Here.
        var selector = $('#PropertyRenting');
        var url = "{{base_url()}}admin/properties/listProperties_DT/";
        var aoColumns =  [
            /* ResidentialID */   {
                "bVisible":    false,
                "bSortable":   false,
                "bSearchable": false
            },
            /* Property TypeID/ Residential TypeID */  {
                "bVisible":    false,
                "bSortable":   false,
                "bSearchable": false
            },
            /* Vacancy Type ID */  {
                "bVisible":    false,
                "bSortable":   false,
                "bSearchable": false
            },
            /* Property Number*/  null,
            /* Property Type */ null,
            /* VacancyType */  {
                "bVisible":    true,
                "bSortable":   false,
                "bSearchable": false
            },
            /* Actions */  null
        ];
        var RowCallBack = "";
        var DrawCallback = "";
        commonDataTables(selector,url,aoColumns,RowCallBack,DrawCallback);
        //End Of dataTables Script..
        selector.on('click','.assignTenantToPropertyFunc',function(e){
        var resID = $(this).parents('tr').attr('data-id');
            window.location.replace('{{url}}admin/properties/AssignTenantProperty/'+resID);
        });
        selector.on('click','.removeTenantFromPropertyFunc',function(e){
        var resID = $(this).parents('tr').attr('data-id');
            $.ajax({
               url:"{{url}}admin/properties/removeTenantFromProperty/",
               data:{resID:resID},
               type:"POST",
                success: function(output){
                    var data = output.split('::');
                    if(data[0] === "OK"){
                        HRS.notification(data[1],data[2]);
                        oTable.fnReloadAjax();
                    }
                    else if(data[0] === "FAIL"){
                        HRS.notification(data[1],data[2]);
                    }
                }
            });
        });
    });
</script>
{{/block}}