<?php

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
}
