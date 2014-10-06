<?php
/**
 * Created by PhpStorm.
 * User: HaiderHassan
 * Date: 12/31/13
 * Time: 8:11 AM
 */

function LoggedIn(){
    $ci =& get_instance();
    if($ci->session->userdata('LoggedIn')){
        return TRUE;
    }
    else{
        return FALSE;
    }
}

if (!function_exists('CheckUserRole')) {
    function CheckUserRole($UserID)
    {
        if ($UserID > 0) {
            $ci =& get_instance();
            $ci->load->model('Common_Model');
            $where = array(
                'UserID' => $UserID
            );
            $UserGroupID = $ci->Common_Model->get_by('GroupID', 'users_users', $where, TRUE);
            $where = array(
                'GroupID' => $UserGroupID['GroupID']
            );
            $userRoles = $ci->Common_Model->get_by('RoleID', 'users_groups_roles', $where, False);
            return $userRoles;
        }
    }
}

if (!function_exists('CheckUserGroup')) {
    function CheckUserGroup($UserID)
    {
        if ($UserID > 0) {
            $ci =& get_instance();
            $ci->load->model('Common_Model');
            $where = array(
                'UserID' => $UserID
            );
            $UserGroupID = $ci->Common_Model->get_by('GroupID', 'users_users', $where, TRUE);
            return $UserGroupID['GroupID'];
        }
    }
}
//This Function should Be Responsible to check if user Group is allowed to load the specific Controller or Not.
if (!function_exists('is_allowed')) {
    function is_allowed($userID){
        $ci =& get_instance();
        $ci->load->model('Common_Model');
        $class = $ci->router->class;
        $method =  $ci->router->method;
        $partialURI = $class."/".$method;
        //We need to get the GroupID for the Current logged in User
        $table = 'users_users';
        $data=('GroupID');
        $where = array(
            'UserID' => $userID
        );
        $result = $ci->Common_Model->select_fields_where($table,$data,$where,TRUE);
        $groupID=$result->GroupID; //it will be the Group ID for the Current LoggedIn User.

        //Now in order to check if this Group has Proper Authority for the Form, We first need to grap all the forms it has access to.
        //All the variables will be overwritten.
        $PTable = 'sys_forms_in_groups';
        $data=('FormCIPath');
        $joins=array(
            array(
             'table' => 'sys_forms',
                'condition' => 'sys_forms.FormID = sys_forms_in_groups.FormID',
                'jointype' => 'INNER'
            )
        );
        $where = array(
            'GroupID' => $groupID
        );
        $result = $ci->Common_Model->select_fields_joined($data, $PTable, $joins,$where);

        foreach($result as $r) {
            if(strpos($r->FormCIPath, "$partialURI")) {
                return TRUE;
            }
        }
        return FALSE;
    }
}

if (!function_exists('is_admin')){
    function is_admin($userID){
        $ci =& get_instance();
        $ci->load->model('Common_Model');
        $table = 'users_users';
        $data=('GroupID');
        $where = array(
          'UserID' => $userID
        );
        $result = $ci->Common_Model->select_fields_where($table,$data,$where,TRUE);
        $groupID=$result->GroupID;
        if($groupID==1){
            return TRUE;
        }
        else{
            return FALSE;
        }
    }
}
?>