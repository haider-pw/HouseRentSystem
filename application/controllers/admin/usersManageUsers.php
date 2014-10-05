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
    function ListUsersGroups(){
        $this->data['title'] = "List Users";
        $this->parser->parse('admin/users/manage_users/ListUsersGroups', $this->data);
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
            $userGroupID = $this->input->post('selectGroup');
            if($pass===$confirmPass){
                $data_users=array(
                    'UserName' => $username,
                    'Password' => $pass,
                    'FullName' => $fullName,
                    'Email'    => $email,
                    'Mobile'   => $mobile,
                    'CNIC'     => $cnic,
                    'Theme'    => $theme,
                    'GroupID'  => $userGroupID
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
    function UpdateUser_Action($userID){
        //Function for Updating User Details.
        if($this->input->post()){
            $username = $this->input->post('username');
            $fullName = $this->input->post('fullName');
            $email = $this->input->post('userEmail');
            $mobile = $this->input->post('mobileNo');
            $cnic = $this->input->post('cnic');
            $currentPass = $this->input->post('currentPass');
            $pass = $this->input->post('pass');
            $confirmPass = $this->input->post('pass2');
            $theme = $this->input->post('theme');
            $userGroup = $this->input->post('selectGroup');
            if(strpos($userGroup,',') == TRUE){
                $exp = explode(",",$userGroup);
                $userGroupID = $exp[0];
            }else{
                $userGroupID = $userGroup;
            }
            $table = 'users_users';
            //Field is the column name of the table on the base of which query should update the row.
            $field='UserID';
            if($currentPass!=''){
                if($pass===$confirmPass){
                    $data = array(
                        'Username' => $username,
                        'FullName' => $fullName,
                        'Email'  => $email,
                        'Password' => $pass,
                        'Mobile' => $mobile,
                        'CNIC'   => $cnic,
                        'theme'  => $theme,
                        'GroupID' => $userGroupID
                    );
                    $result = $this->Common_Model->update_query($table,$field,$userID,$data);
                    if($result=true){
                        echo "OK::Record Successfully Updated::success";
                    }
                    else{
                        echo "FAIL::Some Database Error, Record Could Not be Updated::success";
                    }
                }
                else{
                    echo "password do not match with confirm password";
                }
            }
            elseif($currentPass==''){
                $data = array(
                  'Username' => $username,
                  'FullName' => $fullName,
                    'Email'  => $email,
                    'Mobile' => $mobile,
                    'CNIC'   => $cnic,
                    'theme'  => $theme,
                    'GroupID' => $userGroupID
                );
                $result = $this->Common_Model->update_query($table,$field,$userID,$data);
                if($result=true){
                    echo "OK::Record Successfully Updated::success";
                }
                else{
                    echo "FAIL::Some Database Error, Record Could Not be Updated::success";
                }
            }
        }
    }

    function CreateUser_firstStepValidation()
    {
        //Validation for Email, Check if email is not already been taken.
        if ($this->input->post('userEmail')) {
            $userEmail = $this->input->post('userEmail');
            $table = "users_users";
            $data = array('Email');
            $where = array(
                'Email' => $userEmail
            );
            $result = $this->Common_Model->select_fields_where($table, $data, $where);
            if ($result > 0) {
                //error message for email already exist in database.
                echo "FAIL::Email Already Exist::error";
            } else {
                echo "OK::Hurray! Validation Completed::success";
            }
        } else {
            echo "FAIL::Email field can not be left empty.::error";
        }
    }
    function UpdateUser_firstStepValidation($userID){
        //Validation for Email, Check if email is not already been taken.
        if($this->input->post('userEmail')){
           $userEmail = $this->input->post('userEmail');
            $table = "users_users";
            $data = array('Email');
            //Using UserID to make sure that query dont check for email against the same User.
            $where = array(
                'Email' => $userEmail,
                'UserID !=' => $userID
            );
            $result = $this->Common_Model->select_fields_where($table, $data,$where);
            if($result>0){
                //error message for email already exist in database.
                echo "FAIL::Email Already Exist::error";
            }
            else{
                echo "OK::Hurray! Validation Completed::success";
            }
        }
        else{
            echo "FAIL::Email field can not be left empty.::error";
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
    function listGroups_DT()
    {
        //Code to List Data in in DataTables for Listing of Users
        $data = ('GroupID,GroupName,GroupDescription');
        $table = "users_groups";
        $addColumn = "<a href='#editBtnModal' data-toggle='modal' class='editBtnFunc'><i style='color: #666666' class='fa fa-pencil fa-fw fa-2x'></i></a><a href='#' id='deleteBtn' class='deleteBtnFunc'><i style='color: #ff0000' class='fa fa-times fa-fw fa-2x'></i></a>";
        $result = $this->Common_Model->select_fields_joined_DT($data, $table,$joins='', $where = '', $addColumn);
        echo $result;
    }
    function addNewGroup(){
        //function to create new group.
    }
    function getGroupData($groupID){
        //function to get the details of the selected group
    }
    function deleteGroup(){
        //Delete the Selected Group
    }
    function UpdateGroupData(){

    }
}