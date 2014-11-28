{{extends file="adminLayout.tpl"}}
{{block name="header"}}
    <title>{{$title}}</title>
    {{css('admin/avatar.css')}}
    {{css('admin/jasny/jasny-bootstrap.min.css')}}
{{/block}}
{{block name="content"}}
    {{*Start of the Main View*}}
    <div class="outer">
        <div class="inner">
            {{*Property Details Main Section Starts Here*}}
            <div class="row ui-sortable">

                <div class="col-lg-12">
                    <div class="box">
                        <header>
                            <div class="icons">
                                <i class="fa fa-table"></i>
                            </div>
                            <h5>Property Details</h5>
                        </header>
                        <div class="body" id="collapse4">
                            {{*Main Section Body of View Starts Here*}}
                            <div class="row ui-sortable">
                                <div class="col-lg-12">
                                    <div class="row ui-sortable">
                                        {{*left section division*}}
                                        <div class="col-lg-3">
                                            {{*Panel Code Here*}}
                                            <div class="panel panel-default">
                                                <div class="panel-heading">
                                                    {{*<pre>{{var_dump($TenantData)}}</pre>*}}
                                                    <h3 class="panel-title">Property Basic Info</h3>
                                                </div>
                                                <div class="panel-body">
                                                    <div class="row">
                                                        <div class="holder">
                                                            <div class="avatar">
                                                                <a href="#">
                                                                    <img id="userDefaultAvatars"
                                                                         src="{{url}}uploads/properties/d/defaultHouseDP.jpg"
                                                                         class="user"/>
                                                                </a>
                                                            </div>
                                                        </div>
                                                        <span class="user-name">H-001</span>
                                                    </div>
                                                    <div class="list-group">
                                                        <a href="#" class="list-group-item row">
                                                            <div class="col-lg-12"
                                                                 style="text-align: center;font-weight: bold;">
                                                                <span>House</span>
                                                            </div>
                                                        </a>
                                                        <a href="#" class="list-group-item row">
                                                            <div class="col-lg-4">
                                                                <b>Rooms:</b>
                                                            </div>
                                                            <div class="col-lg-8">
                                                                <span>4</span>
                                                            </div>
                                                        </a>
                                                        <a href="#" class="list-group-item row">
                                                            <div class="col-lg-4">
                                                                <b>Kitchens:</b>
                                                            </div>
                                                            <div class="col-lg-8">
                                                                <span>1</span>
                                                            </div>
                                                        </a>
                                                        <a href="#" class="list-group-item row">
                                                            <div class="col-lg-4">
                                                                <b>Washrooms:</b>
                                                            </div>
                                                            <div class="col-lg-8">
                                                                <span>2</span>
                                                            </div>
                                                        </a>
                                                        <a href="#" class="list-group-item row">
                                                            <div class="col-lg-4">
                                                                <b>Registered On: </b>
                                                            </div>
                                                            <div class="col-lg-8">
                                                                <span> DateRegistered </span>
                                                            </div>
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                            {{* End of Panel Code Here*}}
                                        </div>
                                        {{*End of Left Section Division*}}
                                        {{*Start of Right Section Division*}}
                                        <div class="col-lg-9">
                                            {{*Panel Code Here*}}
                                            <div class="panel panel-default">
                                                <div class="panel-heading">
                                                    <h3 class="panel-title">Detail Info</h3>
                                                </div>
                                                <div class="panel-body">
                                                    {{*Details View Start Here*}}
                                                    <div class="well well-sm customWellBox">
                                                        <div class="row">
                                                            <div class="col-lg-3 col-md-6 col-sm-6">
                                                                <span class="fa fa-user"
                                                                      style="color: #138b0c; font-size: 16pt;"
                                                                      aria-hidden="true"></span>

                                                                <h3 style="display: inline-block">0</h3>

                                                                <p style="font-weight: bold;margin-left: 10px;">Active
                                                                    Tenant</p>
                                                            </div>
                                                            <div class="col-lg-3 col-md-6 col-sm-6">
                                                                <span class="fa fa-users"
                                                                      style="color: #797a73; font-size: 16pt;"
                                                                      aria-hidden="true"></span>

                                                                <h3 style="display: inline-block"> 0</h3>

                                                                <p style="font-weight: bold;margin-left: 10px;">InActive
                                                                    Tenants</p>
                                                            </div>
                                                            <div class="col-lg-3 col-md-6 col-sm-6">
                                                                <span class="fa fa-lightbulb-o"
                                                                      style="color: #b57b06; font-size: 16pt;"
                                                                      aria-hidden="true"></span>

                                                                <h3 style="display: inline-block">0</h3>

                                                                <p style="font-weight: bold;margin-left: 10px;">
                                                                    Utilities</p>
                                                            </div>
                                                            <div class="col-lg-3 col-md-6 col-sm-6">
                                                                <span class="fa fa-tint"
                                                                      style="color: #216ab1; font-size: 16pt;"
                                                                      aria-hidden="true"></span>

                                                                <h3 style="display: inline-block">0</h3>

                                                                <p style="font-weight: bold;margin-left: 10px;">
                                                                    Services</p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    {{*Panel Here which Should Hold a Table/Grid*}}
                                                    <div class="row" style="margin-top:20px;">
                                                        <div class="col-lg-12">
                                                            <div class="panel panel-primary">
                                                                <div class="panel-heading">
                                                                    <div class="row">
                                                                        <div class="panel-title col-xs-6"
                                                                             style="display: inline-block;">Tenants
                                                                        </div>
                                                                        <div class="customPanelHeaderSearch col-xs-6">
                                                                            <input type="text" class="form-control"
                                                                                   placeholder="Search..."></div>
                                                                    </div>
                                                                </div>
                                                                {{*Main Grid Here*}}
                                                                <table id="TenantPaymentDetails"
                                                                       class="table table-bordered table-condensed table-hover table-striped">
                                                                    <thead>
                                                                    <tr>
                                                                        <th>TenantID</th>
                                                                        <th data-class="expand">Status</th>
                                                                        <th data-hide="phone">Full Name</th>
                                                                        <th data-hide="phone,tablet">Father Name</th>
                                                                        <th data-hide="phone,tablet">CNIC</th>
                                                                        <th data-hide="phone,tablet">Mobile</th>
                                                                        <th data-hide="phone">Assigned On</th>
                                                                        <th data-hide="phone">Revoked On</th>
                                                                    </tr>
                                                                    </thead>
                                                                    <tbody></tbody>
                                                                </table>
                                                                {{*End of Main Grid*}}
                                                            </div>
                                                        </div>
                                                    </div>
                                                    {{*Details Views Ends Here*}}
                                                </div>

                                            </div>
                                        </div>
                                        {{*End of Right Section Division*}}
                                    </div>
                                </div>
                            </div>
                            {{*End of Main Body View*}}
                        </div>
                    </div>
                </div>
            </div>
            {{*End of Property Details Main Section*}}
        </div>
    </div>
{{/block}}
{{block name="scripts"}}
    {{js('datatables/fnReloadAjax.js')}}
    <script>
        var oTable;
        $(document).ready(function (e) {
            oTable = '';
            //Data Tables Script Here.
            var selector = $('#TenantPaymentDetails');
            var url = "{{url}}admin/properties/listPropertyTenantsHistory_DT/{{$propertyID}}";
            var aoColumns =  [
                /* Tenant ID */   {
                    "bVisible":    false,
                    "bSortable":   false,
                    "bSearchable": false
                },
                /* Status */  null,
                /* FullName */  null,
                /* FatherName */  null,
                /* CNIC */  null,
                /* Mobile */  null,
                /* DateAssigned */  null,
                /* DateRevoked */  null

            ];
            var sDom = '<"H"r>t<"F"<"row"<"col-xs-6" i> <"col-xs-6" p>>>';
            commonDataTablesCustomDOM(selector,url,aoColumns,sDom);
            //End Of dataTables Script..
        });
    </script>
{{/block}}