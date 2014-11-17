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
                            <h5>Manage Properties</h5>
                            <div style="float:right; margin-right:10px; margin-top: 5px;"><a data-original-title="" href="#addNewPropertyModal_ManageProperties" data-toggle="modal" class="btn btn-metis-5 btn-sm btn-grad btn-rect">Add New Property</a></div>
                        </header>
                        <div class="body" id="collapse4">
                            <table id="ManageResidentials" class="table table-bordered table-condensed table-hover table-striped">
                                <thead>
                                <tr>
                                    <th>Residential ID</th>
                                    <th data-class="expand">TypeID</th>
                                    <th data-class="expand">Res No.</th>
                                    <th data-class="expand">TypeName</th>
                                    <th data-hide="phone">Rooms</th>
                                    <th data-hide="phone,tablet">Kitchens</th>
                                    <th data-hide="phone,tablet">Bathrooms</th>
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

    {{*Add New Property modal*}}
    <div id="addNewPropertyModal_ManageProperties" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title"><i style='color: #666666' class='fa fa-edit fa-fw fa-1x'></i>Add Property</h4>
                </div>
                <div class="modal-body">
                    <div class="body collapse in" id="div-1">
                        <form class="form-horizontal" id="addNewPropertyForm">
                            <div class="form-group">
                                <label class="control-label col-lg-4" for="cResNo">Property No</label>
                                <div class="col-lg-8">
                                    <input type="text" class="form-control digits" name="resNo" placeholder="Auto Assigned" id="cResNo">
                                </div>
                            </div><!-- /.form-group -->
                            <div class="form-group" id="selectPropertyType_MainDiv">
                                <label class="control-label col-lg-4">Type</label>
                                <div class="col-lg-8" id="selectPropertyTypeDiv">
                                    <input type='hidden' name='input' class="required" id='selectPropertyType'/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-lg-4" for="cResRooms">Rooms</label>
                                <div class="col-lg-8">
                                    <input type="text" class="form-control required digits" name="resRooms" placeholder="Total Rooms" id="cResRooms">
                                </div>
                            </div><!-- /.form-group -->
                            <div class="form-group">
                                <label class="control-label col-lg-4" for="cResKitchens">Kitchens</label>
                                <div class="col-lg-8">
                                    <input type="text" class="form-control required digits" name="resKitchens" placeholder="Total Kitchens" id="cResKitchens">
                                </div>
                            </div><!-- /.form-group -->
                            <div class="form-group">
                                <label class="control-label col-lg-4" for="cResWashrooms">Bathrooms</label>
                                <div class="col-lg-8">
                                    <input type="text" class="form-control required digits" name="resWashrooms" placeholder="Total Washrooms" id="cResWashrooms">
                                </div>
                            </div><!-- /.form-group -->
                            <div class="form-group">
                                <label class="control-label col-lg-4" for="cResDescription">Description</label>
                                <div class="col-lg-8">
                                    <textarea name="resDescription" id="cResDescription" placeholder="Type any Description Related to the Property" class="form-control"></textarea>
                                </div>
                            </div><!-- /.form-group -->
                        </form>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" id="AddPropertyBtn">Add</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal --><!-- /#Edit Button Modal -->
{{/block}}
{{block name="scripts"}}
    {{js('datatables/fnReloadAjax.js')}}
    <script>
        /**
         * @var oTable will be Global variable.
         *
         **/
        var oTable;
        $(document).ready(function(e){
            oTable = '';
            //Data Tables Script Here.
            var selector = $('#ManageResidentials');
            var url = "{{base_url()}}admin/properties/listResidentials_DT/";
            var aoColumns =  [
                /* ID */   {
                    "bVisible":    false,
                    "bSortable":   false,
                    "bSearchable": false
                },
                {
                    "bVisible":    false,
                    "bSortable":   false,
                    "bSearchable": false
                },
                /* Type */  null,
                /* Type */  null,
                /* Rooms */  null,
                /* Kitchens */  null,
                /* Bathrooms */  null,
                /* Description */  null,
                /* Actions */  null
            ];
            commonDataTables(selector,url,aoColumns);
            //End Of dataTables Script..

            /*-----------------selectors of the Page-----------------------*/
            {{*The Selector for Selecting the Parent Menu*}}
            var selector = $('#selectPropertyType');
            var url = "{{base_url()}}admin/properties/loadAllPropertyTypes/";
            var id = "ResTypeID";
            var text = "TypeName";
            var minInputLength = 0;
            var placeholder = "Select Property Type";
            commonSelect2(selector,url,id,text,minInputLength,placeholder);

            /* Function for Add Button on Add Property Modal*/
            $('#AddPropertyBtn').on('click',function(e){
                e.stopImmediatePropagation();
                e.preventDefault();
                var selector = $('#addNewPropertyForm');
                HRS.formValidation(selector);
                $('.digits').rules( "add", {
                    digits:true
                });
                if(selector.valid()){
                   var formData = {
                     propertyNo:  $('#cResNo').val(),
                     totalRooms: $('#cResRooms').val(),
                       totalKitchens: $('#cResKitchens').val(),
                       totalBathrooms: $('#cResWashrooms').val(),
                       propertyDescription: $('#cResDescription').val(),
                       propertyType: $('#selectPropertyType').val()
                   };
                $.ajax({
                    type: "POST",
                    url:"{{url}}admin/properties/addNewProperty",
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
                }
            });
            $('.select2-container').css("width","100%");
        });
    </script>
{{/block}}