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
                    <h5>Update User Information</h5>
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
                                                        <a href="#updateAvatar" data-toggle="modal">
                                                            {{if ($UserData[0]->Avatar !== 'defaultAvatar.jpg')}}
                                                                <img src="{{url}}uploads/users/{{$UserData[0]->UserID}}/{{$UserData[0]->Avatar}}" class="user"/>
                                                            {{else}}
                                                                <img src="{{url}}uploads/users/d/{{$UserData[0]->Avatar}}" class="user"/>
                                                            {{/if}}
                                                            <div class="editAvatar"><div class="block"><span class="fa fa-camera fa-1x"></span><p>Edit Picture</p></div></div>
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
                                        <div class="panel-heading" id="currentStepHeading">
                                            <h3 class="panel-title">Personal Information</h3>
                                        </div>
                                        <div class="panel-body">
                                            {{*Form Start Here*}}
                                            <form class="form-horizontal wizardForm" id="wizardForm" method="post" action="">
                                                <fieldset class="step" id="first">
                                                    <div class="form-group">
                                                        <label class="control-label col-lg-2" for="fullName">Full Name</label>
                                                        <div class="col-lg-10">
                                                            <input type="text" class="form-control required" name="fullName" placeholder="Full Name" value="{{$UserData[0]->FullName}}" id="fullName">
                                                        </div>
                                                    </div><!-- /.form-group -->
                                                    <div class="form-group">
                                                        <label class="control-label col-lg-2" for="username">Username</label>
                                                        <div class="col-lg-10">
                                                            <input type="text" class="form-control required" name="username" placeholder="Username" value="{{$UserData[0]->Username}}" id="username">
                                                        </div>
                                                    </div><!-- /.form-group -->
                                                    <div class="form-group">
                                                        <label class="control-label col-lg-2" for="email">Email</label>
                                                        <div class="col-lg-10">
                                                            <input type="email" class="form-control required" name="userEmail" placeholder="e-g jhon@example.com" value="{{$UserData[0]->Email}}" id="email">
                                                        </div>
                                                    </div><!-- /.form-group -->
                                                    <div class="form-group">
                                                        <label class="control-label col-lg-2" for="cnic">CNIC</label>
                                                        <div class="col-lg-10">
                                                            <input type="text" class="form-control required" name="cnic" placeholder="Enter your CNIC" value="{{$UserData[0]->CNIC}}" id="cnic" data-mask="99999-9999999-9">
                                                        </div>
                                                    </div><!-- /.form-group -->
                                                    <div class="form-group">
                                                        <label class="control-label col-lg-2" for="mobileNo">Mobile</label>
                                                        <div class="col-lg-10">
                                                            <input type="text" class="form-control" name="mobileNo" placeholder="Mobile Number" value="{{$UserData[0]->Mobile}}" id="mobileNo">
                                                        </div>
                                                    </div><!-- /.form-group -->
                                                </fieldset>
                                                <fieldset class="step" id="second">
                                                    <div class="form-group">
                                                        <label class="control-label col-lg-2" for="password">Current Password</label>
                                                        <div class="col-lg-10">
                                                            <input type="password" class="form-control updatePass" name="currentPass" placeholder="Your Current Password" id="currentPass">
                                                        </div>
                                                    </div><!-- /.form-group -->
                                                    <div class="form-group">
                                                        <label class="control-label col-lg-2 " for="password">Password</label>
                                                        <div class="col-lg-10">
                                                            <input type="password" class="form-control updatePass" name="pass" placeholder="New Password" id="pass">
                                                        </div>
                                                    </div><!-- /.form-group -->
                                                    <div class="form-group">
                                                        <label class="control-label col-lg-2" for="passVerification">Verified Password</label>
                                                        <div class="col-lg-10">
                                                            <input type="password" class="form-control updatePass" name="pass2" placeholder="Confirm New Password" id="passVerification">
                                                        </div>
                                                    </div><!-- /.form-group -->
                                                </fieldset>
                                                <fieldset class="step" id="third">
                                                    <div class="form-group">
                                                        <label class="control-label col-lg-2" for="theme">Theme</label>
                                                        <div class="col-lg-10">
                                                            <input type="text" class="form-control" name="theme" placeholder="Select Theme Choice" value="{{$UserData[0]->theme}}" id="theme">
                                                        </div>
                                                    </div><!-- /.form-group -->
                                                    <div class="form-group">
                                                        <label class="control-label col-lg-2" for="selectGroup">Group</label>
                                                        <div class="col-lg-10">
                                                            <input type='hidden' class="required" value="{{$UserData[0]->GroupID}},{{$UserData[0]->GroupName}}" name='selectGroup' id='selectGroup'/>
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
{{*Edit Picture Modal*}}
<div id="updateAvatar" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title"><i style='color: #666666' class='fa fa-camera fa-fw fa-1x'></i>Update Picture</h4>
            </div>
            <div class="modal-body">
                <div class="body collapse in" id="div-1">
                    <form class="form-horizontal">

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

                    </form>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" id="updatePictureBtn" data-dismiss="modal">Update</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal --><!-- /#Edit Button Modal -->
{{/block}}
{{block name="scripts"}}
{{js('holder/holder.js')}}
{{js('jquery-form/jquery.form.js')}}
{{js('formwizard/jquery.form.wizard.js')}}
{{js('admin/jasny/jasny-bootstrap.min.js')}}
{{js('jquery-validate/additional-methods.min.js')}}
{{js('jQuery.dotdotdot-master/jquery.dotdotdot.min.js')}}
<script>
    $(document).ready(function(e){
        /*----------- BEGIN formwizard CODE -------------------------*/
        $("#wizardForm").formwizard({
            formPluginEnabled: true,
            validationEnabled: true,
            focusFirstInput: true,
            textSubmit: "Submit and Update",
            remoteAjax : {
                "first" : { // add a remote ajax call when moving next from the first step
                url : '{{base_url()}}admin/usersManageUsers/UpdateUser_firstStepValidation/{{$UserData[0]->UserID}}',
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
                    $.ajax({
                        type:'POST',
                        url:'{{base_url()}}admin/usersManageUsers/UpdateUser_Action/{{$UserData[0]->UserID}}',
                        data:data,
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
                    currentPass:{
                        minlength: 6,
                        skip_or_fill_minimum:[3,".updatePass"]
                    },
                    pass: {
                        minlength: 6,
                        skip_or_fill_minimum:[3,".updatePass"]
                    },
                    pass2: {
                        minlength: 6,
                        equalTo: "#pass",
                        skip_or_fill_minimum:[3,".updatePass"]
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
                        //$("#selectGroup").select2("val", 'Administrator');
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
        function trimLength(str, length) {
            str = $.trim(str); // jQuery required
            str = str.slice(0, length);
            return str;
        }
        $('#updatePictureBtn').on('click', function(e){
            e.preventDefault();
            var formData =  new FormData();
            formData.append('image', $('input[type=file]')[0].files[0]);
            formData.append('u-id', '{{$UserData[0]->UserID}}');
            $.ajax({
                type:'POST',
                url:'{{base_url()}}admin/usersManageUsers/updateUserProfilePicture/',
                data:formData,
                processData: false,
                contentType: false,
                success: function(output){
                    var data = output.split("::");
                    if (data[0] == "OK") {
                        HRS.notification(data[1], data[2]);
                        var file = $('input[type=file]')[0].files[0];
                        if(file){
                            var oFReader = new FileReader();
                            oFReader.readAsDataURL(file);
                            oFReader.onload = function (oFREvent) {
                                $('div.avatar a img.user').attr('src',oFREvent.target.result);
                            }
                        }
                    }
                    else if(data[0]=="FAIL") {
                        HRS.notification(data[1], data[2]);
                    }
                }
            });
        });
    });
</script>
{{/block}}