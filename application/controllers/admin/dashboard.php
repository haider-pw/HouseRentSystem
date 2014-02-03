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
        $this->load->model('Tab_Model');
    }
    public function System(){
        $arr = CheckUserRole(1);
        $data['allowed_menus'] = $this->Tab_Model->check_allow($arr);
/*        var_dump($data['allowed_menus']);
        exit;*/
        $data['tabs'] = $this->Tab_Model->get_tabs();
        $PTable='sys_tabs';
        $columns=array('sys_tabs.TabName','TabDesc');
        $group_by='TabName';
        $joins = array(
            array(
                'table' => 'sys_menus',
                'condition' => 'sys_tabs.TabID = sys_menus.TabID',
                'jointype' => 'INNER'
            )
        );
        $table='sys_menus';
        $data['menus']=$this->Common_Model->get($table);
        //Getting Data for Tabs, should show all the Tabs which have any menus
        $data['tabs']=$this->Common_Model->joined_get_by($columns,$PTable,$joins,$where='',$group_by);
        $data['title']="dashboard";
        $this->parser->parse('admin/systemDashboard.tpl',$data);
        //echo "admin Dashboard is here.";
    }

    public function Users(){
        $arr = CheckUserRole(1);
        $data['allowed_menus'] = $this->Tab_Model->check_allow($arr);
/*        var_dump($data['allowed_menus']);
        exit;*/
        $data['tabs'] = $this->Tab_Model->get_tabs();
        $PTable='sys_tabs';
        $columns=array('sys_tabs.TabName','TabDesc');
        $group_by='TabName';
        $joins = array(
            array(
                'table' => 'sys_menus',
                'condition' => 'sys_tabs.TabID = sys_menus.TabID',
                'jointype' => 'INNER'
            )
        );
        $table='sys_menus';
        $data['menus']=$this->Common_Model->get($table);
        //Getting Data for Tabs, should show all the Tabs which have any menus
        $data['tabs']=$this->Common_Model->joined_get_by($columns,$PTable,$joins,$where='',$group_by);
        $data['title']="dashboard";
        $this->parser->parse('admin/usersDashboard.tpl',$data);
        //echo "admin Dashboard is here.";
    }
}