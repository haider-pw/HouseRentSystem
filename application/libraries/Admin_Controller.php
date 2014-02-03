<?php
/**
 * Created by JetBrains PhpStorm.
 * User: Kill3rCoder-Lapi
 * Date: 3/17/13
 * Time: 1:12 PM
 * To change this template use File | Settings | File Templates.
 */
/**
 * @Admin_Controller class This class is used for the Admin Section.
 */
class   Admin_Controller extends My_Controller{
    function __construct(){
        parent::__construct();
        $this->login_check->is_logged_in(); // verify the login information, if not send him to login form
        $this->load->model('Tab_Model');
        $UserID = $this->session->userdata('UserID');
        $arr = CheckUserRole($UserID);
        $this->data['allowed_menus'] = $this->Tab_Model->check_allow($arr);
        /*        var_dump($data['allowed_menus']);
                exit;*/
        $this->data['tabs'] = $this->Tab_Model->get_tabs();
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
        $this->data['menus']=$this->Common_Model->get($table);
        //Getting Data for Tabs, should show all the Tabs which have any menus
        $this->data['tabs']=$this->Common_Model->joined_get_by($columns,$PTable,$joins,$where='',$group_by);
    }
}