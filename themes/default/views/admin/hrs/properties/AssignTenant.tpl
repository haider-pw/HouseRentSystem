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
                    <h5>Assign Tenant To Property</h5>
                </header>
                <div class="body" id="collapse4">
                    {{*User Profile*}}
                    <div class="row ui-sortable">
                        <div class="col-lg-12">
                            <div class="row ui-sortable">
                                <div class="col-lg-12">
                                    {{*Panel Code Here*}}
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h3 class="panel-title">Personal Information</h3>
                                        </div>
                                        <div class="panel-body">
                                            {{*Form Start Here*}}
                                            <form class="form-horizontal wizardForm" id="wizardForm" enctype="multipart/form-data" method="post">
                                             {{*Step 1   *}}
                                                <fieldset class="step" id="first">
                                                    <div class="form-group">
                                                        <label class="control-label col-lg-2">Select Tenant</label>
                                                        <div class="col-lg-10">
                                                            <input type='hidden' class="required" name='selectTenant' id='selectTenant'/>
                                                        </div>
                                                    </div><!-- /.form-group -->
                                                    <div class="form-group">
                                                        <label class="control-label col-lg-2" for="fullName">Referenced By</label>
                                                        <div class="col-lg-6">
                                                            <div class="radio">
                                                                <label>
                                                                    <input class="make-switch required" id="directReference" value="directReference" type="radio" name="referencedBy" data-on-color="success" data-on-text="Yes" data-off-text="NO" data-off-color="danger">
                                                                    Directly
                                                                </label>
                                                            </div>
                                                            <div class="radio">
                                                                <label>
                                                                    <input class="make-switch required" id="thirdParty" value="thirdParty" type="radio" name="referencedBy" data-on-color="success" data-on-text="Yes" data-off-text="NO" data-off-color="danger">
                                                                    Third Party
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-4" id="referencedByDiv" style="display: none;">

                                                        </div>
                                                    </div><!-- /.form-group -->
                                                </fieldset>
                                        {{*Step 2*}}
                                                <fieldset class="step" id="second">
                                                    <div class="form-group">
                                                        <label class="control-label col-lg-2" for="securityDeposit">Security Deposit</label>
                                                        <div class="col-lg-10">
                                                            <input type="text" class="form-control required" name="securityDeposit" placeholder="Security Deposit" id="securityDeposit">
                                                        </div>
                                                    </div><!-- /.form-group -->
                                                    <div class="form-group">
                                                        <label class="control-label col-lg-2" for="downPayment">Down Payment</label>
                                                        <div class="col-lg-10">
                                                            <input type="text" class="form-control" name="downPayment" placeholder="Down Payment" id="downPayment">
                                                        </div>
                                                    </div><!-- /.form-group -->
                                                    <div class="form-group">
                                                        <label class="control-label col-lg-2" for="startingRent">Rent</label>
                                                        <div class="col-lg-10">
                                                            <input type="text" class="form-control required" name="startingRent" placeholder="Rent" id="startingRent">
                                                        </div>
                                                    </div><!-- /.form-group -->
                                                   {{*The Image/PDF Upload Section*}}
                                                    <div class="form-group">
                                                        <label class="control-label col-lg-2">Agreement Copy</label>
                                                        <div class="col-lg-10">
                                                            <div class="fileinput fileinput-new input-group" data-provides="fileinput" id="fileInputSiteLogo">
                                                                <div class="form-control" data-trigger="fileinput"><i class="glyphicon glyphicon-file fileinput-exists"></i> <span class="fileinput-filename"></span></div>
                                                                    <span class="input-group-addon btn btn-default btn-file"><span class="fileinput-new">Select file</span><span class="fileinput-exists">Change</span>
                                                                        <input type="file" id="file" name="agreementCopy" accept="image/jpg,image/png,image/jpeg,image/gif,application/pdf" />
                                                                    </span>
                                                                <a href="#" class="input-group-addon btn btn-default fileinput-exists" data-dismiss="fileinput" id="fileRemove">Remove</a>
                                                            </div>
                                                        </div>
                                                    </div><!-- /.form-group -->
                                                    {{*End of Image/PDF Upload Section*}}
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
{{*Add New Property Dealer Modal*}}
<div id="addNewPropertyDealerModal" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title"><i style='color: #666666' class='fa fa-edit fa-fw fa-1x'></i>Edit</h4>
            </div>
            <div class="modal-body">
                <div class="body collapse in" id="div-1">
                    <form class="form-horizontal" id="addNewPropertyDealerForm">
                        <input type="hidden" id="formID">
                        <div class="form-group">
                            <label class="control-label col-lg-4" for="text1">Company Name</label>
                            <div class="col-lg-8">
                                <input type="text" class="form-control required" name="companyName" placeholder="Company Name" id="companyName">
                            </div>
                        </div><!-- /.form-group -->
                        <div class="form-group">
                            <label class="control-label col-lg-4" for="pass1">Agent Name</label>
                            <div class="col-lg-8">
                                <input type="text" name="agentName" placeholder="Agent Name" id="agentName" class="form-control required">
                            </div>
                        </div><!-- /.form-group -->
                        <div class="form-group">
                            <label class="control-label col-lg-4">CNIC</label>
                            <div class="col-lg-8">
                                <input type="text" class="form-control" name="cnic" id="cnic" placeholder="CNIC">
                            </div>
                        </div><!-- /.form-group -->

                        <div class="form-group">
                            <label class="control-label col-lg-4">Mobile</label>
                            <div class="col-lg-8">
                                <input type="text" class="form-control" name="mobileNo" id="mobileNo" placeholder="Mobile Number">
                            </div>
                        </div><!-- /.form-group -->
                        <div class="form-group">
                            <label class="control-label col-lg-4">Email</label>
                            <div class="col-lg-8">
                                <input type="text" class="form-control" name="email" id="email" placeholder="Email Address">
                            </div>
                        </div><!-- /.form-group -->
                    </form>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" id="addNewPropertyDealerBtn" data-dismiss="modal">Create</button>
                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal --><!-- /#Edit Button Modal -->
{{/block}}
{{block name="scripts"}}
    {{js('jquery-form/jquery.form.js')}}
    {{js('formwizard/jquery.form.wizard.js')}}
    {{js('admin/jasny/jasny-bootstrap.min.js')}}
    {{js('jquery-validate/additional-methods.min.js')}}
    <script>
        $(document).ready(function(e){
            {{*The Selector for Selecting the User Group*}}
            var selector = $('#selectTenant');
            var url = "{{base_url()}}admin/properties/loadAllTenants/";
            var tDataValues = {
                id: "TenantID",
                text: "FullName",
                username: "Username",
                cnic: 'CNIC',
                avatar:'Avatar',
                userid: 'UserID'
            }
            var minInputLength = 0;
            var placeholder = "Select User Group";
            var baseURL = "{{url}}";
            var templateLayoutFunc = function format(e) {
                if (!e.id) return e.text;
                if (e.avatar === "defaultAvatar.jpg") {
                    return "<div class='select2TemplateImg'><span class='helper'></span> <img class='flag' src='" + baseURL + "uploads/users/d/defaultAvatar.jpg'/></div><div class='select2TemplateText'><p> " + e.text + "</p><p>" + e.username + "</p><p>" + e.cnic + "</p></div>"
                } else if (e.avatar != "defaultAvatar.jpg") {
                    return "<div class='select2TemplateImg'><span class='helper'></span> <img class='flag' src='" + baseURL + "uploads/users/" + e.userid + "/" + e.avatar + "'/></div><div class='select2TemplateText'><p> " + e.text + "</p><p>" + e.username + "</p><p>" + e.cnic + "</p></div>"
                }
            };
            var templateLayout = templateLayoutFunc.toString();
            commonSelect2Templating(selector,url,tDataValues,minInputLength,placeholder,baseURL,templateLayout);
            $('.select2-container').css("width","100%");
            //End of the CommonSelect2 function
function selectPropertyDealer(){
            {{*The Selector for Selecting the User Group*}}
            var selector = $('#selectThirdParty');
            var url = "{{base_url()}}admin/properties/loadAllPropertyDealers/";
            var tDataValues = {
                id: "PDID",
                text: "FullName",
                cnic: 'CNIC',
                mobile:'MobileNo',
                company: 'CompanyName'
            }
            var minInputLength = 0;
            var placeholder = "Select Property Dealer";
            var baseURL = "{{url}}";
            var templateLayoutFunc = function format(state) {
                    return "<div class='select2TemplateText'><p> " + state.text + "</p><p>" + state.company + "</p><p>" + state.cnic + "</p></div>"
            };
            var templateLayout = templateLayoutFunc.toString();
            commonSelect2Templating(selector,url,tDataValues,minInputLength,placeholder,baseURL,templateLayout);
            $('.select2-container').css("width","100%");
            //End of the CommonSelect2 function
}

            //Radio Button On this Form
            $('input[name="referencedBy"]').on('switchChange.bootstrapSwitch', function(event, state) {
                var radioValue = $(this).val();
                if(radioValue === 'directReference'){
                    $('#referencedByDiv').css('display','inline-block');
                    $('#referencedByDiv').html("<input type='text' id='referencedByInputText' class='form-control'><span style='display: block;text-align: right;'>(optional)</span>");
                }
                else if(radioValue === 'thirdParty'){
                    $('#referencedByDiv').css('display','inline-block');
                    $('#referencedByDiv').html("<input type='hidden' class='required' name='selectThirdParty' id='selectThirdParty'/><span style='display: block;text-align: right;margin-top: 5px;'><a href='#addNewPropertyDealerModal' data-toggle='modal' class='btn btn-primary btn-xs'><span class='fa fa-plus'></span> Add New</a></span>");
                    selectPropertyDealer();
                }
            });
            //End of Radio Buttons
            $('#addNewPropertyDealerBtn').on('click',function(e){
                    var formData = $('#addNewPropertyDealerForm').serialize();
                $.ajax({
                    url: "{{url}}admin/properties/addNewPropertyDealer/",
                    data: formData,
                    type:"POST",
                    success: function(output){
                        var data = output.split('::');
                        if(data[0]==='OK'){
                            HRS.notification(data[1],data[2]);
                            var PDID = data[3];
                            var PDName = $('#agentName').val();
                            var select2Val = PDID+","+PDName;
                            $('#addNewPropertyDealerForm')[0].reset();
                            $("#selectThirdParty").select2("val", select2Val); //set the value
                        }else if(data[0] === 'FAIL'){
                            HRS.notification(data[1],data[2]);
                            $('#addNewPropertyDealerForm')[0].reset();
                        }
                    }
                });
            });

            /*----------- BEGIN formwizard CODE -------------------------*/
            var wizardForm = $("#wizardForm").formwizard({
                formPluginEnabled: true,
                validationEnabled: true,
                focusFirstInput: true,
                textSubmit: "Submit and Create",
                formOptions: {
                    beforeSubmit: function(data) {
                        var file = $("#file")[0].files[0];
                        var referenceState = function(){
                            var directReference = $('#directReference').bootstrapSwitch('state');
                            var thirdParty = $('#thirdParty').bootstrapSwitch('state');
                            if(directReference === true){
                                return 'directReference';
                            }
                            else if(thirdParty === true){
                                return 'thirdParty';
                            }
                            else{
                                return 'none';
                            }
                        };
                        var getCurrentState = referenceState();
                        //data.append(file);
                        var formData = new FormData();
                        formData.append('tenantID', $('#selectTenant').val());
                        formData.append('securityDeposit', $('#securityDeposit').val());
                        formData.append('downPayment', $('#downPayment').val());
                        formData.append('startingRent', $('#startingRent').val());
                        formData.append('state', getCurrentState);
                        formData.append('resID', '{{$propertyID}}');
                        if(getCurrentState === 'directReference'){
                            formData.append('referenceName', $('#referencedByInputText').val());
                        }
                        else if (getCurrentState === 'thirdParty'){
                            formData.append('thirdParty', $('#selectThirdParty').val());
                        }
                        formData.append('image', $('input[type=file]')[0].files[0]);
                        $.ajax({
                            type:'POST',
                            url:'{{base_url()}}admin/properties/assignTenantToProperty/',
                            data:formData,
                            processData: false,
                            contentType: false,
                            success: function(output){
                                var data = output.split("::");
                                if (data[0] == "OK") {
                                    HRS.notification(data[1], data[2]);
                                    setTimeout(function () {
                                        window.location.href = "{{url}}admin/properties/RentingProperties"; //will redirect to your blog page (an ex: blog.html)
                                    }, 2000);
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
                        selectTenant:{
                            required:true
                        },
                        securityDeposit: {
                            required: true,
                            digits:true
                        },
                        downPayment: {
                            required: false,
                            digits:true
                        },
                        startingRent: {
                            required: true,
                            digits:true
                        },
                        agreementCopy: {
                            required: true,
                            accept: "image/jpg,image/jpeg,image/png,image/gif,application/pdf",
                            extension:"jpg,jpeg,png,gif,pdf"
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
            /*----------- END form wizard CODE -------------------------*/
        });
        </script>
{{/block}}