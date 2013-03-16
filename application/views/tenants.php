<?php
/**
 * Created by JetBrains PhpStorm.
 * User: Kill3rCoder-Lapi
 * Date: 3/10/13
 * Time: 1:10 PM
 * To change this template use File | Settings | File Templates.
 */
?>
<html>
<head>
    <title>Tenants Listing</title>
</head>
<body>
<h1>Tenants Listing</h1>
<?php
if(!isset($tenants)){
?>
    <p>There are no Tenants to List</p>
        <?php
} else{

    foreach($tenants as $row){?>
<h2><a href="<?php echo base_url()?>tenants/tenant/<?php echo $row['T_ID'];?>"><?php echo $row['T_Name'];?></a></h2>
    <p>Mobile : <?php echo $row['T_Mobile'];?></p>
<?php
    }
}
?>
</body>
</html>