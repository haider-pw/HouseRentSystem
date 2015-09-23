{{extends file='adminLayout.tpl'}}

{{block name="header"}}
    <title>{{$title}}</title>
    {{css('admin/avatar.css')}}
    {{css('admin/jasny/jasny-bootstrap.min.css')}}
{{/block}}

{{block name="content"}}
    <div class="outer">
        <div class="inner">
            {{*Invoice Main Section Starts Here*}}
            <div class="row ui-sortable">

                <div class="col-lg-12">
                    <div class="box">
                        <header>
                            <div class="icons">
                                <i class="fa fa-table"></i>
                            </div>
                            <h5>Payment Invoice</h5>
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
                                                        <a href="{{url}}admin/properties/propertyDetails/{{$paymentDetails->ResID}}"><span class="user-name">{{$paymentDetails->ResNo}}</span></a>
                                                    </div>
                                                    <div class="list-group">
                                                        <a href="#" class="list-group-item row">
                                                            <div class="col-lg-12"
                                                                 style="text-align: center;font-weight: bold;">
                                                                <span>{{$paymentDetails->ResType}}</span>
                                                            </div>
                                                        </a>
                                                        <a href="#" class="list-group-item row">
                                                            <div class="col-lg-4">
                                                                <b>Tenant:</b>
                                                            </div>
                                                            <div class="col-lg-8">
                                                                <span>{{$paymentDetails->TenantName}}</span>
                                                            </div>
                                                        </a>
                                                        <a href="#" class="list-group-item row">
                                                            <div class="col-lg-4">
                                                                <b>Month/Year:</b>
                                                            </div>
                                                            <div class="col-lg-8">
                                                                <span>{{$paymentDetails->PaymentMonthYear}}</span>
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
                                                    <h3 class="panel-title">Payment Details</h3>
                                                </div>
                                                <div class="panel-body">
                                                    {{*Details View Start Here*}}
                                                    <form class="form-horizontal" action="">
                                                           <div class="form-group">
                                                                <label class="control-label col-lg-2" for="fullName">PaymentID</label>
                                                                <div class="col-lg-10">
                                                                    <input type="text" class="form-control required" name="paymentID" value="{{$paymentDetails->PaymentID}}" disabled="disabled">
                                                                </div>
                                                            </div><!-- /.form-group -->
                                                            <div class="form-group">
                                                                <label class="control-label col-lg-2" for="fatherName">Due Date</label>
                                                                <div class="col-lg-10">
                                                                    <input type="text" class="form-control required" name="dueDate" placeholder="Due Date" value="{{$paymentDetails->DueDate}}">
                                                                </div>
                                                            </div><!-- /.form-group -->
                                                            <div class="form-group">
                                                                <label class="control-label col-lg-2" for="username">Amount Outstanding</label>
                                                                <div class="col-lg-10">
                                                                    <input type="text" class="form-control required" name="amountOutstanding" placeholder="Username" value="{{$paymentDetails->TotalOutstanding}}" id="username">
                                                                </div>
                                                            </div><!-- /.form-group -->
                                                    </form>


                                                    <div class="body collapse in" id="borderedTable">
                                                        <table class="table table-bordered responsive">
                                                            <thead>
                                                            <tr>
                                                                <th>Type</th>
                                                                <th>Description</th>
                                                                <th>Amount</th>
                                                            </tr>
                                                            </thead>
                                                            <tbody>
                                                            {{foreach from=$paymentDetails->Dues key=k item=row}}
                                                                <tr>
                                                                    <td>{{$k}}</td>
                                                                    <td>{{$row['Description']}}</td>
                                                                    <td>{{$row['Amount']}}</td>
                                                                </tr>
                                                            {{/foreach}}

                                                            {{foreach from=$paymentDetails->Payments item=row}}
                                                                <tr>
                                                                    <td></td>
                                                                    <td style="text-align: right">(Payment) {{$row['DateReceived']}} </td>
                                                                    <td style="text-align: right">(Rs{{$row['Amount']}})</td>
                                                                </tr>
                                                            {{/foreach}}
                                                            <tr>
                                                                <td></td>
                                                                <td style="text-align: right">Total Amount Due:</td>
                                                                <td style="font-weight: bold;">Rs{{$paymentDetails->TotalPaymentsDue}}</td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                                <td style="text-align: right">Total Amount Paid:</td>
                                                                <td style="font-weight: bold;">(Rs{{$paymentDetails->TotalPaymentsReceived}})</td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                                <td style="text-align: right">Total Amount Outstanding: </td>
                                                                <td style="font-weight: bold;">Rs{{$paymentDetails->TotalOutstanding}}</td>
                                                            </tr>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                    {{*Details Views Ends Here*}}
                                                </div>

                                            </div>
                                        </div>
                                        {{*End of Right Section Division*}}

                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>


                </div>
            </div>
        </div>
    </div>
{{/block}}

{{block name="scripts"}}
{{/block}}