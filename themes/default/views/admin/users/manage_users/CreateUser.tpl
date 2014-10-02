{{extends file='adminLayout.tpl'}}
{{block name="header"}}
    <title>{{$title}}</title>
    {{css('admin/avatar.css')}}
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
                                                    <div class="row">
                                                        <div class="holder">
                                                            <div class="avatar">
                                                                <a href="#">
                                                                    <img src="http://localhost/projects/HouseRentSystem/themes/default/img/admin/spikes_avatar.jpg" class="user"/>
                                                                </a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="list-group" id="currentStepStatus">
                                                        <a href="#" class="list-group-item active" id="currentFirst">
                                                            <h4 class="list-group-item-heading">Personal Information</h4>
                                                            <p class="list-group-item-text">User Personal Information Settings Only</p>
                                                        </a>
                                                        <a href="#" class="list-group-item" id="currentSecond">
                                                            <h4 class="list-group-item-heading">Security Settings</h4>
                                                            <p class="list-group-item-text">User Email and Password Settings</p>
                                                        </a>
                                                        <a href="#" class="list-group-item" id="currentThird">
                                                            <h4 class="list-group-item-heading">Site Configuration</h4>
                                                            <p class="list-group-item-text">Configuration of Website According to User Needs</p>
                                                        </a>
                                                    </div>
                                                    </div>
                                                </div>
                                            {{* End of Panel Code Here*}}
                                        </div>
                                        <div class="col-lg-9">
                                            {{*Panel Code Here*}}
                                            <div class="panel panel-default">
                                                <div class="panel-heading">
                                                    <h3 class="panel-title">Personal Information</h3>
                                                </div>
                                                <div class="panel-body">
                                            {{*Form Start Here*}}
                                            <form class="form-horizontal wizardForm" id="wizardForm"">
                                                    <fieldset class="step" id="first">
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
                                                        <input type="text" class="form-control required" name="userEmail" placeholder="Valid Email" id="email">
                                                    </div>
                                                </div><!-- /.form-group -->
                                                <div class="form-group">
                                                    <label class="control-label col-lg-2" for="password">Password</label>
                                                    <div class="col-lg-10">
                                                        <input type="text" class="form-control" name="pass" placeholder="Password" id="pass">
                                                    </div>
                                                </div><!-- /.form-group -->
                                                <div class="form-group">
                                                    <label class="control-label col-lg-2" for="passVerification">Verified Password</label>
                                                    <div class="col-lg-10">
                                                        <input type="text" class="form-control" name="pass2" placeholder="Retype Password" id="passVerification">
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
                                                    </fieldset>
                                                    <fieldset class="step" id="second">
                                                        <div class="form-group">
                                                            <label class="control-label col-lg-2" for="mobileNo">Mobile</label>
                                                            <div class="col-lg-10">
                                                                <input type="text" class="form-control" name="mobileNo" placeholder="Form Path" id="mobileNo">
                                                            </div>
                                                        </div><!-- /.form-group -->
                                                    </fieldset>
                                                    <div class="form-actions">
                                                        <input class="navigation_button btn" id="back" value="Back" type="reset" />
                                                        <input class="navigation_button btn btn-primary" id="next" value="Next" type="submit" />
                                                    </div>
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
        {{js('holder/holder.js')}}
        {{js('formwizard/jquery.form.wizard.js')}}
        <script>
            $(document).ready(function(e){
                /*----------- BEGIN formwizard CODE -------------------------*/
                $("#wizardForm").formwizard({
                    formPluginEnabled: true,
                    validationEnabled: true,
                    focusFirstInput: true,
                    formOptions: {
                        beforeSubmit: function(data) {
                            $.gritter.add({
                                // (string | mandatory) the heading of the notification
                                title: 'data sent to the server',
                                // (string | mandatory) the text inside the notification
                                text: $.param(data),
                                sticky: false
                            });

                            return false;
                        },
                        dataType: 'json',
                        resetForm: true
                    },
                    validationOptions: {
                        rules: {
                            server_host: "required",
                            server_name: "required",
                            server_user: "required",
                            server_password: "required",
                            table_prefix: "required",
                            table_collation: "required",
                            username: {
                                required: true,
                                minlength: 3
                            },
                            usermail: {
                                required: true,
                                email: true
                            },
                            pass: {
                                required: true,
                                minlength: 6
                            },
                            pass2: {
                                required: true,
                                minlength: 6,
                                equalTo: "#pass"
                            }
                        },
                        errorClass: 'help-block',
                        errorElement: 'span',
                        highlight: function(element, errorClass, validClass) {
                            $(element).parents('.form-group').removeClass('has-success').addClass('has-error');
                        },
                        unhighlight: function(element, errorClass, validClass) {
                            $(element).parents('.form-group').removeClass('has-error').addClass('has-success');
                        }
                    }
                });
                /*----------- END formwizard CODE -------------------------*/
                $('#next').on('click', function (e) {
                    e.preventDefault();
                    e.stopPropagation();
                    // bind a callback to the step_shown event
                    $("#wizardForm").bind("step_shown", function (event, data) {
                        var currentStep = data.currentStep;
                        switch (currentStep) {
                            case "first":
                                console.log('Im fucking First Step');
                                $('#currentStepStatus a').removeClass('active');
                                $('#currentStepStatus a#currentFirst').addClass('active');
                                break;
                            case "second":
                                console.log('Im fucking Second Step');
                                $('#currentStepStatus a').removeClass('active');
                                $('#currentStepStatus a#currentSecond').addClass('active');
                                break;
                            case "third":
                                console.log('Im fucking Third Step');
                                $('#currentStepStatus a').removeClass('active');
                                $('#currentStepStatus a#currentThird').addClass('active');
                                break;
                        }
                    });

                });
            });
        </script>
{{/block}}