<?php
/**
 * Created by PhpStorm.
 * User: HaiderHassan
 * Date: 10/14/14
 * Time: 1:27 PM
 */

class hrsTenants extends Admin_Controller{
    function __construct(){
        parent::__construct();
        $this->load->library('Datatables.php');
        $this->load->library('table');
    }
    function CreateNewTenant(){
        $this->data['title'] = "Create New Tenant";
        $this->parser->parse('admin/hrs/tenants/CreateNewTenant', $this->data);
    }
    function ManageTenants(){
        $this->data['title'] = "Manage Tenants";
        $this->parser->parse('admin/hrs/tenants/ManageTenants', $this->data);
    }

    function listTenants_DT(){
        if($this->input->is_ajax_request()){
            $PTable = 'hrs_tenants';
            $data = ('TenantID,FullName,Username,Mobile,CNIC,Email');
            $joins = array(
                array(
                   'table' => 'users_users',
                    'condition' => 'users_users.UserID = hrs_tenants.UserID',
                    'type' => 'INNER'
                )
            );
            $where = array(
                'IsActive' => '1'
            );
            $addColumn = "<a href='#editBtnModal' data-toggle='modal' class='editBtnFunc'><i style='color: #666666' class='fa fa-pencil fa-fw fa-2x'></i></a><a href='#' id='deleteBtn' class='deleteBtnFunc'><i style='color: #ff0000' class='fa fa-times fa-fw fa-2x'></i></a>";
            $result = $this->Common_Model->select_fields_joined_DT($data, $PTable, $joins, $where, $addColumn);
            echo $result;
        }
        else{
            redirect($this->data['errorPage_403']);
        }
    }
}