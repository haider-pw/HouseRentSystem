<?php

/**
 * Created by PhpStorm.
 * User: Syed Haider Hassan
 * Date: 11/20/2014
 * Time: 9:45 AM
 */
class hrsConfigurations extends Admin_Controller
{
    function __construct()
    {
        parent::__construct();
    }

    function ManageUtilityTypes()
    {
        $UserID = $this->data['UserID'];
        if (is_admin($UserID) == TRUE || is_allowed($UserID) == TRUE) {
            $this->data['title'] = 'Manage Utility Types';
            $this->parser->parse('admin/hrs/configurations/utilityTypes', $this->data);
        } else {
            redirect($this->data['errorPage_403']);
        }
    }

    /*//////////////////////////////////////////////////////////////////////
    ////////////////////Functions for the Above Views/////////////////////
    ///////////////////////////////////////////////////////////////////////*/

    function listUtilityTypes_DT(){
        if($this->input->is_ajax_request()){
            if($this->input->post()){
                $tbl = 'hrs_utility_type';
                $data = ('UTID,UName,UDescription');
                //$addColumn = "<a href='#editUtilityTypeModal' data-toggle='modal' class='editBtnFunc'><i style='color: #666666' class='fa fa-pencil fa-fw fa-2x'></i></a><a href='#' class='deleteBtnFunc'><i style='color: #ff0000' class='fa fa-times fa-fw fa-2x'></i></a>";
                $editColumnData = "";
                $editColumnName = "";
                $addColumns = array(
                    'Actions' => "<a href='#editUtilityTypeModal' data-toggle='modal' class='editBtnFunc'><i style='color: #666666' class='fa fa-pencil fa-fw fa-2x'></i></a><a href='#' class='deleteBtnFunc'><i style='color: #ff0000' class='fa fa-times fa-fw fa-2x'></i></a>",
                    'CheckBoxes' => "<input type='checkbox'>"
                );
                $result = $this->Common_Model->select_fields_joined_DT($data,$tbl,'','',$addColumns,'',$editColumnName,$editColumnData);
                print_r($result);
            }
            else{
                redirect($this->data['errorPage_500']);
            }
        }
        else{
            redirect($this->data['errorPage_403']);
        }
    }

    function addUtilityType(){
        if($this->input->is_ajax_request()){
            if($this->input->post()){
                $utilityTypeName = htmlspecialchars($this->input->post('UTName'));
                $utilityTypeDescription = mysql_real_escape_string(htmlspecialchars($this->input->post('UTDescription')));
                if(empty($utilityTypeName)){
                    echo 'FAIL::Please Fill The Form Correctly::error';
                    return;
                }
                $tbl = 'hrs_utility_type';
                $data = array(
                    'UName' => $utilityTypeName,
                    'UDescription' =>$utilityTypeDescription
                );
                $result = $this->Common_Model->insert($tbl,$data);
                if($result>0){
                    echo "OK::Record Successfully Added::success";
                }
                else{
                    echo "FAIL::Some Database Error,Record Could Not Be Added::error";
                }
            }
            else{
                redirect($this->data['errorPage_500']);
            }
        }
        else{
            redirect($this->data['errorPage_403']);
        }
    }

    function editUtilityType(){
        if($this->input->is_ajax_request()){
            if($this->input->post()){
                $utilityTypeID = mysql_real_escape_string($this->input->post('ID'));
                if(isset($utilityTypeID) && is_numeric($utilityTypeID) && $utilityTypeID>0){
                    $tbl = 'hrs_utility_type';
                    $data = ('UTID,UName,UDescription');
                    $condition = array(
                        'UTID' => $utilityTypeID
                    );
                    $result = $this->Common_Model->select_fields_where($tbl,$data,$condition,FALSE,'','','');
                    if($result !== FALSE){
                        echo json_encode($result);
                        return;
                    }
                }
            }else{
                redirect($this->data['errorPage_500']);
            }
        }
        else{
            redirect($this->data['errorPage_403']);
        }
    }

    function updateUtilityType(){
        if($this->input->is_ajax_request()){
            if($this->input->post()){
                $utilityTypeID = mysql_real_escape_string(htmlspecialchars($this->input->post('UT')));
                $utilityTypeName = mysql_real_escape_string(htmlspecialchars($this->input->post('UTName')));
                $utilityTypeDescription = mysql_real_escape_string(htmlspecialchars($this->input->post('UTDescription')));
                if(!isset($utilityTypeID) && !($utilityTypeID>0)){
                    echo "FAIL::Some Error in Posted Data, Please Contact Administrator to solve this issue::error";
                    return;
                }
                if(empty($utilityTypeName)){
                    echo "FAIL::Please Fill the Form Correctly::error";
                    return;
                }
                $tbl = 'hrs_utility_type';
                $data = array(
                    'UName' => $utilityTypeName,
                    'UDescription' => $utilityTypeDescription
                );
                $fields = array(
                    'UTID' => $utilityTypeID
                );
                $result = $this->Common_Model->update($tbl,$fields,$data);
                if($result === true){
                    echo"OK::Record Successfully Added::success";
                    return;
                }
                else{
                    echo "FAIL::Some Database Error, Record Could Not Be Added.";
                    return;
                }
            }
            else{
                redirect($this->data['errorPage_500']);
            }
        }
        else{
            redirect($this->data['errorPage_403']);
        }
    }

    //Now Delete the Utility Type from the Database
    function deleteUtilityType(){
        if($this->input->is_ajax_request()){
            if($this->input->post()){
                $utilityTypeID = mysql_real_escape_string($this->input->post('ID'));
                if(!empty($utilityTypeID) && is_numeric($utilityTypeID)){
                    $tbl = 'hrs_utility_type';
                    $condition = array(
                        'UTID' => $utilityTypeID
                    );
                    $result = $this->Common_Model->delete($tbl,$condition);

                    if($result === TRUE){
                        echo "OK::Record Successfully Deleted::success";
                        return;
                    }else{
                        echo "FAIL::Some Database Error, Record Could Not Be Deleted::error";
                        return;
                    }
                }
                else{
                    echo "FAIL::Some Error in Posted Data, Please Contact Administrator to solve this issue::error";
                    return;
                }
            }
            else{
                redirect($this->data['errorPage_500']);
            }
        }
        else{
            redirect($this->data['errorPage_403']);
        }
    }
}