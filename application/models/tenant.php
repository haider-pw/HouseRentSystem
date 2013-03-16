<?php
/**
 * Created by JetBrains PhpStorm.
 * User: Kill3rCoder-Lapi
 * Date: 3/10/13
 * Time: 2:32 AM
 * To change this template use File | Settings | File Templates.
 */

/* @property tenant */
class tenant extends CI_Model{

   function getTenants(){
       $this->db->select()->from('hrs_tenants');
       $query=$this->db->get();
       return $query->result_array();
   }
}