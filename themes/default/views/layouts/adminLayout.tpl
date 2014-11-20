<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">


    <!--Mobile first-->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!--IE Compatibility modes-->
    {{*<meta http-equiv="X-UA-Compatible" content="IE=edge">*}}
    <meta http-equiv="content-type" content="text/html" charset="utf-8">
    <meta name="msapplication-TileColor" content="#5bc0de">
    <meta name="msapplication-TileImage" content="assets/img/metis-tile.png">

    <!-- Bootstrap -->
    {{css('bootstrap/css/bootstrap.min.css')}}

    <!-- Bootstrap Theme -->
    {{css('bootstrap/css/bootstrap-theme.min.css')}}

    <!-- Bootstrap Switch -->
    {{css('bootstrap/css/bootstrap-switch.min.css')}}

    <!-- Select2 Dropdown API -->
    {{css('select/select2.css')}}

    <!-- Data Tables -->
    {{css('datatables/dataTables.bootstrap.css')}}

    <!-- Data Tables Responsive -->
    {{css('datatables/dataTables.responsive.css')}}

    <!-- Font Awesome -->
    {{css('admin/Font-Awesome/font-awesome.min.css')}}

    <!-- Metis core stylesheet -->
    {{css('admin/main.css')}}
    {{css('admin/theme.css')}}
    {{css('admin/fullcalendar/fullcalendar.css')}}

    {{css('validationEngine/validationEngine.jquery.css')}}

    {{css('admin/animate/animate.css')}}
    {{block name="header"}}
    {{/block}}

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->

    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->

    <!--[if lt IE 9]>
    {{js('admin/html5shiv/html5shiv.js')}}
    <script src="assets/lib/respond/respond.min.js"></script>
    <![endif]-->

    <!--Modernizr 3.0-->
    {{js('admin/modernizr-build.min.js')}}
</head>
<body>
<div id="wrap">
<div id="top">
    <!-- .navbar -->
    <nav class="navbar navbar-inverse navbar-static-top  bounce animated">

        <!-- Brand and toggle get grouped for better mobile display -->
        <header class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a href="{{url}}" class="navbar-brand">
                {{image('admin/logo.png')}}
            </a>
        </header>
        <div class="topnav">
            <div class="btn-toolbar">
                <div class="btn-group">
                    <a data-placement="bottom" data-original-title="Show / Hide Sidebar" data-toggle="tooltip" class="btn btn-success btn-sm" id="changeSidebarPos">
                        <i class="fa fa-expand"></i>
                    </a>
                </div>

                <div class="btn-group">

                    <a data-placement="bottom" data-original-title="E-mail" data-toggle="dropdown" class="btn btn-default btn-sm dropdown-toggle">
                        <i class="fa fa-envelope"></i>
                        <span class="label label-warning">5</span>
                    </a>
                    <ul role="menu" class="dropdown-menu" id="inboxmenu" >
                        <li class="ToolsHeader"><strong>Messages</strong><span> <strong>(5)</strong></span>
                        </li>

                        <li><a href="#"><i class="fa fa-envelope-o fa-2x"></i><strong> Message from User 1</strong></a>
                            <ul>
                                <li>Hi This is user 1 message.</li>
                            </ul>
                        </li>
                        <li><a href="#"><i class="fa fa-envelope-o fa-2x"></i><strong> Message from User 2</strong></a>
                            <ul>
                                <li>Hi This is user 2 message.</li>
                            </ul>
                        </li>
                        <li><a href="#"><i class="fa fa-envelope-o fa-2x"></i><strong> Message from User 3</strong></a>
                            <ul>
                                <li>Hi This is user 3 message.</li>
                            </ul>
                        </li>
                        <li><a href="#"><i class="fa fa-envelope-o fa-2x"></i><strong> Message from User 4</strong></a>
                            <ul>
                                <li>Hi This is user 4 message.</li>
                            </ul>
                        </li>

                        <li><a href="#"><i class="fa fa-envelope-o fa-2x"></i><strong> Message from User 5</strong></a>
                            <ul>
                                <li>Hi This is user 5 message.</li>
                            </ul>
                        </li>

                        <li class="ToolsFooter"><a href="#">Goto Inbox</a>
                        </li>
                    </ul>
                    <a data-placement="bottom" data-original-title="Messages" href="#" data-toggle="tooltip" class="btn btn-default btn-sm"  >
                        <i class="fa fa-comments"></i>
                        <span class="label label-danger">4</span>
                    </a>


                </div>
                <div class="btn-group">
                    <a data-placement="bottom" data-original-title="Document" href="#" data-toggle="tooltip" class="btn btn-default btn-sm">
                        <i class="fa fa-file"></i>
                    </a>
                    <a data-toggle="modal" data-original-title="Help" data-placement="bottom" class="btn btn-default btn-sm" href="#helpModal">
                        <i class="fa fa-question"></i>
                    </a>
                </div>
                <div class="btn-group">
                    <a href="{{url}}user_management/userLogin/logout" data-toggle="tooltip" data-original-title="Logout" data-placement="bottom" class="btn btn-metis-1 btn-sm">
                        <i class="fa fa-power-off"></i>
                    </a>
                </div>
            </div>
        </div><!-- /.topnav -->
        <div class="collapse navbar-collapse navbar-ex1-collapse">

            <!-- .nav -->
            {{include file="{{getBasePath()}}/themes/{{$themeName}}/views/admin/ui_components/top_navigation.tpl" name="top navigation"}}
<!-- /.nav -->
        </div>
    </nav><!-- /.navbar -->

    <!-- header.head -->
    <header class="head">
        <div class="search-bar">
            <a data-original-title="Show/Hide Menu" data-placement="bottom" data-tooltip="tooltip" class="accordion-toggle btn btn-primary btn-sm visible-xs" data-toggle="collapse" href="#menu" id="menu-toggle">
                <i class="fa fa-expand"></i>
            </a>
            <form class="main-search">
                <div class="input-group">
                    <input type="text" class="input-small form-control" placeholder="Live Search ...">
                <span class="input-group-btn">
                                    <button class="btn btn-primary btn-sm text-muted" type="button"><i class="fa fa-search"></i></button>
                                </span>
                </div>
            </form>
        </div>

        <!-- ."main-bar -->
        <div class="main-bar">
            <h3>
                <i class="fa fa-dashboard"></i>Dashboard</h3>
        </div><!-- /.main-bar -->
    </header>

    <!-- end header.head -->
</div><!-- /#top -->
<div id="left">
{{include file="{{getBasePath()}}/themes/{{$themeName}}/views/admin/ui_components/user-media.tpl" name="user media"}}
<!-- #menu -->
{{include file="{{getBasePath()}}themes/{{$themeName}}/views/admin/ui_components/left_menu.tpl" name="left menus"}}
</div><!-- /#left -->
<div id="content">
    {{block name="content"}}{{/block}}

</div>

<!-- end #content -->
</div><!-- /#wrap -->
<div id="footer">
    <p>2013 &copy; Comfy Admin</p>
</div>

<!-- #helpModal -->
<div id="helpModal" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">Modal title</h4>
            </div>
            <div class="modal-body">
                <p>
                    Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor
                    in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
                </p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal --><!-- /#helpModal -->
{{js('jQuery_v1.10.2.js')}}
{{js('bootstrap/bootstrap.min.js')}}
{{js('bootstrap/bootstrap-switch.min.js')}}
{{js('jquery-ui.min.js')}}
{{js('select/select2.js')}}
{{js('datatables/jquery.dataTables.js')}}
{{js('datatables/3/dataTables.bootstrap.js')}}
{{js('datatables/dataTables.responsive.js')}}
{{js('admin/fullcalendar/fullcalendar.min.js')}}
{{js('admin/tablesorter/jquery.tablesorter.min.js')}}
{{js('admin/sparkline/jquery.sparkline.min.js')}}
{{js('validationEngine/jquery.validationEngine.js')}}
{{js('jquery-validate/jquery.validate.js')}}
{{js('noty/packaged/jquery.noty.packaged.min.js')}}
{{*{{js('jquery-validate/src/localization/messages_ja.js')}}*}}

{{js('admin/main.min.js')}}
{{js('HouseRentSystem.js')}}
{{js('admin/custom.js')}}
<script>
    $(document).ready(function(e){
       HRS.checkboxSwitches();
    });
</script>
{{block name="scripts"}}{{/block}}

</body>
</html>