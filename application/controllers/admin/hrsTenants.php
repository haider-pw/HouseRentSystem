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
    function listUsersNoTenants_DT(){
        if($this->input->is_ajax_request()){
            $PTable = 'users_users U';
            $data = ('U.UserID,U.FullName,U.Username,U.CNIC');
            $joins = array(
                array(
                    'table' => 'hrs_tenants T',
                    'condition' => 'U.UserID = T.UserID',
                    'type' => 'LEFT OUTER'
                )
            );
            $where = ('T.`TenantID` IS NULL');
            $addColumn = "<a href='#editBtnModal' data-toggle='modal' class='editBtnFunc'><i style='color: #666666' class='fa fa-pencil fa-fw fa-2x'></i></a><a href='#' id='deleteBtn' class='deleteBtnFunc'><i style='color: #ff0000' class='fa fa-times fa-fw fa-2x'></i></a>";
            $result = $this->Common_Model->select_fields_joined_DT($data, $PTable, $joins, $where, $addColumn);
            echo $result;
        }
        else{
            redirect($this->data['errorPage_403']);
        }
    }
    function createTenantFromExistingUser(){
        if($this->input->is_ajax_request()){
            if($this->input->post()){
                $uID = mysql_real_escape_string($this->input->post('UID'));
                $currentDateTime = date("Y-m-d H:i:s");
                if(isset($uID) && ($uID!=='1')){
                    $table = 'hrs_tenants';
                    $data = array(
                        'UserID' => $uID,
                        'IsActive' => '1',
                        'DateRegistered' => $currentDateTime,
                        'RegisteredBy' => $this->data['UserID']
                    );
                    $this->Common_Model->insert_record($table,$data);
                }
                else {
                    echo 'FAIL::Super Administrator Can Not Be Tenant himself::error';
                }
            }
            else{

            }
        }
        else{
            redirect($this->data['errorPage_403']);
        }
    }
}