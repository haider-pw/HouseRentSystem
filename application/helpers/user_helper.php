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
            $userRoles = $ci->Common_Model->get_by('RoleID', 'sys_user_group_roles', $where, False);
            return $userRoles;
        }
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
            $userRoles = $ci->Common_Model->get_by('RoleID', 'sys_user_group_roles', $where, False);
            return $userRoles;
        }
    }
}
?>