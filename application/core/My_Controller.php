<?php
/**
 * Created by JetBrains PhpStorm.
 * User: Kill3rCoder-Lapi
 * Date: 3/17/13
 * Time: 12:17 PM
 * To change this template use File | Settings | File Templates.
 */

class My_Controller extends CI_Controller{

    public $data = array();

    function __construct() {
    parent::__construct();
        $this->data['errors']=array();
        $this->data['site_name']=array();
        $this->load->library( 'Smarty.php' );
        $this->load->library('parser');
        $this->load->model('Common_Model');
        $this->load->model('users_management/login_check');
        $this->login_check->is_logged_in(); // verify the login information, if not send him to login form
} 
}