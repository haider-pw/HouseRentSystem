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
 * @property login_check $login_check This Model will check if the user is logged in or not.
 */
class   Admin_Controller extends My_Controller{
    function __construct(){
        parent::__construct();
        /**
         * This Variables will be available to all the views in the admin Section
         * @global UserGroupID
         * @global allowed_menus // Contains allowed Menus for the this LoggedIn User
         * @global tabs
         * @global menus
         */
        $this->login_check->is_logged_in(); // verify the login information, if not send him to login form
        $this->load->model('Tab_Model');
        $arr = CheckUserRole($this->data['UserID']);
        $this->data['allowed_menus'] = $this->Tab_Model->check_allow($this->data['UserGroupID']);
        /*        var_dump($data['allowed_menus']);
                exit;*/
        $this->data['tabs'] = $this->Tab_Model->get_tabs();
        //Code to Get Menus for the Site
        $PTable='sys_forms';
        $columns='*';
        $joins = array(
            array(
                'table' => 'sys_menus',
                'condition' => 'sys_forms.MenuID = sys_menus.MenuID',
                'jointype' => 'INNER'
            ),
            array(
                'table' => 'sys_tabs',
                'condition' => 'sys_menus.TabID = sys_tabs.TabID',
                'jointype' => 'INNER'
            ),
            array(
                'table' => 'sys_forms_in_groups',
                'condition' => 'sys_forms.FormID = sys_forms_in_groups.FormID',
                'jointype' => 'INNER'
            )
        );
        $where = array(
            'GroupID' => $this->data['UserGroupID']
        );

       $this->data['menus']=$this->Common_Model->joined_get_by($columns,$PTable,$joins,$where,'');
/*        echo "<pre>";
        print_r($this->data['menus']);
        echo "</pre>";
        exit;*/
/*        echo "<pre>"; var_dump($data);
        exit;*/
    }
}