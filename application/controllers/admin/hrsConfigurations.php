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
                $addColumn = "<a href='#editBtnModal' data-toggle='modal' class='editBtnFunc'><i style='color: #666666' class='fa fa-pencil fa-fw fa-2x'></i></a><a href='#' id='deleteBtn' class='deleteBtnFunc'><i style='color: #ff0000' class='fa fa-times fa-fw fa-2x'></i></a>";
                $result = $this->Common_Model->select_fields_joined_DT($data,$tbl,'','',$addColumn,'');
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
}