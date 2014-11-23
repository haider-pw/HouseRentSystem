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
            {{*Tenant Details Main Section Starts Here*}}
            <div class="row ui-sortable">

                <div class="col-lg-12">
                    <div class="box">
                        <header>
                            <div class="icons">
                                <i class="fa fa-table"></i>
                            </div>
                            <h5>Tenant Details</h5>
                        </header>
                        <div class="body" id="collapse4">
                            {{*User Profile*}}
                            <div class="row ui-sortable">
                                <div class="col-lg-12">
                                    <div class="row ui-sortable">
                                        {{*left section division*}}
                                        <div class="col-lg-3">
                                            {{*Panel Code Here*}}
                                            <div class="panel panel-default">
                                                <div class="panel-heading">
                                                    <h3 class="panel-title">Syed Haider Hassan</h3>
                                                </div>
                                                <div class="panel-body">
                                                    <div class="row">
                                                        <div class="holder">
                                                            <div class="avatar">
                                                                <a href="#">
                                                                    <img id="userDefaultAvatars"
                                                                         src="{{url}}uploads/users/d/defaultAvatar.jpg"
                                                                         class="user"/>
                                                                </a>
                                                            </div>
                                                        </div>
                                                        <span class="user-name">Syed Haider Hassan</span>
                                                    </div>
                                                    <div class="list-group">
                                                        <a href="#" class="list-group-item row">
                                                            <div class="col-lg-12" style="text-align: center;font-weight: bold;">
                                                                <span> Administrator</span>
                                                            </div>
                                                        </a>
                                                        <a href="#" class="list-group-item row">
                                                            <div class="col-lg-3">
                                                            <b >CNIC:</b>
                                                            </div>
                                                            <div class="col-lg-9">
                                                                <span> 17301-5856870-1</span>
                                                            </div>
                                                        </a>
                                                        <a href="#" class="list-group-item row">
                                                            <div class="col-lg-3">
                                                                <b >Cell:</b>
                                                            </div>
                                                            <div class="col-lg-9">
                                                                <span> 03348123456</span>
                                                            </div>
                                                        </a>
                                                        <a href="#" class="list-group-item row">
                                                            <div class="col-lg-3">
                                                                <b>Last Login: </b>
                                                            </div>
                                                            <div class="col-lg-9">
                                                                <span> Never </span>
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

            {{*End of Tenant Details Main Section*}}
        </div>
    </div>
    {{*End of the Main View*}}
    {{*Just for Update*}}
{{/block}}
{{block name="scripts"}}
    {{js('holder/holder.js')}}
    <script>

    </script>
{{/block}}