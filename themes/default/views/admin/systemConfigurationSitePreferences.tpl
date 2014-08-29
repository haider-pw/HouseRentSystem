{{extends file='adminLayout.tpl'}}
{{block name="header"}}
    <title>{{$title}}</title>
    {{css('admin/jasny/jasny-bootstrap.min.css')}}
{{/block}}
{{block name="content"}}
    {{foreach $data as $key =>$row}}
        {{$sKey[$row->settingsKey] = $row->settingsValue}}
    {{/foreach}}
    <div class="outer">
    <div class="inner">
        {{*This is the Main Box in which There will others form Data will reside*}}
    <div class="row ui-sortable">

        <div class="col-lg-3">
            <div class="box">
                <header>
                    <div class="icons">
                        <i class="fa fa-table"></i>
                    </div>
                    <h5>Social Media Settings</h5>
                </header>
                <div class="body" id="collapse4">
                    {{*Content of the Form*}}
                    <form class="form-horizontal" id="editTabModelForm">
                        <input type="hidden"
                               id="tabID"> {{*This field is for hidden ID, as HiddenID will be needed to update the form*}}
                        <div class="form-group">
                            <label for="cp3" class="control-label col-lg-4">Facebook</label>

                            <div class="col-lg-8">
                                <div class="input-group color">
                                    <input type="text" class="form-control jqUpdate" value="{{$sKey['facebookLink']}}" name="facebookLink" placeholder="Facebook Link"
                                           data-color="rgb(255, 146, 180)" data-color-format="rgb" id="facebookLink">
                                    <span class="input-group-addon" style="background-color: rgb(59, 89, 152)"><i
                                                style="color: #fff;" class="fa fa-facebook-square"></i></span>
                                </div>
                                <!-- /input-group -->
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="cp3" class="control-label col-lg-4">Google Plus</label>

                            <div class="col-lg-8">
                                <div class="input-group color">
                                    <input type="text" class="form-control jqUpdate" value="{{$sKey['googlePlusLink']}}" name="googlePlusLink" placeholder="Google Plus Link"
                                           data-color="rgb(255, 146, 180)" data-color-format="rgb" id="googlePlusLink">
                                    <span class="input-group-addon" style="background-color: rgb(211, 72, 54)"><i
                                                style="color: #fff;" class="fa fa-google-plus"></i></span>
                                </div>
                                <!-- /input-group -->
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="cp3" class="control-label col-lg-4">Twitter</label>

                            <div class="col-lg-8">
                                <div class="input-group color">
                                    <input type="text" class="form-control jqUpdate" value="{{$sKey['twitterLink']}}" name="twitterLink" placeholder="Twitter Link"
                                           data-color="rgb(255, 146, 180)" data-color-format="rgb" id="twitterLink">
                                    <span class="input-group-addon" style="background-color: rgb(0, 172, 237)"><i
                                                style="color: #fff;" class="fa fa-twitter"></i></span>
                                </div>
                                <!-- /input-group -->
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="cp3" class="control-label col-lg-4">Youtube</label>
                            <div class="col-lg-8">
                                <div class="input-group color">
                                    <input type="text" class="form-control jqUpdate" value="{{$sKey['youtubeLink']}}" name="youtubeLink" placeholder="Youtube Link"
                                           data-color="rgb(255, 146, 180)" data-color-format="rgb" id="youtubeLink">
                                    <span class="input-group-addon" style="background-color: rgb(187, 0, 0)"><i
                                                style="color: #fff;" class="fa fa-youtube-play"></i></span>
                                </div>
                                <!-- /input-group -->
                            </div>
                        </div>
                    </form>
                    {{*End of the Content*}}
                </div>
            </div>
        </div>

        <div class="col-lg-9">
            <div class="box">
                <header>
                    <div class="icons">
                        <i class="fa fa-table"></i>
                    </div>
                    <h5>Site Settings</h5>
                </header>
                <div class="body" id="collapse4">
                    {{*Content of the Form*}}
                    <form class="form-horizontal" id="editTabModelForm" enctype="multipart/form-data">
                        <input type="hidden" id="tabID"> {{*This field is for hidden ID, as HiddenID will be needed to update the form*}}
                        <div class="form-group">
                            <label class="control-label col-lg-2" for="text1">Site Name</label>
                            <div class="col-lg-10">
                                <input type="text" class="form-control jqUpdate" value="{{$sKey['siteName']}}" name="siteName" placeholder="Site Name" id="siteName">
                            </div>
                        </div><!-- /.form-group -->
                        <div class="form-group">
                            <label class="control-label col-lg-2">Site Logo</label>
                            <div class="col-lg-10">
                                <div class="fileinput fileinput-new input-group" data-provides="fileinput">
                                    <div class="form-control" data-trigger="fileinput"><i class="glyphicon glyphicon-file fileinput-exists"></i> <span class="fileinput-filename"></span></div>
                                    <span class="input-group-addon btn btn-default btn-file"><span class="fileinput-new">Select file</span><span class="fileinput-exists">Change</span><input type="file" name="siteLogo"></span>
                                    <a href="#" class="input-group-addon btn btn-default fileinput-exists" data-dismiss="fileinput">Remove</a>
                                </div>
                            </div>
                        </div><!-- /.form-group -->
                        <div class="form-group">
                            <label class="control-label col-lg-2">Favicon</label>
                            <div class="col-lg-10">
                                <div class="fileinput fileinput-new input-group" data-provides="fileinput">
                                    <div class="form-control" data-trigger="fileinput"><i class="glyphicon glyphicon-file fileinput-exists"></i> <span class="fileinput-filename"></span></div>
                                    <span class="input-group-addon btn btn-default btn-file"><span class="fileinput-new">Select file</span><span class="fileinput-exists">Change</span><input type="file" name="favicon"></span>
                                    <a href="#" class="input-group-addon btn btn-default fileinput-exists" data-dismiss="fileinput">Remove</a>
                                </div>
                            </div>
                        </div><!-- /.form-group -->
                        <div class="form-group">
                            <label class="control-label col-lg-2" for="pass1">Copyright</label>
                            <div class="col-lg-10">
                                <input type="text" data-placement="top" value="{{$sKey['copyright']}}" name="copyright" placeholder="Website Copyrights" id="copyright" class="form-control jqUpdate">
                            </div>
                        </div><!-- /.form-group -->
                    </form>
                    {{*End of the Content*}}
                </div>
            </div>
        </div>


        <div class="col-lg-12">
            <div class="box">
                <header>
                    <div class="icons">
                        <i class="fa fa-table"></i>
                    </div>
                    <h5>Contact Details</h5>
                </header>
                <div class="body" id="collapse4">
                    {{*Content of the Form*}}
                    <form class="form-horizontal" id="editTabModelForm">
                        <input type="hidden" id="tabID"> {{*This field is for hidden ID, as HiddenID will be needed to update the form*}}
                        <div class="form-group">
                            <label class="control-label col-lg-2" for="text1">Name</label>
                            <div class="col-lg-10">
                                <input type="text" class="form-control jqUpdate" value="{{$sKey['contactName']}}" name="contactName" placeholder="Name" id="contactName">
                            </div>
                        </div><!-- /.form-group -->
                        <div class="form-group">
                            <label class="control-label col-lg-2" for="pass1">Phone</label>
                            <div class="col-lg-10">
                                <input type="text" data-placement="top" value="{{$sKey['contactPhone']}}" name="contactPhone" placeholder="Phone" id="contactPhone" class="form-control jqUpdate">
                            </div>
                        </div><!-- /.form-group -->
                        <div class="form-group">
                            <label class="control-label col-lg-2" for="pass1">Mobile</label>
                            <div class="col-lg-10">
                                <input type="text" data-placement="top" name="contactMobile" value="{{$sKey['contactMobile']}}" placeholder="Mobile" id="contactMobile" class="form-control jqUpdate">
                            </div>
                        </div><!-- /.form-group -->
                        <div class="form-group">
                            <label class="control-label col-lg-2" for="pass1">Fax</label>
                            <div class="col-lg-10">
                                <input type="text" data-placement="top" value="{{$sKey['contactFax']}}" name="contactFax" placeholder="Fax" id="contactFax" class="form-control jqUpdate">
                            </div>
                        </div><!-- /.form-group -->
                        <div class="form-group">
                            <label class="control-label col-lg-2">Address</label>
                            <div class="col-lg-10">
                                <textarea class="form-control jqUpdate" name="contactAddress" id="contactAddress" placeholder="Address">{{$sKey['contactAddress']}}</textarea>
                            </div>
                        </div><!-- /.form-group -->
                    </form>
                    {{*End of the Content*}}
                </div>
            </div>
        </div>

    </div>
{{* End of the Main Box*}}
    </div>
    </div>
{{/block}}
{{block name="scripts"}}
    {{js('admin/jasny/jasny-bootstrap.min.js')}}
    <script>

        $(document).ready(function(e){
            var selectors = $('input.jqUpdate, textarea.jqUpdate');
            var foUrl = "{{base_url()}}admin/configurations/UpdateSiteSettings/";
            HRS.focusOutUpdate(selectors,foUrl);

            /*Now we will Work with the File Upload Fields.*/
            // Variable to store your files
            var files;
// Add events
            $('input[type=file]').on('change', function(e){
                files = e.target.files;
                e.stopImmediatePropagation(); // Stop stuff happening
                e.preventDefault(); // Totally stop stuff happening

// START A LOADING SPINNER HERE

// Create a formdata object and add the files
                var data = new FormData();
                console.log(files);
                var textBoxName = $(this).attr("name");
                var data2 ={
                    field: textBoxName
                };
                $.each(data2, function(key, value)
                {
                    data.append(key, value);
                });
                $.each(files, function(key, value)
                {
                    data.append(key, value);
                });

                $.ajax({
                    url: '{{base_url()}}admin/configurations/UploadFiles/',
                    type: 'POST',
                    data: data,
                    cache: false,
                    dataType: 'json',
                    processData: false, // Don't process the files
                    contentType: false, // Set content type to false as jQuery will tell the server its a query string request
                    success: function(data, textStatus, jqXHR)
                    {
                        if(typeof data.error === 'undefined')
                        {
// Success so call function to process the form
                            //submitForm(event, data);
                            console.log('it says undefined.');
                        }
                        else
                        {
// Handle errors here
                            console.log('ERRORS: ' + data.error);
                        }
                    },
                    error: function(jqXHR, textStatus, errorThrown)
                    {
// Handle errors here
                        console.log('ERRORS: ' + textStatus);
// STOP LOADING SPINNER
                    }
                });
            });

// Grab the files and set them to our variable




        });

    </script>
{{/block}}