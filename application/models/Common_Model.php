<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Common_Model extends MY_Model{

    function __construct(){
        parent::__construct();
    }

    public function login($Where){
        $UserTable = 'sys_users';
        $user = $this->get($UserTable,$Where,TRUE);
        if(count($user)){
//Log the User in if User Record is Returned
            $data=array(
                'FullName' => $user['FullName'],
                'Email' => $user['Email'],
                'UserID' => $user['UserID'],
                'LoggedIn' => TRUE
            );
            $this->session->set_userdata($data);
            return TRUE;
        }
    }
    public function logout(){
        $this->session->sess_destroy();
    }
    public function loggedin(){
        return (bool) $this->session->userdata('LoggedIn');
    }
    public function hash($string){
        return hash('sha512', $string.config_item('encryption_key'));
    }

    function joined_get_by($data, $PTable, $joins,$where='',$group_by='')
    {
        $this->db->select($data);

        $this->db->from($PTable);
        foreach ($joins as $k => $v){
            $this->db->join($v['table'], $v['condition'], $v['jointype']);
        }
        if($where!='')
        {
            $this->db->where($where);
        }
        if($group_by!=''){
            $this->db->group_by($group_by);
        }

        $query = $this->db->get();
        return $query->result_array();
        //return $this->db->last_query();
    }

//    Select Queries
    function select($tbl = '')
    {
        $query = $this->db->get($tbl);
        return $query->result();

    }

    function select_fields($tbl = '', $data)
    {
        $this->db->select($data);
        $query = $this->db->get($tbl);
        //return $this->db->last_query();
        return $query->result();
    }


    function select_fields_where($tbl = '', $data,$where)
    {
        $this->db->select($data);
        $this->db->from($tbl);
        $this->db->where($where);
        $query = $this->db->get();
        //return $this->db->last_query();
        return $query->result();
    }

    function select_dist_fields($tbl = '', $data)
    {
        $this->db->distinct();
        $this->db->select($data);
        $query = $this->db->get($tbl);
        //return $this->db->last_query();
        return $query->result();
    }

    function select_fields_joined($data, $PTable, $joins,$where='')
    {
        $this->db->select($data);

        $this->db->from($PTable);
        foreach ($joins as $k => $v){
            $this->db->join($v['table'], $v['condition'], $v['jointype']);
        }
        if($where!='')
        {
            $this->db->where($where);
        }

        $query = $this->db->get();
        return $query->result();
    }

    function select_distinct_fields($tbl = '')
    {
        $this->db->order_by('PuID','desc');
        $this->db->group_by('PuCode');
        $this->db->distinct('PuCode');
        $query = $this->db->get($tbl);
        return $query->result();
    }

//    Common Select Queries End

// Common Update Queries

    function update($tbl, $fields, $data){
        $this->db->where($fields);
        $this->db->update($tbl, $data);
    }
    function update_query($tbl,$field,$id,$data)
    {
        $this->db->where($field, $id);
        $this->db->update($tbl, $data);
        //echo $this->db->last_query();
        $affectedRows = $this->db->affected_rows();
        if($affectedRows){
            return $affectedRows;
        }
        else{
            return $this->db->_error_message();
        }

    }


    function update_query_array($tbl,$fields,$data)
    {

        $this->db->where($fields);
        $this->db->update($tbl, $data);
        $afftectedRows = $this->db->affected_rows();
        //return $this->db->last_query();

        if($afftectedRows){
            return $afftectedRows;
        }
        else{
            return $this->db->_error_message();
        }

    }
}
