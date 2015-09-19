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
                                                        <span class="user-name">{{$PropertyData[0]->ResNo}}</span>
                                                    </div>
                                                    <div class="list-group">
                                                        <a href="#" class="list-group-item row">
                                                            <div class="col-lg-12"
                                                                 style="text-align: center;font-weight: bold;">
                                                                <span>{{$PropertyData[0]->TypeName}}</span>
                                                            </div>
                                                        </a>
                                                        <a href="#" class="list-group-item row">
                                                            <div class="col-lg-4">
                                                                <b>Rooms:</b>
                                                            </div>
                                                            <div class="col-lg-8">
                                                                <span>{{$PropertyData[0]->ResRooms}}</span>
                                                            </div>
                                                        </a>
                                                        <a href="#" class="list-group-item row">
                                                            <div class="col-lg-4">
                                                                <b>Kitchens:</b>
                                                            </div>
                                                            <div class="col-lg-8">
                                                                <span>{{$PropertyData[0]->ResKitchens}}</span>
                                                            </div>
                                                        </a>
                                                        <a href="#" class="list-group-item row">
                                                            <div class="col-lg-4">
                                                                <b>Washrooms:</b>
                                                            </div>
                                                            <div class="col-lg-8">
                                                                <span>{{$PropertyData[0]->ResBathrooms}}</span>
                                                            </div>
                                                        </a>
                                                        <a href="#" class="list-group-item row">
                                                            <div class="col-lg-4">
                                                                <b>Registered On: </b>
                                                            </div>
                                                            <div class="col-lg-8">
                                                                <span> {{$PropertyData[0]->DateRegistered}} </span>
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
                                                                    <input type="text" class="form-control required" name="paymentID" value="{{$UserData[0]->FullName}}" disabled="disabled">
                                                                </div>
                                                            </div><!-- /.form-group -->
                                                            <div class="form-group">
                                                                <label class="control-label col-lg-2" for="fatherName">Due Date</label>
                                                                <div class="col-lg-10">
                                                                    <input type="text" class="form-control required" name="dueDate" placeholder="Due Date" value="{{$UserData[0]->FatherName}}">
                                                                </div>
                                                            </div><!-- /.form-group -->
                                                            <div class="form-group">
                                                                <label class="control-label col-lg-2" for="username">Amount Outstanding</label>
                                                                <div class="col-lg-10">
                                                                    <input type="text" class="form-control required" name="amountOutstanding" placeholder="Username" value="{{$UserData[0]->Username}}" id="username">
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
                                                            <tr>
                                                                <td>Rent</td>
                                                                <td>Rent payment for 12/05/14 - 01/04/15</td>
                                                                <td>Rs12,000</td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                                <td style="text-align: right">(Payment) Muhammad Asif · 11/26/14</td>
                                                                <td>(Rs6,000.00)</td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                                <td style="text-align: right">Total Amount Due:</td>
                                                                <td style="font-weight: bold;">Rs12,000</td>
                                                            </tr>                                                            <tr>
                                                                <td></td>
                                                                <td style="text-align: right">Total Amount Paid:</td>
                                                                <td style="font-weight: bold;">(Rs6,000.00)</td>
                                                            </tr>                                                            </tr>                                                            <tr>
                                                                <td></td>
                                                                <td style="text-align: right">Total Amount Outstanding: </td>
                                                                <td style="font-weight: bold;">Rs6,000.00</td>
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