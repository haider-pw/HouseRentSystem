<?php
/**
 * Created by JetBrains PhpStorm.
 * User: Kill3rCoder-Lapi
 * Date: 3/17/13
 * Time: 12:17 PM
 * To change this template use File | Settings | File Templates.
 */
/**
 * @property Common_Model $Common_Model It resides all the methods which can be used in most of the controllers.
 * @property datatables $datatables It resides all the methods which can be used in most of the controllers.
 */
class My_Controller extends CI_Controller{

    public $data = array();

    function __construct() {
    parent::__construct();
        $this->data['errors']=array();
        $this->data['site_name']=array();
        $this->data['errorPage_401'] = 'errorPages/error_401';
        $this->data['errorPage_403'] = 'errorPages/error_403';
        $this->data['errorPage_404'] = 'errorPages/error_404';
        $this->data['errorPage_500'] = 'errorPages/error_500';
        $this->load->model('Common_Model');
        $this->load->model('users_management/login_check');
        $this->parser->set_theme('default');
        $this->data['themeName'] = 'default';
        if(loginCheckBool() === TRUE){
        $this->data['UserID'] = $this->session->userdata('UserID');
        $this->data['UserGroupID'] = CheckUserGroup($this->data['UserID']);
        $this->data['UserProfileImage'] = GetUserProfileImage($this->data['UserID']);
        $this->data['dbCurrentDate'] = date("Y-m-d H:i:s");
        }
}
    function hashPassword($password) {
        return md5($password);
    }
}