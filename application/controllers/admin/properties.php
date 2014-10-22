<?php if (!defined('BASEPATH')) exit('No direct script access allowed');
/**
 * Created by PhpStorm.
 * User: HaiderHassan
 * Date: 2/4/14
 * Time: 4:09 PM
 */
class Properties extends Admin_Controller
{
    function __construct()
    {
        parent::__construct();
    }

    function ManageProperties()
    {
        $UserID = $this->data['UserID'];
        if (is_admin($UserID) == TRUE || is_allowed($UserID) == TRUE) {
            $this->data['title'] = "Manage Properties";
            $this->parser->parse('admin/hrs/properties/Manage', $this->data);
        } else {
            redirect($this->data['errorPage_403']);
        }
    }

    function RentingProperties()
    {
        $this->data['title'] = "Renting Properties";
        $this->parser->parse('admin/hrs/properties/Renting', $this->data);
    }
    function AssignTenantProperty(){
        $this->data['title'] = "Assign Property To Tenant";
        $this->parser->parse('admin/hrs/properties/AssignTenant', $this->data);
    }

    function listResidentials_DT()
    {
        $data = ('ResID,hrs_residentials.ResTypeID,ResNo,TypeName,ResRooms,ResKitchens,ResBathrooms,ResDescription');
        $pTable = "hrs_residentials";
        $joins = array(
            array(
                'table' => 'hrs_residential_type',
                'condition' => 'hrs_residential_type.ResTypeID=hrs_residentials.ResTypeID',
                'type' => 'INNER'
            )
        );
        $id = "ResID";
        $addColumn = "<a href='#editBtnModal' data-toggle='modal' class='editBtnFunc'><i style='color: #666666' class='fa fa-pencil fa-fw fa-2x'></i></a><a href='#' id='deleteBtn' class='deleteBtnFunc'><i style='color: #ff0000' class='fa fa-times fa-fw fa-2x'></i></a>";
        $result = $this->Common_Model->select_fields_joined_DT($data, $pTable, $joins, $where = '', $addColumn, $unsetColumn = '');
        echo $result;
    }

    function loadAllVacancyTypes()
    {
        if ($this->input->is_ajax_request()) {
            /*This Function should load All the Group Names of for Users*/
            $tbl = "hrs_vacancy_type";
            $data = array('VacID', 'TypeName');
            $result = $this->Common_Model->select_fields($tbl, $data);
            //We got the result of all the vacancy types, but we need 1 more type that we need to have in dropdown, "Show All"
            //First the result is coming in Object Array, We First need to change it to normal Array.
            $array = json_decode(json_encode($result), true);
            //Now As Array Has been changed to Normal Array, we can merge our static array data to the original array.
            $staticDataArray = array(
                'VacID' => '0',
                'TypeName' => 'Show All'
            );
            //using array_push to merge arrays.
            array_push($array,$staticDataArray);
            //finally printing the combined array in json.
            print_r(json_encode($array));
        }
    }

    function loadAllTenants(){
        if($this->input->is_ajax_request()){
            $tbl = 'hrs_tenants';
            $data = ('TenantID,users_users.UserID,FullName,Username,CNIC,Avatar');
            $joins = array(
                array(
                    'table' => 'users_users',
                    'condition' => 'hrs_tenants.UserID=users_users.UserID',
                    'jointype' => 'INNER'
                )
            );
            if($this->input->post()){
                $value = mysql_real_escape_string($this->input->post('term'));
                if(isset($value)){
                    $field = 'FullName';
                    $result = $this->Common_Model->select_fields_where_like_join($tbl, $data,$where='',FALSE,$field,$value,$joins);
                }
                else{
                    $result = $this->Common_Model->select_fields_joined($data,$tbl,$joins,$where = '');
                }
            }
            print_r(json_encode($result));
        }
        else{
            redirect($this->data['errorPage_403']);
        }
    }
    function loadAllPropertyDealers(){
        if($this->input->is_ajax_request()){
            if($this->input->post()){
                $tbl = 'hrs_propertydealers';
                $data = ('PDID,FullName,CNIC,MobileNo,CompanyName');
                $value = $this->input->post('term');
                if(isset($value)){
                    $field = 'FullName';
                    $result = $this->Common_Model->select_fields_where_like($tbl,$data,'',FALSE,$field,$value);
                }
                else{
                    $result = $this->Common_Model->select_fields($tbl,$data,FALSE);
                }
                if($result===FALSE){
                    $msg = 'FAIL::NO RECORD FOUND::warning';
                    print_r(json_encode($msg));
                }
                else{
                    print_r(json_encode($result));
                }
            }
            else{
                return($this->data['errorPage_500']);
            }
        }
        else{
            redirect($this->data['errorPage_403']);
        }
    }

    function listProperties_DT($vacID = NULL)
    {
        if ($this->input->is_ajax_request()) {

            $data = ('ResID,R.ResTypeID,R.VacID,ResNo,RT.TypeName,ResDescription');
            $pTable = "hrs_residentials R";
            $joins = array(
                array(
                    'table' => 'hrs_residential_type RT',
                    'condition' => 'RT.ResTypeID=R.ResTypeID',
                    'type' => 'INNER'
                ),
                array(
                    'table' => 'hrs_vacancy_type VT',
                    'condition' => 'VT.VacID=R.VacID',
                    'type' => 'INNER'
                )
            );
            if (isset($vacID) && $vacID > 0 && $vacID !== NULL) {
                $where = array(
                    'VT.VacID' => $vacID
                );
                $addColumn = '';
                $result = $this->Common_Model->select_fields_joined_DT($data, $pTable, $joins, $where, $addColumn, $unsetColumn = '');
            } else {
                $result = $this->Common_Model->select_fields_joined_DT($data, $pTable, $joins, $where = '', $addColumn = '', $unsetColumn = '');
            }
            $result = json_decode($result,true);
            foreach($result['aaData'] as $key => $row){
                if($row[2] === '1'){
                    $column = "<a href='#editBtnModal' data-toggle='modal' class='editBtnFunc'><i style='color: #666666' class='fa fa-user fa-fw fa-2x'></i></a><a href='#' id='deleteBtn' class='deleteBtnFunc'><i style='color: #ff0000' class='fa fa-minus fa-fw fa-2x'></i></a>";
                    array_push($result['aaData'][$key],$column);
                }
                elseif($row[2] === '2'){
                    $column = "<a href='#editBtnModal' data-toggle='modal' class='editBtnFunc'><i style='color: #3e8f3e' class='fa fa-plus fa-fw fa-2x'></i></a>";
                    array_push($result['aaData'][$key],$column);
                }
            }
            $result = json_encode($result);
            print_r($result);
        }
    }
    function addNewPropertyDealer(){
        if($this->input->is_ajax_request()){
            if($this->input->post()){
                $companyName = mysql_real_escape_string($this->input->post('companyName'));
                $agentName = mysql_real_escape_string($this->input->post('agentName'));
                $cnic = mysql_real_escape_string($this->input->post('cnic'));
                $mobileNo = mysql_real_escape_string($this->input->post('mobileNo'));
                $email = mysql_real_escape_string($this->input->post('email'));

                if(empty($companyName) || empty($agentName) || empty($mobileNo)){
                    return "FAIL::SomeData is Still Missing, Please Ensure you Filled the Forms Correctly::error";
                }
                $tbl = 'hrs_propertydealers';
                $data = array(
                    'CompanyName' => $companyName,
                    'FullName' => $agentName,
                    'CNIC' => $cnic,
                    'MobileNo' => $mobileNo,
                    'Email' => $email
                );
                $result = $this->Common_Model->insert_record($tbl,$data);
                if($result>0){
                    echo "OK::Record Successfully Created::success::".$result;
                }
                else{
                    echo "FAIL:: Some Error, Error Occurred In Database::error";
                }
            }
        }
        else{
            redirect($this->data['errorPage_403']);
        }
    }
    function assignTenantToProperty(){
        if($this->input->is_ajax_request()){
            if($this->input->post()){

            }
        }
    }
}