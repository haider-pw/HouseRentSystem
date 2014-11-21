<?php
/**
 * Created by PhpStorm.
 * User: Syed Haider Hassan.
 * Date: 10/7/14
 * Time: 3:30 AM
 */

class usersManagePermissions extends Admin_Controller
{
    function __construct()
    {
        parent::__construct();
        $this->load->library('Datatables.php');
        $this->load->library('table');
        $this->load->helper('dataTables');
        $this->load->model('users/manage_permissions');
    }

/*//////////////////////////////////////////////////////////////////////
////////////////////Views Under the Manage Users Main Menu/////////////////////
///////////////////////////////////////////////////////////////////////*/

    function ListFormsInGroups()
    {
        $UserID = $this->session->userdata('UserID');
        if (is_admin($UserID) == TRUE || is_allowed($UserID) == TRUE) {
            $this->data['title'] = "Forms In Groups";
            $this->parser->parse('admin/users/manage_permissions/listFormsInGroups', $this->data);
        } else {
            redirect($this->data['errorPage_403']);
        }
    }


    /*//////////////////////////////////////////////////////////////////////
////////////////////Functions for the Above Views/////////////////////
///////////////////////////////////////////////////////////////////////*/

    //Function to populate database in view.
    function listFormsInGroups_DT($selectedGroupID){
        //Code to List Data in in DataTables for Listing of Users
        if($this->input->post()){
            $data = ('
        f.FormID,
        f.FormName,
        f.FormCIPath,
        MIN(g.IsMenuLink) AS IsMenuLink,
        GROUP_CONCAT(DISTINCT g.GroupID ORDER BY g.GroupID) AS GroupIDs
        ');
            $PTable = "sys_forms f";
            $joins =array(
                array(
                    'table' => 'sys_forms_in_groups g',
                    'condition' => 'g.FormID = f.FormID',
                    'jointype' => 'INNER'
                )
            );
            $addColumn = "<input class='make-switch' type='checkbox' data-on-color='success' data-on-text='Grant' data-off-text='Restrict' data-off-color='danger'>";
            $group_by = 'f.formID';
            if(mysql_real_escape_string($selectedGroupID) !== 0 && mysql_real_escape_string($selectedGroupID) !== '' && mysql_real_escape_string($selectedGroupID)>0){
/*                $where_in = array(
                    'g.GroupID' => array('1',mysql_real_escape_string($selectedGroupID))
                );*/
                $where_in = array('1',mysql_real_escape_string($selectedGroupID));
                $where = '';
            }
            elseif (mysql_real_escape_string($selectedGroupID)== 0){
/*                $where = array(
                    'g.GroupID' => '1'
                );*/
                $where_in = '';
            }
            $where_in = array('1',mysql_real_escape_string($selectedGroupID));
            $where_in_c = 'g.GroupID';
            $result = $this->manage_permissions->listFormsInGroups_DT($data, $PTable,$joins, $where='', $addColumn,'',$where_in,$where_in_c,$group_by);
//        var_dump($result);
//        $result = $this->manage_permissions->listFormsInGroups_DT();
            print_r($result);
            //print_r($selectedGroupID);
        }
    }

    //This Function will be responsibe for inserting new record in to forms_in_groups.
    function insertInToFormInGroups(){
        if($this->input->is_ajax_request()){
        if($this->input->post()){
            $groupID = mysql_real_escape_string($this->input->post('GroupID'));
            $formID  = mysql_real_escape_string($this->input->post('FormID'));
            $state  = mysql_real_escape_string($this->input->post('State'));
            $table = 'sys_forms_in_groups';
            if($groupID==='0'){
                echo "FAIL::You Must Select the User Group First.::error";
                return;
            }
            elseif($groupID>0){
                //If the state is true (ON switch), then record will be inserted in table
                if($state === 'true' || $state === 'TRUE'){
                    $data = array(
                        'GroupID' => $groupID,
                        'FormID' => $formID,
                        'IsMenuLink' => '1'
                    );
                    $result = $this->Common_Model->insert_record($table,$data);
                    //Getting the FormCIPath for the Selected Form
                    $table = 'sys_forms';
                    $where = array(
                        'FormID' =>$formID
                    );
                    $getFormData = $this->Common_Model->select_fields_where($table,'FormCIPath',$where,TRUE);
                    //Now Get all those records which contains the partial FormCIPath as this above Complete FormCIPath Has.
                    $PTable = 'sys_forms';
                    $formCIPath = $getFormData->FormCIPath;
                    $formCIPathInArray = explode('/',$formCIPath);
                    $partialFormCIPath = $formCIPathInArray[0]."/".$formCIPathInArray[1]."/#";
                    $data=('sys_forms_in_groups.FormID,FormCIPath');
                    $field = 'FormCIPath';
                    $value = $partialFormCIPath;
                    $joins = array(
                        array(
                            'table' => 'sys_forms_in_groups',
                            'condition' => 'sys_forms_in_groups.FormID = sys_Forms.FormID',
                            'jointype' => 'INNER'
                        )
                    );
                    $where = array(
                        'GroupID' => 2
                    );
                    $mainMenuExist = $this->Common_Model->select_fields_where_like_join($PTable, $data,$where,TRUE,$field,$value,$joins);
                    //$mainMenuExistFormID = $mainMenuExist->FormID;
                    if(isset($mainMenuExist) && $mainMenuExist !== FALSE){
                        if($result>0){
                            echo 'OK::Record Successfully Updated::success';
                        }
                    }
                    elseif(strtolower($formCIPathInArray[1]) === 'dashboard'){
                            echo 'OK::Record Successfully Updated::success';
                    }
                    else{
                        //As the Record don't exist so We First need to find the Form ID for the Main Menu of the Current Current Inserted Menu
                        $table = 'sys_forms';
                        $where = array(
                            'FormCIPath' => $partialFormCIPath
                        );
                        $mainMenuFormID = $this->Common_Model->select_fields_where($table,'FormID',$where,TRUE);
                        $table = 'sys_forms_in_groups';
                        $data = array(
                            'GroupID' => $groupID,
                            'FormID' => $mainMenuFormID->FormID,
                            'IsMenuLink' => '1'
                        );
                        $result2 = $this->Common_Model->insert_record($table,$data);
                        if($result > 0 && $result2 > 0){
                            echo 'OK::Record Successfully Updated::success';
                        }
                        else{
                            echo 'FAIL::Record Could Not be Updated::error';
                        }
                    }
                }
                //if the state is sent false, then record will be deleted from table
                else if($state === 'false' || $state === 'FALSE'){
                    //Want to know, The Form We Deleted Just now, Was it the MainMenu Form or Was it a Child?
                    $table = 'sys_forms';
                    $data = ('FormCIPath');
                    $where = array(
                        'FormID' => $formID
                    );
                    $formCIPath = $this->Common_Model->select_fields_where($table,$data,$where,TRUE);
                    $formCIPathInArray = explode('/',$formCIPath->FormCIPath);
                    $partialFormCIPath = $formCIPathInArray[0]."/".$formCIPathInArray[1];
                    //If the Form We Just Deleted was the Parent Menu Form, Then If Statement Will Run.
                    if(isset($formCIPathInArray[2]) && $formCIPathInArray[2] == '#'){

                        //Now We Need to Know all the Child Forms Inside this Form We want to delete.
                        $tbl = "sys_forms";
                        $data = ('FormID');
                        $field = ('FormCIPath');
                        $value = $partialFormCIPath;
                        $formIDs = $this->Common_Model->select_fields_where_like($tbl,$data,'',FALSE,$field,$value);
                        $formIDsData = array();
                        foreach($formIDs as $key => $item){
                            array_push($formIDsData, $item->FormID);
                        }
                        //Now as we got the ids, we will delete the forms for the selected ids.
                        $tbl = 'sys_forms_in_groups';
                        $field = 'FormID';
                        $value = $formIDsData;
                        $where = array(
                            'GroupID' =>$groupID
                        );
                        $deleteResult = $this->Common_Model->multiple_delete($tbl,$field,$value,$where);
                        if ($deleteResult === TRUE){
                            echo "OK::Record Successfully Updated::success";
                        }
                        elseif($deleteResult === FALSE){
                            echo "FAIL::Record Could Not Be Updated::error";
                        }
                    }
                    else{
                        $condition = array(
                            'GroupID' => $groupID,
                            'FormID' => $formID
                        );
                        $table = 'sys_forms_in_groups';
                        $result = $this->Common_Model->delete($table,$condition);
                        if($result === TRUE){
                            echo "OK::Record Successfully Updated::success";
                        }
                        elseif($result === FALSE) {
                            echo "FAIL::Record Could Not Be Updated::error";
                        }
                    }
                }
            }
        }
            else{
                echo"No Data Posted to the Server";
            }
        }
        else{
            redirect($this->data['errorPage_404']);
        }
    }

}