<?php if (!defined('BASEPATH')) exit('No direct script access allowed');
/**
 * Created by JetBrains PhpStorm.
 * User: SBPS
 * Date: 8/19/13
 * Time: 3:41 PM
 * To change this template use File | Settings | File Templates.
 */
class Tab_Model extends MY_Model{


    function __construct(){
        parent::__construct();
    }

    //This Gets all the Menus in the Specified Role
    public function check_allow($groupID){
/*        $count=0;
        foreach($arr as $key=> $value){
            $actual_array[$count++] = $value['RoleID'];
        }*/
        $this->db->select('*');
        $this->db->from('sys_group_roles_forms_view');
        $this->db->where_in('GroupID',$groupID);
        $query=$this->db->get();
/*        echo $this->db->last_query();

 echo "<pre>";print_r($query->result());
 exit;*/
        return $query->result();
    }// end of authenticate function

    //This Function will retrieve all the tabs in database
    public function get_tabs(){
        $this->db->select('*');
        $this->db->from('sys_tabs');
        $this->db->order_by('TabOrder');
        $query = $this->db->get();
        return $query->result();
    }
}