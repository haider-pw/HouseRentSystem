<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>403</title>
    <meta name="msapplication-TileColor" content="#5bc0de" />
    <meta name="msapplication-TileImage" content="assets/img/metis-tile.png" />

    <!-- Bootstrap -->
    {{css('bootstrap/css/bootstrap.min.css')}}

    <!-- Font Awesome -->
    {{css('admin/Font-Awesome/font-awesome.min.css')}}

    <!-- Metis core stylesheet -->
    {{css('admin/main.min.css')}}
    {{block name="header"}}
    {{/block}}
</head>
<body class="error">
{{block name="content"}}{{/block}}
</body>
</html>