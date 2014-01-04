<?php
/**
 * Created by JetBrains PhpStorm.
 * User: Kill3rCoder-Lapi
 * Date: 3/17/13
 * Time: 12:20 PM
 * To change this template use File | Settings | File Templates.
 */

class Dashboard extends Admin_Controller{
    function __construct(){
        parent::__construct();
    }

    public function adminHome(){
        $data['title']="dashboard";
        $this->parser->parse('admin/dashboard.tpl',$data);
        //echo "admin Dashboard is here.";
    }
}