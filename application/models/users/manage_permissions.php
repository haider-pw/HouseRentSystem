<?php
/**
 * Created by PhpStorm.
 * User: Syed Haider Hassan
 * Date: 10/7/14
 * Time: 9:04 AM
 */

class Manage_Permissions extends MY_Model{


    function __construct(){
        parent::__construct();
    }

    function listFormsInGroups_DT($data, $PTable, $joins = '', $where = '', $addColumn = '',$unsetColumn='',$where_in='',$where_in_c = '',$group_by=''){
        $this->datatables->select($data);
        if ($unsetColumn != '') {
            $this->datatables->unset_column($unsetColumn);
        }
        $this->datatables->from($PTable);
        if ($joins != '') {
            foreach ($joins as $v) {
                $this->datatables->join($v['table'], $v['condition'], $v['jointype']);
            }
        }

        if ($where!=''){
            $this->datatables->where($where);
        }
        if ($where_in!=''){
            $this->datatables->where_in($where_in_c,$where_in);
        }
        if($group_by!=''){
            $this->datatables->group_by($group_by);
        }
        if ($addColumn != '') {
            $this->datatables->add_column("Actions", $addColumn);
        }

        $result = $this->datatables->generate();
        //$last_query = $this->datatables->last_query();
        return $result;
    }
}