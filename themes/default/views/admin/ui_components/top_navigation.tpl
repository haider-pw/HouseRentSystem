{{foreach $allowed_menus as $key=>$value}}
    {{$userTabs[$value->TabOrder]['TabName'] = $value->TabName}}
    {{$userTabs[$value->TabOrder]['TabDesc'] = $value-TabDesc}}
    {{/foreach}}

<ul class="nav navbar-nav">
{{foreach $userTabs as $tab}}
    <li class="active"><a href="{{url}}admin/dashboard/{{$tab['TabName']}}/">{{$tab['TabName']}}</a></li>
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