<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Common_Model extends MY_Model{

    function __construct(){
        parent::__construct();
        $this->load->library('Datatables.php');
    }

    public function login($Where){
        $UserTable = 'users_users';
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

    function select_fields($tbl = '', $data, $single=FALSE)
    {
        $this->db->select($data);
        $query = $this->db->get($tbl);
        if($single==TRUE){
            return $query->row();
        }
        else{
            return $query->result();
        }
        //return $this->db->last_query();

    }


    function select_fields_where($tbl = '', $data,$where,$single=FALSE,$like='',$field='',$value='')
    {
        $this->db->select($data);
        $this->db->from($tbl);
        if($like!=''){
            $this->db->like('LOWER(' .$field. ')', strtolower($value));
            $this->db->like($like);
        }
        $this->db->where($where);
        $query = $this->db->get();
        //return $this->db->last_query();
        if ($query->num_rows() > 0) {
            // query returned results
            if($single==TRUE){
                return $query->row();
            }
            else{
                return $query->result();
            }
        } else {
            // query returned no results
            return FALSE;
        }

    }
    function select_fields_where_like($tbl = '', $data,$where='',$single=FALSE,$field,$value)
    {
        $this->db->select($data);
        $this->db->from($tbl);
        $this->db->like('LOWER(' .$field. ')', strtolower($value));
        if($where!=''){
            $this->db->where($where);
        }
        $query = $this->db->get();
        //return $this->db->last_query();
        if ($query->num_rows() > 0) {
            // query returned results
            if($single==TRUE){
                return $query->row();
            }
            else{
                return $query->result();
            }
        } else {
            // query returned no results
            return FALSE;
        }

    }
    function select_fields_where_like_join($tbl = '', $data,$where='',$single=FALSE,$field,$value,$joins='')
    {
        $this->db->select($data);
        $this->db->from($tbl);
        if($joins != ''){
            foreach ($joins as $k => $v){
                $this->db->join($v['table'], $v['condition'], $v['jointype']);
            }
        }
        $this->db->like('LOWER(' .$field. ')', strtolower($value));
        if($where!=''){
            $this->db->where($where);
        }
        $query = $this->db->get();
        //return $this->db->last_query();
        if ($query->num_rows() > 0) {
            // query returned results
            if($single==TRUE){
                return $query->row();
            }
            else{
                return $query->result();
            }
        } else {
            // query returned no results
            return FALSE;
        }

    }

    function select_dist_fields($tbl = '', $data)
    {
        $this->db->distinct();
        $this->db->select($data);
        $query = $this->db->get($tbl);
        //return $this->db->last_query();
        return $query->result();
    }

    function select_fields_joined($data, $PTable, $joins,$where='',$groupBy = '')
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
        if($groupBy!='')
        {
            $this->db->group_by($groupBy);
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

    //------------------------ insert record queries -----------------------------------
    function insert_record($tbl,$data)
    {
        $this->db->insert($tbl, $data);
        return $this->db->insert_id();
    }
    function insert_multiple($tbl,$data)
    {
        $this->db->insert_batch($tbl, $data);
    }

    //------------------------End of insert record queries -----------------------------------
// Common Update Queries

    function update($tbl, $fields, $data){
        $this->db->where($fields);
        $this->db->update($tbl, $data);
        $affectedRows = $this->db->affected_rows();
        if($affectedRows){
            return true;
        }
        else{
            return $this->db->_error_message();
        }
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

    //Common Update Queries End


//------------------Common Delete Queries

    function delete($tbl,$condition)
    {
        $this->db->delete($tbl, $condition);
        if ($this->db->affected_rows() > 0){
            return TRUE;
        }
        else {
            //return FALSE;
            return FALSE;
        }
    }

    //Delete Multiple Records from table on basis of where and where_in
    function multiple_delete($tbl,$field,$values,$where)
    {
        $this->db->where($where);
        $this->db->where_in($field,$values);
        $this->db->delete($tbl);
        if ($this->db->affected_rows() > 0){
            return TRUE;
        }
        else {
            //return FALSE;
            return FALSE;
        }
    }

//------------------End of Common Delete Queries


    //Common AutoComplete Queries
    function get_autoComplete($tbl, $data, $field, $value, $where='',$group_by=false,$limit=''){
        $this->db->select($data);
        $this->db->from($tbl);
        if($where!=''){
            $this->db->where($where);
        }
        $this->db->like('LOWER(' .$field. ')', strtolower($value));
        if($group_by == true){
        $this->db->group_by($field);
        }
        if($limit !='')
        {
            $this->db->limit($limit);
        }
        $query=$this->db->get();
        return $query->result();
    }
    function get_autoCompleteJoin($PTable, $joins='', $where='', $data, $field, $value,$group_by=false){
        $this->db->select($data);
        $this->db->from($PTable);
        if($joins != ""){
            foreach ($joins as $k => $v){
                $this->db->join($v['table'], $v['condition'], $v['jointype']);
            }
        }
        if($where!=''){
            $this->db->where($where);
        }
        $this->db->like('LOWER('.$field.')', strtolower($value));
        if($group_by == true){
        $this->db->group_by($field);
        }
        $query=$this->db->get();
        //echo $this->db->last_query();
        return $query->result();
    }

    //Common DataTables Queries
    function select_fields_joined_DT($data, $PTable, $joins = '', $where = '', $addColumn = '',$unsetColumn='')
    {
        $this->datatables->select($data);
        if ($unsetColumn != '') {
        $this->datatables->unset_column($unsetColumn);
        }
            $this->datatables->from($PTable);
        if ($joins != '') {
            foreach ($joins as $k => $v) {
                $this->datatables->join($v['table'], $v['condition'], $v['type']);
            }
        }
        if ($where != '') {
            $this->datatables->where($where);
        }

        if ($addColumn != '') {
            $this->datatables->add_column("Actions", $addColumn);
        }

        $result = $this->datatables->generate();
        return $result;
    }

}
