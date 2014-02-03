{{foreach $allowed_menus as $key=>$value}}
    {{$userTabs[$value->TabOrder]['TabName'] = $value->TabName}}
    {{$userTabs[$value->TabOrder]['TabDesc'] = $value-TabDesc}}
    {{/foreach}}

<ul class="nav navbar-nav">
    $tab_arr = json_encode($userTabs);
{{foreach $userTabs as $tab}}
    <li class="active"><a href="#" id="{{$tab['TabName']}}" onclick="javascript:view({{print_r($tab_arr)}},this.id,'{{$userTabs[$value->TabOrder]['TabName']}}')">{{$tab['TabName']}}</a></li>
{{/foreach}}
{{*    <li class="active">
        <a href="dashboard.html">{{print_r($allowed_menus)}}</a>
    </li>
    <li> <a href="table.html">Property Management</a> </li>
    <li> <a href="file.html">File Manager</a> </li>
    <li class='dropdown '>
        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
            Form Elements
            <b class="caret"></b>
        </a>
        <ul class="dropdown-menu">
            <li> <a href="form-general.html">General</a> </li>
            <li> <a href="form-validation.html">Validation</a> </li>
            <li> <a href="form-wysiwyg.html">WYSIWYG</a> </li>
            <li> <a href="form-wizard.html">Wizard &amp; File Upload</a> </li>
        </ul>
    </li>*}}
</ul>
<script type='text/javascript' language='javascript'>
    //-- function for loading dashboard , menu when clicked on tab --//
    function view(tab_arr,str,value)
    {
        $.each(tab_arr,function(key,value){
            if(value == str)
            { document.getElementById(str).className = "active";}
            else
            { document.getElementById(value).className = "";}
        });

        $.ajax({
            type: 'post',
            url: '<?php echo base_url()?>index.php/main/'+str+'/',
            success: function(response){
                $('#current_page_title').html("<?php echo $this->lang->line('zk_Welcometo'); ?> " + value.toUpperCase());
                $('.content_container').html(response);
            }
        });
    }
    //--- End of view function ---//
</script>