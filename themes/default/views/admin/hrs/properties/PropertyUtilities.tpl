{{extends file='adminLayout.tpl'}}
{{block name="header"}}
    <title>{{$title}}</title>
    {{css('admin/jasny/jasny-bootstrap.min.css')}}
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
                                <input type='hidden' name='selectUtilityType' id='selectUtilityType'/>
                            </div>
                        </header>
                        <div class="body" id="collapse4">
                            <table id="PropertyUtilities" class="table table-bordered table-condensed table-hover table-striped">
                                <thead>
                                <tr>
                                    <th>Residential ID</th>
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
        $('document').ready(function (e) {

            {{*The Selector for Selecting the Utility Type*}}
            var selector = $('#selectUtilityType');
            var url = "{{base_url()}}admin/properties/loadAllUtilities/";
            var id = "UTID";
            var text = "UName";
            var minInputLength = 0;
            var placeholder = "Select Utility Type";
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
        });
    </script>
{{/block}}