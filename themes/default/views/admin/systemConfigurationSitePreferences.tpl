{{extends file='adminLayout.tpl'}}
{{block name="header"}}
    <title>{{$title}}</title>
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
                                    <input type="text" class="form-control" value="{{$sKey['facebookLink']}}" name="facebookLink" placeholder="Facebook Link"
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
                                    <input type="text" class="form-control" value="{{$sKey['googlePlusLink']}}" name="googlePlusLink" placeholder="Google Plus Link"
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
                                    <input type="text" class="form-control" value="{{$sKey['twitterLink']}}" name="twitterLink" placeholder="Twitter Link"
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
                                    <input type="text" class="form-control" value="{{$sKey['youtubeLink']}}" name="youtubeLink" placeholder="Youtube Link"
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
                    <form class="form-horizontal" id="editTabModelForm">
                        <input type="hidden" id="tabID"> {{*This field is for hidden ID, as HiddenID will be needed to update the form*}}
                        <div class="form-group">
                            <label class="control-label col-lg-2" for="text1">Site Name</label>
                            <div class="col-lg-10">
                                <input type="text" class="form-control required" value="{{$sKey['siteName']}}" name="SiteName" placeholder="Site Name" id="siteName">
                            </div>
                        </div><!-- /.form-group -->
                        <div class="form-group">
                            <label class="control-label col-lg-2" for="pass1">Site Logo</label>
                            <div class="col-lg-10">
                                <input type="text" data-placement="top" name="SiteLogo" placeholder="Site Logo" id="siteLogo" class="form-control required">
                            </div>
                        </div><!-- /.form-group -->
                        <div class="form-group">
                            <label class="control-label col-lg-2" for="pass1">Favicon</label>
                            <div class="col-lg-10">
                                <input type="text" data-placement="top" name="validNumber" placeholder="Tab Order" id="tabOrder" class="form-control required">
                            </div>
                        </div><!-- /.form-group -->
                        <div class="form-group">
                            <label class="control-label col-lg-2" for="pass1">Copyright</label>
                            <div class="col-lg-10">
                                <input type="text" data-placement="top" name="validNumber" placeholder="Tab Order" id="tabOrder" class="form-control required">
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
                                <input type="text" class="form-control" name="ContactName" placeholder="Name" id="contactName">
                            </div>
                        </div><!-- /.form-group -->
                        <div class="form-group">
                            <label class="control-label col-lg-2" for="pass1">Phone</label>
                            <div class="col-lg-10">
                                <input type="text" data-placement="top" name="validNumber" placeholder="Phone" id="contactPhone" class="form-control">
                            </div>
                        </div><!-- /.form-group -->
                        <div class="form-group">
                            <label class="control-label col-lg-2" for="pass1">Mobile</label>
                            <div class="col-lg-10">
                                <input type="text" data-placement="top" name="validNumber" placeholder="Mobile" id="contactMobile" class="form-control">
                            </div>
                        </div><!-- /.form-group -->
                        <div class="form-group">
                            <label class="control-label col-lg-2" for="pass1">Fax</label>
                            <div class="col-lg-10">
                                <input type="text" data-placement="top" name="ContactFax" placeholder="Fax" id="contactFax" class="form-control">
                            </div>
                        </div><!-- /.form-group -->
                        <div class="form-group">
                            <label class="control-label col-lg-2">Address</label>
                            <div class="col-lg-10">
                                <textarea class="form-control" name="ContactAddress" id="contactAddress" placeholder="Address"></textarea>
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
    <script>
        $(document).ready(function(e){
            $('#facebookLink, #googlePlusLink, #twitterLink, #youtubeLink').focusin(function(e){
                $(this).change(function(e){
                    e.stopImmediatePropagation();
                   $(this).attr("data-changed", true);
                    var textBoxName = $(this).attr("name");
                    var data = {
                        name: $(this).val()
                    };
                    $.ajax({
                        type:"post",
                        url:"{{base_url()}}admin/configurations/UpdateSiteSettings/"+textBoxName,
                        data: data,
                        success: function(output){
                            var data = output.split("::");
                            if(data[0]=="OK"){
                                HRS.notification(data[1],data[2]);
                            }
                            else if(data[0]=="FAIL"){
                                HRS.notification(data[1],data[2]);
                            }

                        }
                    });
               });
            });/*
            $('#facebookLink').focusout(function(e){
                console.log('my focus is out');
            });*/
        });
    </script>
{{/block}}