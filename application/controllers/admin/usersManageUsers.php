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

/*//////////////////////////////////////////////////////////////////////
////////////////////Views Under the Manage Users Main Menu/////////////////////
///////////////////////////////////////////////////////////////////////*/
    function CreateUser()
    {
        $this->data['title'] = "Create New User";
        $this->parser->parse('admin/users/manage_users/CreateUser', $this->data);
    }
    function UpdateUser($userID)
    {
        $this->data['title'] = "Edit User Information";
        $this->data['update_page'] = "admin/users/manage_users/UpdateUser";
        //Now Query below to get data for the selected User.
        $PTable="users_users";
        $where = array(
            'UserID' => $userID
        );
        $data = array('*');
        $joins = array(
            array(
                'table' => 'users_groups',
                'condition' => 'users_users.GroupID = users_groups.GroupID',
                'jointype' => 'INNER'
            )
        );
        $result = $this->Common_Model->select_fields_joined($data,$PTable,$joins,$where);
        $this->data['UserData'] = $result;
        $this->parser->parse('admin/users/manage_users/UpdateUser', $this->data);
    }

    function ListUsers()
    {
        $this->data['title'] = "List Users";
        $this->parser->parse('admin/users/manage_users/ListUsers', $this->data);
    }

    /*//////////////////////////////////////////////////////////////////////
    ////////////////////Functions for the Above Views/////////////////////
    ///////////////////////////////////////////////////////////////////////*/

    function CreateUser_Action()
    {
        if($this->input->post()){
            $fullName = $this->input->post('fullName');
            $username = $this->input->post('username');
            $email    = $this->input->post('userEmail');
            $cnic   = $this->input->post('cnic');
            $mobile   = $this->input->post('mobileNo');
            $pass   = $this->input->post('pass');
            $confirmPass = $this->input->post('pass2');
            $theme = $this->input->post('theme');
            $userGroup = $this->input->post('group');
            if($pass===$confirmPass){
                $data_users=array(
                    'UserName' => $username,
                    'Password' => $pass,
                    'FullName' => $fullName,
                    'Email'    => $email,
                    'Mobile'   => $mobile,
                    'CNIC'     => $cnic,
                    'Theme'    => $theme,
                    'GroupID'  => '1'
                );
                $table = "users_users";
                $result = $this->Common_Model->insert_record($table,$data_users);
                if($result>0){
                    echo "OK::New User Successfully Created::success";
                }
            }
            /*          $post = array();
                        foreach ( $_POST as $key => $value )
                        {
                            $post[$key] = $this->input->post($key);
                        }
                        var_dump($post);*/
        }
    }
    function DeleteUser_Action($userID){
        if($userID!==1){
        $where = array(
            'UserID' =>$userID
        );
        $tbl = "users_users";
        $result = $this->Common_Model->delete($tbl,$where);
        if ($result==true){
            echo "OK::Record Successfully Deleted::success";
        }
        else{
            echo "FAIL::Some Error, Record Could not Be Deleted.::error";
        }
        }
        else{
            echo "FAIL::You can Not Delete the Super Admin.::error";
        }
    }

    function loadAllUserGroups(){
        /*This Function should load All the Group Names of for Users*/
        $tbl = "users_groups";
        $data = array('GroupID','GroupName');
        $result = $this->Common_Model->select_fields($tbl,$data);
        print_r(json_encode($result));
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