{{extends file='adminLayout.tpl'}}
{{block name="header"}}
    <title>{{$title}}</title>
    {{css('admin/avatar.css')}}
    {{css('admin/jasny/jasny-bootstrap.min.css')}}
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
                            <h5>Create New User</h5>
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
                                                                    <img id="userDefaultAvatars" src="http://localhost:8080/projects/HouseRentSystem/uploads/users/d/defaultAvatar.jpg" class="user"/>
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
                                            <form class="form-horizontal wizardForm" id="wizardForm" enctype="multipart/form-data" method="post">
                                                    <fieldset class="step" id="first">
                                                        {{*The Image Upload Sctoin*}}

                                                        <div class="form-group">
                                                            <label class="control-label col-lg-2">Picture</label>
                                                            <div class="col-lg-10">
                                                                <div class="fileinput fileinput-new input-group" data-provides="fileinput" id="fileInputSiteLogo">
                                                                    <div class="form-control" data-trigger="fileinput"><i class="glyphicon glyphicon-file fileinput-exists"></i> <span class="fileinput-filename"></span></div>
                                                                    <span class="input-group-addon btn btn-default btn-file"><span class="fileinput-new">Select file</span><span class="fileinput-exists">Change</span>
                                                                        <input type="file" id="file" name="userDefaultAvatar" accept="image/*" />
                                                                    </span>
                                                                    <a href="#" class="input-group-addon btn btn-default fileinput-exists" data-dismiss="fileinput" id="fileRemove">Remove</a>
                                                                </div>
                                                            </div>
                                                        </div><!-- /.form-group -->
{{*End of Image Upload Section*}}
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
                                                        <input type="email" class="form-control required" name="userEmail" placeholder="e-g jhon@example.com" id="email">
                                                    </div>
                                                </div><!-- /.form-group -->
                                                <div class="form-group">
                                                    <label class="control-label col-lg-2" for="cnic">CNIC</label>
                                                    <div class="col-lg-10">
                                                        <input type="text" class="form-control required" name="cnic" placeholder="Enter your CNIC" id="cnic" data-mask="99999-9999999-9">
                                                    </div>
                                                </div><!-- /.form-group -->
                                                <div class="form-group">
                                                    <label class="control-label col-lg-2" for="mobileNo">Mobile</label>
                                                    <div class="col-lg-10">
                                                        <input type="text" class="form-control" name="mobileNo" placeholder="Mobile Number" id="mobileNo">
                                                    </div>
                                                </div><!-- /.form-group -->
                                                    </fieldset>
                                                    <fieldset class="step" id="second">
                                                        <div class="form-group">
                                                            <label class="control-label col-lg-2" for="password">Password</label>
                                                            <div class="col-lg-10">
                                                                <input type="password" class="form-control" name="pass" placeholder="Password" id="pass">
                                                            </div>
                                                        </div><!-- /.form-group -->
                                                        <div class="form-group">
                                                            <label class="control-label col-lg-2" for="passVerification">Verified Password</label>
                                                            <div class="col-lg-10">
                                                                <input type="password" class="form-control" name="pass2" placeholder="Retype Password" id="passVerification">
                                                            </div>
                                                        </div><!-- /.form-group -->
                                                    </fieldset>
                                                    <fieldset class="step" id="third">
                                                        <div class="form-group">
                                                            <label class="control-label col-lg-2" for="theme">Theme</label>
                                                            <div class="col-lg-10">
                                                                <input type="text" class="form-control" name="theme" placeholder="Select Theme Choice" id="theme">
                                                            </div>
                                                        </div><!-- /.form-group -->
                                                        <div class="form-group">
                                                            <label class="control-label col-lg-2">Group baba</label>
                                                            <div class="col-lg-10">
                                                                <input type='hidden' class="required" name='selectGroup' id='selectGroup'/>
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
        {{js('jquery-form/jquery.form.js')}}
        {{js('formwizard/jquery.form.wizard.js')}}
        {{js('admin/jasny/jasny-bootstrap.min.js')}}
        {{js('jquery-validate/additional-methods.min.js')}}
        <script>
            $(document).ready(function(e){
                /*----------- BEGIN formwizard CODE -------------------------*/
                var wizardForm = $("#wizardForm").formwizard({
                    formPluginEnabled: true,
                    validationEnabled: true,
                    focusFirstInput: true,
                    textSubmit: "Submit and Create",
                    remoteAjax : {
                        "first" : { // add a remote ajax call when moving next from the first step
                            url : '{{base_url()}}admin/usersManageUsers/CreateUser_firstStepValidation/{{$UserData[0]->UserID}}',
                            beforeSend : function(){},
                            complete : function(){},
                            success : function(output){
                                var data = output.split("::");
                                if(data[0]=="OK"){
                                    HRS.notification(data[1], data[2]);
                                    return true;
                                }
                                else if(data[0] == "FAIL"){
                                    HRS.notification(data[1], data[2]);
                                    return false;
                                }
                                return true; //return true to make the wizard move to the next step
                            }
                        }},
                    formOptions: {
                        beforeSubmit: function(data) {

                            var file = $("#file")[0].files[0];

                                //data.append(file);
                            var formData = new FormData();
                            formData.append('fullName', $('#fullName').val());
                            formData.append('username', $('#username').val());
                            formData.append('userEmail', $('#email').val());
                            formData.append('cnic', $('#cnic').val());
                            formData.append('MobileNo', $('#mobileNo').val());
                            formData.append('pass', $('#pass').val());
                            formData.append('pass2', $('#passVerification').val());
                            formData.append('theme', $('#theme').val());
                            formData.append('selectGroup', $('#selectGroup').val());
                            // Main magic with files here
                            formData.append('image', $('input[type=file]')[0].files[0]);
                            $.ajax({
                                type:'POST',
                                url:'{{base_url()}}admin/usersManageUsers/CreateUser_Action/',
                                data:formData,
                                processData: false,
                                contentType: false,
                                success: function(output){
                                    var data = output.split("::");
                                    if (data[0] == "OK") {
                                        HRS.notification(data[1], data[2]);
                                    }
                                    else if(data[0]=="FAIL") {
                                        HRS.notification(data[1], data[2]);
                                    }
                                }
                            });

                            return false;
                        },
                        dataType: 'json',
                        resetForm: true
                    },
                    validationOptions: {
                        ignore: ".ignore, .select2-input",
                        rules: {
                            selectGroup:{
                                required:true
                            },
                            username: {
                                required: true,
                                minlength: 3
                            },
                            userEmail: {
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
                            },
                            userDefaultAvatar: {
                                required: true,
                                accept: "image/jpg,image/jpeg,image/png,image/gif"
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
                    // bind a callback to the step_shown event
                    $("#wizardForm").bind("step_shown", function (event, data) {
                        event.stopImmediatePropagation();
                        var currentStep = data.currentStep;
                        switch (currentStep) {
                            case "first":
                                $('#currentStepStatus a').removeClass('active');
                                $('#currentStepStatus a#currentFirst').addClass('active');
                                $('#currentStepHeading h3.panel-title').html('Personal Information');
                                break;
                            case "second":
                                $('#currentStepStatus a').removeClass('active');
                                $('#currentStepStatus a#currentSecond').addClass('active');
                                $('#currentStepHeading h3.panel-title').html('Security Information');
                                break;
                            case "third":
                                $('#currentStepStatus a').removeClass('active');
                                $('#currentStepStatus a#currentThird').addClass('active');
                                $('#currentStepHeading h3.panel-title').html('Site Configuration');
                                $("#selectGroup").select2("enable", true);
                                $('.select2-container').css("width","100%");
                                break;
                        }
                    });
                });
                //End of click Function

                {{*The Selector for Selecting the User Group*}}
                var selector = $('#selectGroup');
                var url = "{{base_url()}}admin/usersManageUsers/loadAllUserGroups/";
                var id = "GroupID";
                var text = "GroupName";
                var minInputLength = 0;
                var placeholder = "Select User Group";
                commonSelect2(selector,url,id,text,minInputLength,placeholder);
                //End of the CommonSelect2 function

                //Show the Image when User uses the file input.
                $('#file').change(function (e) {
                    var oFReader = new FileReader();
                    if (this.files[0] != undefined) {
                        oFReader.readAsDataURL(this.files[0]);
                        var mimeType = this.files[0].type;
                        if (mimeType !== '') {
                            var fileType = mimeType.split('/');
                            if (fileType[0] == 'image' && (fileType[1] == 'jpg' || fileType[1] == 'png' || fileType[1] == 'gif' || fileType[1] == 'jpeg')) {
                                oFReader.onload = function (oFREvent) {
                                    //$('#preview').html('<img src="'+oFREvent.target.result+'">');
                                    $('#userDefaultAvatars').attr('src', oFREvent.target.result);
                                };
                            }
                        }
                    }
                });
                $('#fileRemove').on('click', function(e){
                    $('#userDefaultAvatars').attr('src','http://localhost:8080/projects/HouseRentSystem/uploads/users/d/defaultAvatar.jpg');
                });
            });
        </script>
{{/block}}