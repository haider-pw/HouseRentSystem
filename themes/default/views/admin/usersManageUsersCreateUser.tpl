{{extends file='adminLayout.tpl'}}
{{block name="header"}}
    <title>{{$title}}</title>
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
                            <h5>Create New User/h5>
                        </header>
                        <div class="body" id="collapse4">
                         {{*User Profile*}}
                            <div class="row ui-sortable">
                                <div class="col-lg-12">
                                    <div class="row ui-sortable">
                                        <div class="col-lg-3">
                                            {{*Panel Code Here*}}
                                            <div class="panel panel-default">
                                                <div class="panel-heading">
                                                    <h3 class="panel-title">Wizard Panel</h3>
                                                </div>
                                                <div class="panel-body">

                                                    </div>
                                                </div>
                                            {{* End of Panel Code Here*}}
                                        </div>
                                        <div class="col-lg-9">
                                            {{*Panel Code Here*}}
                                            <div class="panel panel-default">
                                                <div class="panel-heading">
                                                    <h3 class="panel-title">Panel title</h3>
                                                </div>
                                                <div class="panel-body">
                                            {{*Form Start Here*}}
                                            <form class="form-horizontal" id="editTabModelForm">
                                                <input type="hidden"
                                                       id="tabID"> {{*This field is for hidden ID, as HiddenID will be needed to update the form*}}

                                                <div class="form-group">
                                                    <label class="control-label col-lg-2" for="fullName">Full Name</label>
                                                    <div class="col-lg-10">
                                                        <input type="text" class="form-control required" name="fullName" placeholder="Full Name" id="fullName">
                                                    </div>
                                                </div><!-- /.form-group -->
                                                <div class="form-group">
                                                    <label class="control-label col-lg-2" for="username">Username</label>
                                                    <div class="col-lg-10">
                                                        <input type="text" class="form-control required" name="username" placeholder="Username" id="username">
                                                    </div>
                                                </div><!-- /.form-group -->
                                                <div class="form-group">
                                                    <label class="control-label col-lg-2" for="email">Email</label>
                                                    <div class="col-lg-10">
                                                        <input type="text" class="form-control required" name="email" placeholder="Valid Email" id="email">
                                                    </div>
                                                </div><!-- /.form-group -->
                                                <div class="form-group">
                                                    <label class="control-label col-lg-2" for="password">Password</label>
                                                    <div class="col-lg-10">
                                                        <input type="text" class="form-control" name="password" placeholder="Password" id="password">
                                                    </div>
                                                </div><!-- /.form-group -->
                                                <div class="form-group">
                                                    <label class="control-label col-lg-2" for="passVerification">Verified Password</label>
                                                    <div class="col-lg-10">
                                                        <input type="text" class="form-control" name="passVerification" placeholder="Retype Password" id="passVerification">
                                                    </div>
                                                </div><!-- /.form-group -->
                                                <div class="form-group">
                                                    <label class="control-label col-lg-2" for="cnic">CNIC</label>
                                                    <div class="col-lg-10">
                                                        <input type="text" class="form-control" name="cnic" placeholder="Form Path" id="cnic">
                                                    </div>
                                                </div><!-- /.form-group -->
                                                <div class="form-group">
                                                    <label class="control-label col-lg-2" for="mobileNo">Mobile</label>
                                                    <div class="col-lg-10">
                                                        <input type="text" class="form-control" name="mobileNo" placeholder="Form Path" id="mobileNo">
                                                    </div>
                                                </div><!-- /.form-group -->
                                            </form>
                                            {{*End of Form*}}
                                                </div>
                                            </div>
                                            {{*End of Panel Codeing*}}
                                        </div>
                                    </div>
                                </div>
                            </div>
                            {{* End of User Profile*}}
                        </div>
                    </div>
                </div>

            </div>
    </div>
{{/block}}
{{block name="scripts"}}
{{/block}}