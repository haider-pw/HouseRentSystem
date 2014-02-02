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

if (!function_exists('CheckUserGroup'))
{
    function CheckUserGroup($session_loggedIn)
    {
        $loggedIn = $session_loggedIn;
        if($loggedIn > 0)
        {
/*            $arr = explode("-",$loggedIn);
            //$id = $arr[1];
            $ci =& get_instance();
            //$ci->load->model('CommonModel');
            $where = array(
                'GroupID' => '1'
            );
            $data = $ci->common_model->get('pbs_Users',$where);
            foreach($data->result() as $vari)
            {
                $groupsids[] = $vari->GroupID;
            }

            $roles = $ci->common_model->get_where_in('','GroupID,RoleID',$groupsids,'GroupID');
            foreach($roles->result_array() as $varible)
            {

                $rolesids[] = $varible['GroupID'];
                $rolesids[] = $varible['RoleID'];
            }

            return $rolesids;*/
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
            $UserGroupID = $ci->Common_Model->get_by('GroupID', 'sys_users', $where, TRUE);
            $where = array(
                'GroupID' => $UserGroupID['GroupID']
            );
            $userRoles = $ci->Common_Model->get_by('RoleID', 'sys_user_group_roles', $where, False);
            return $userRoles;
        }
    }
}
?>