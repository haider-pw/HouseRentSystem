<?php if (!defined('BASEPATH')) exit('No direct script access allowed');
/**
 * Created by JetBrains PhpStorm.
 * User: Kill3rCoder-Lapi
 * Date: 4/27/13
 * Time: 3:35 PM
 * To change this template use File | Settings | File Templates.
 */
class MY_Model extends CI_Model {

    /**
     * @var array $modelData Contains Data Related to Model Data.
     */
    public $modelData = array();

    function __construct(){
        parent::__construct();
        $this->modelData['UserID'] = $this->session->userdata('UserID');
        $this->modelData['dbCurrentDate'] = date("Y-m-d H:i:s");
    }

    function get($table,$where=array(),$single=FALSE) {
        $q = $this->db->get_where($table,$where);
        $result = $q->result_array();
        if($single && !empty($result)) { //if the result is not empty and only single result is needed then this if statement runs.
            return $result[0];
        }
        return $result;
    }

    function get_by($columns, $table, $where=array(), $single=FALSE ){
        $this->db->select($columns);
        $this->db->from($table);
        $this->db->where($where);
        $q = $this->db->get();
        $result = $q->result_array();
        if($single) {
            return $result[0];
        }

        return $result;
    }

    function insert($table,$data) {
        $this->db->insert($table,$data);
        $InsertedID=$this->db->insert_id();
        $affected_rows=$this->db->affected_rows();
        if($affected_rows>0){
            return $InsertedID;
        }
        else {
            return 0;
        }
    }

    function update($table,$where=array(),$data) {
        $this->db->update($table,$data,$where);
        return $this->db->affected_rows();
    }

    function delete($table,$where=array()) {
        $this->db->delete($table,$where);
        return $this->db->affected_rows();
    }

    function explicit($query) {
        $q = $this->db->query($query);
        if(is_object($q)) {
            return $q->result_array();
        } else {
            return $q;
        }
    }

}