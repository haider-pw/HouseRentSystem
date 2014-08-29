<?php if (!defined('BASEPATH')) exit('No direct script access allowed');
/**
 * Created by PhpStorm.
 * User: HaiderHassan
 * Date: 8/29/14
 * Time: 5:55 PM
 */
class Configurations extends Admin_Controller{
    function __construct(){
        parent::__construct();
        $this->load->library('Datatables.php');
        $this->load->library('table');
        $this->load->helper('dataTables');
        $this->load->model('system/configuration');
    }
    function CreateUser(){
        $this->data['title'] = "Create New User";
        $this->parser->parse('admin/usersManageUsersCreateUser',$this->data);
    }
    function UpdateUser(){
        $this->data['title'] = "Create New User";
        $this->parser->parse('admin/usersManageUsersUpdateUser',$this->data);
    }
}