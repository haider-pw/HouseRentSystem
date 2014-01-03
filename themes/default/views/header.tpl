<!DOCTYPE HTML>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8">
    <title>Housing Rent System</title>
    <link rel="shortcut icon" href="{{base_url()}}styles/images/favicon.ico"/>

    <!--All BootStrap StyleSheets-->
    {{css('bootstrap/css/bootstrap.min.css')}}
    {{css('bootstrap/css/bootstrap-theme.min.css')}}

    <!--Site Main Style Sheet-->
    {{css('style.css')}}

    <!--  JQuery Latest  -->
    {{js('jQuery_v1.10.2.js')}}

    {{if $Fetch.Method == "index" }}
    <!--Slider CSS Files-->
        {{css('slider/demo.css')}}
        {{css('slider/slider.css')}}
    {{/if}}
</head>
<body>
<!--[if lt IE 7]>
<p class="chromeframe">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> or <a href="http://www.google.com/chromeframe/?redirect=true">activate Google Chrome Frame</a> to improve your experience.</p>
<![endif]-->
{{include file="ui_components/topMenuBar.tpl"}}
