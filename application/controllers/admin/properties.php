<?php if (!defined('BASEPATH')) exit('No direct script access allowed');
/**
 * Created by PhpStorm.
 * User: HaiderHassan
 * Date: 2/4/14
 * Time: 4:09 PM
 */
/**
 * @param PropertiesModel $PropertiesModel Loading Properties Model from Models.
 */
class Properties extends Admin_Controller
{
    function __construct()
    {
        parent::__construct();
        $this->load->model('hrs/PropertiesModel');
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
    function AssignTenantProperty($residentialID){
        $UserID = $this->data['UserID'];
        if (is_admin($UserID) == TRUE || is_allowed($UserID) == TRUE) {
            if(!isset($residentialID) && !($residentialID>0)){
                redirect($this->data['errorPage_500']);
            }
        $this->data['title'] = "Assign Property To Tenant";
        $this->data['propertyID'] = $residentialID;
        $this->parser->parse('admin/hrs/properties/AssignTenant', $this->data);
        } else {
            redirect($this->data['errorPage_403']);
        }
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
                    $column = "<a href='#' class='userDetailsFunc'><i style='color: #666666' class='fa fa-user fa-fw fa-2x'></i></a><a href='#' id='deleteBtn' class='removeTenantFromPropertyFunc'><i style='color: #ff0000' class='fa fa-minus fa-fw fa-2x'></i></a>";
                    array_push($result['aaData'][$key],$column);
                }
                elseif($row[2] === '2'){
                    $column = "<a href='#' class='assignTenantToPropertyFunc'><i style='color: #3e8f3e' class='fa fa-plus fa-fw fa-2x'></i></a>";
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

    function assignTenantToProperty()
    {
        if ($this->input->is_ajax_request()) {
            if ($this->input->post()) {
                $tenantID = mysql_real_escape_string($this->input->post('tenantID'));
                $securityDeposit = mysql_real_escape_string($this->input->post('securityDeposit'));
                $downPayment = mysql_real_escape_string($this->input->post('downPayment'));
                $startingRent = mysql_real_escape_string($this->input->post('startingRent'));
                $state = mysql_real_escape_string($this->input->post('state'));
                $referencerName = mysql_real_escape_string($this->input->post('referenceName'));
                $thirdParty = mysql_real_escape_string($this->input->post('thirdParty'));
                $resID = mysql_real_escape_string($this->input->post('resID'));

                if(!isset($resID) && !($resID>0)){
                    redirect($this->data['errorPage_500']);
                    return;
                }

                if (isset($tenantID) && $tenantID > 0 && isset($startingRent) && $startingRent > 0 && $securityDeposit > 0 && isset($state)) {

                    if($state === 'thirdParty' && !(isset($thirdParty) && $thirdParty>0)){
                        echo 'FAIL:: If you choose Third Party, You Must Provide Third Party Details::error';
                        return;
                    }
                    $PTable = 'hrs_tenant_residential';
                    $formData = array(
                        'TenantID' => $tenantID,
                        'ResID' => $resID,
                        'StartingRent' => $startingRent,
                        'SecurityDeposit' => $securityDeposit,
                        'DownPayment' => $downPayment,
                        'AssignedBy' => $this->data['UserID'],
                        'DateAssigned' => $this->data['dbCurrentDate']
                    );

                    $allowedExt = array('jpeg', 'jpg', 'png', 'gif', 'pdf');
                    if (isset($_FILES['image']['name'])) {
                        $FileName = $_FILES['image']['name'];
                        $ext = end(explode('.', $FileName));
                        if (!in_array(strtolower(end(explode('.', $FileName))), $allowedExt)) {
                            echo "FAIL:: Only Images JPEG, PNG and GIF and File PDF are Allowed, No Other Extensions Are Excepted::error";
                            return;
                        } else {
                            //we need userId for that Tenant, so Lets Find UserID for this selected Tenant.
                            $tbl = 'hrs_tenants';
                            $data = ('UserID');
                            $where = array(
                                'TenantID' => $tenantID
                            );
                            $result = $this->Common_Model->select_fields_where($tbl,$data,$where,TRUE);
                            $userID = $result->UserID;
                            if(!isset($userID) && !($userID>0)){
                                echo 'FAIL::No User is Assigned to This Selected Tenant::error';
                                return;
                            }
                            //End of Finding UserID for the Selected Tenant.
//                            Now We Need to Set the Users Upload Directory and Upload Path to Upload the Posted File
                            $uploadPath = FCPATH.'uploads\\users\\' . $userID . '\\files\\'.strtolower($ext).'\\';
                            $uploadDirectory = FCPATH.'uploads\\users\\' . $userID.'\\files\\'.strtolower($ext);
                            $FileName = "HRS_User_" . $userID . "_" . time() . "." . $ext;
                            if (!is_dir($uploadDirectory)) {
                                if (!mkdir($uploadDirectory, 0755, true)) {
                                    echo "FAIL::Directory Could Not Be Created On the Server, Also No Record Created.::error";
                                    return;
                                }
//                                mkdir($uploadDirectory, 0755);
                            }
                            move_uploaded_file($_FILES['image']['tmp_name'], $uploadPath . $FileName);
                            $formData['AgreementCopy'] = $FileName;
                            $result = $this->PropertiesModel->assignTenantToProperty($PTable,$formData);
                            if ($result === TRUE) {
                                echo "OK::Tenant Successfully Assigned To Property::success";
                                return;
                            }
                            elseif($result === FALSE){
                                echo "FAIL::Some Database Error Occurred, No Record Created::error";
                                return;
                            }
                            else{
                                echo $result;
                                return;
                            }
                        }
                    }
                }
                else{
                    echo "FAIL::You Must Fill the Form Correctly::error";
                    return;
                }
            }
        }
        else{
            redirect($this->data['errorPage_403']);
        }
    }

    function removeTenantFromProperty()
    {
        if ($this->input->is_ajax_request()) {
            if ($this->input->post()) {
                $resID = mysql_real_escape_string($this->input->post('resID'));
                $result = $this->PropertiesModel->removeTenantFromProperty($resID);
                if ($result === TRUE) {
                    echo "OK::Success, Record Successfully Deleted::success";
                    return;
                } elseif ($result === FALSE) {
                    echo "FAIL::Some Database Error, Record Could Not Be Deleted::error";
                }
            }
        }
    }
}