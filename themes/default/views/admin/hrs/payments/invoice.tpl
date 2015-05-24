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
                        <h3 class="panel-title">Invoice Details</h3>
                    </div>
                    <div class="panel-body">
                        {{*Details View Start Here*}}

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