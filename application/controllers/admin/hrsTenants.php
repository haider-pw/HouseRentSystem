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
        $UserID = $this->data['UserID'];
        if(is_admin($UserID)== TRUE || is_allowed($UserID) == TRUE){
        $this->data['title'] = "Manage Tenants";
        $this->parser->parse('admin/hrs/tenants/ManageTenants', $this->data);
        }
        else{
            redirect($this->data['errorPage_403']);
        }
    }

/*//////////////////////////////////////////////////////////////////////
////////////////////Functions for the Above Views/////////////////////
///////////////////////////////////////////////////////////////////////*/

    /**
     * @function CreateTenant_Action This Function Will Check for the Following Checks
     *  1. If the Request is Generated By Ajax.
     *  2. If the Request Has Some Data Posted.
     *  3. If Password and Confirm Password Matches.
     *  4. If Email Already Exist.
     *  5. If CNIC Already Exist.
     *  6. If The Extension of Selected Input File Matches with Allowed Extension's.     *
     * In this Function, First User Is Created, Then the Record is Inserted in Tenants Table on the basis for Created UserID
     */
function createTenant_Action(){
    if($this->input->is_ajax_request()){
        if($this->input->post()){
            $fullName = $this->input->post('fullName');
            $username = $this->input->post('username');
            $email = $this->input->post('userEmail');
            $cnic = $this->input->post('cnic');
            $mobile = $this->input->post('mobileNo');
            $pass = $this->input->post('pass');
            $confirmPass = $this->input->post('pass2');
            $theme = $this->input->post('theme');
            $userGroupID = $this->input->post('selectGroup');
            if ($pass === $confirmPass) {
                $pass = $this->hashPassword($pass);
                $data_users = array(
                    'UserName' => $username,
                    'Password' => $pass,
                    'FullName' => $fullName,
                    'Email' => $email,
                    'Mobile' => $mobile,
                    'CNIC' => $cnic,
                    'Theme' => $theme,
                    'GroupID' => $userGroupID
                );
                $table = "users_users";
                $data = ('Email,CNIC');
                $where= array(
                    'Email' => $email
                );
                //Before Insertion, We need to do 1 Final Check, that if email Address and CNIC are Unique or Not.
//                    checking for email
                $userEmail = $this->Common_Model->select_fields_where($table,$data,$where,TRUE);
                if(isset($userEmail->Email)){
                    echo "FAIL::Email Already Exist.::error";
                    return; //return the function if email already exist.
                }
//                    checking for CNIC Now.
                $where= array(
                    'CNIC' => $cnic
                );
                $userCNIC = $this->Common_Model->select_fields_where($table,$data,$where,TRUE);
                if(isset($userCNIC->CNIC)){
                    echo "FAIL::CNIC Already Exist.::error";
                    return; //return the function if cnic already exist.
                }

                //Now if values are unique we can continue to Add New User.
                $newUserID = $this->Common_Model->insert_record($table, $data_users);

                if(isset($newUserID) && $newUserID!='' && $newUserID>0){
                    //Now if the User is Created Then We Need to Create the Tenant For that Created User.
                    $tenantTable = 'hrs_tenants';
                    $currentDateTime = date("Y-m-d H:i:s");
                    $data_tenants = array(
                        'UserID' => $newUserID,
                        'IsActive' => 1,
                        'DateRegistered' => $currentDateTime,
                        'RegisteredBy' =>$this->data['UserID']
                    );
                    $resultTenant = $this->Common_Model->insert_record($tenantTable,$data_tenants);
                    //If the there are some Input Post Done then we will check if Image was also Posted.
                    //Before checking for image, first we need to set the Allowed Extensions for the Uploaded Image.
                    $allowedExt = array('jpeg','jpg','png','gif');
                    if(isset($_FILES['image']['name']))
                    {
                        $FileName = $_FILES['image']['name'];
                        $ext = end(explode('.',$FileName));

                        if(!in_array(strtolower(end(explode('.',$FileName))),$allowedExt))
                        {
                            echo "FAIL:: Only Image JPEG, PNG and GIF Images Allowed, No Other Extensions Are Excepted::error";
                            return;
                        }else
                        {
                            $uploadPath = './uploads/users/'.$newUserID.'/';
                            $uploadDirectory = './uploads/users/'.$newUserID;
                            $FileName = "HRS_User_".$newUserID."_".time().".".$ext;
                            if(!is_dir($uploadDirectory)){
                            mkdir($uploadDirectory, 0755);
                            }
                            move_uploaded_file($_FILES['image']['tmp_name'],$uploadPath.$FileName);
                            $updateFilData['Avatar'] = $FileName;
                            $where = array(
                                'UserID' => $newUserID
                            );
                            $result = $this->Common_Model->update($table,$where,$updateFilData);
                            if($result==true){
                                echo "OK::New Tenant Successfully Created::success";
                                return;
                            }
                        }
                    }else{
                        if ($newUserID > 0 && $resultTenant>0) {
                            echo "OK::New Tenant Successfully Created::success";
                            return;
                        }
                        else{
                            echo "FAIL::Some Error, Either Tenant or User is Not Created.::error";
                        }
                    }
                }
            }
        }
    }
    else{
        redirect($this->data['errorPage_403']);
    }
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
            $addColumn = "<a href='#' data-toggle='modal' class='detailsBtnFunc'><i style='color: #3e8f3e' class='fa fa-arrow-right fa-fw fa-2x'></i></a><a href='#editBtnModal' data-toggle='modal' class='editBtnFunc'><i style='color: #666666' class='fa fa-pencil fa-fw fa-2x'></i></a><a href='#' id='deleteBtn' class='deleteBtnFunc'><i style='color: #ff0000' class='fa fa-times fa-fw fa-2x'></i></a>";
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
            $addColumn = "";
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
                    $result = $this->Common_Model->insert_record($table,$data);
                    if($result>0){
                        echo "OK::Record Successfully Updated.::success";
                    }
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
    function deleteTenant(){
        if($this->input->is_ajax_request()){
            if($this->input->post()){
                $tID = mysql_real_escape_string($this->input->post('TID'));
                if(isset($tID) && $tID>0){
                    $tbl = 'hrs_tenants';
                    $where = array(
                        'TenantID' => $tID
                    );
                    $result = $this->Common_Model->delete($tbl,$where);
                    if($result===TRUE){
                        echo 'OK::Record Successfully Deleted::success';
                    }
                    elseif($result===FALSE){
                        echo 'FAIL::Some Error, Record Could Not Be Deleted::error';
                    }
                }
            }
        }
        else{
            redirect($this->data['errorPage_403']);
        }
    }
}