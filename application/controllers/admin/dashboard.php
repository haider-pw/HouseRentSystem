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
    public function System(){
        $this->data['title']="dashboard";
        $this->parser->parse('admin/systemDashboard.tpl',$this->data);
        //echo "admin Dashboard is here.";
    }

    public function Users(){
        $data['title']="Users Dashboard";
        $this->parser->parse('admin/usersDashboard.tpl',$this->data);
        //echo "admin Dashboard is here.";
    }
}