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

if (!function_exists('checkuserrole'))
{
    function CheckUserGroup($session_loggedIn)
    {
        $loggedIn = $session_loggedIn;
        if($loggedIn > 0)
        {
            $arr = explode("-",$loggedIn);
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

            return $rolesids;
        }

    }
}
?>