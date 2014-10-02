<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

/**
 * Created by PhpStorm.
 * User: HaiderHassan
 * Date: 8/29/14
 * Time: 5:55 PM
 */
class usersManageUsers extends Admin_Controller
{
    function __construct()
    {
        parent::__construct();
        $this->load->library('Datatables.php');
        $this->load->library('table');
        $this->load->helper('dataTables');
        $this->load->model('system/configuration');
    }

    function CreateUser()
    {
        $this->data['title'] = "Create New User";
        $this->parser->parse('admin/users/manage_users/CreateUser', $this->data);
    }

    function ListUsers()
    {
        $this->data['title'] = "List Users";
        $this->parser->parse('admin/users/manage_users/ListUsers', $this->data);
    }

    function UpdateUser()
    {
        $this->data['title'] = "Create New User";
        $this->parser->parse('admin/users/manage_users/UpdateUser', $this->data);
    }

    function listUsers_DT()
    {
        //Code to List Data in in DataTables for Listing of Users
        $data = ('UserID,users_users.GroupID,FullName,Username,Mobile,Email,GroupName');
        $pTable = "users_users";
        $joins = array(
            array(
                'table' => 'users_groups',
                'condition' => 'users_groups.GroupID=users_users.GroupID',
                'type' => 'INNER'
            )
        );
        $id = "UserID";
        $addColumn = "<a href='#editBtnModal' data-toggle='modal' class='editBtnFunc'><i style='color: #666666' class='fa fa-pencil fa-fw fa-2x'></i></a><a href='#' id='deleteBtn' class='deleteBtnFunc'><i style='color: #ff0000' class='fa fa-times fa-fw fa-2x'></i></a>";
        $result = $this->Common_Model->select_fields_joined_DT($data, $pTable,$joins, $where = '', $addColumn, $unsetColumn='');
        echo $result;
    }
}