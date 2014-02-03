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
        $this->load->model('users_management/login_check');
        $this->login_check->is_logged_in(); // verify the login information, if not send him to login form
    }
}