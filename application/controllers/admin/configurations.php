<?php if (!defined('BASEPATH')) exit('No direct script access allowed');
/**
 * Created by PhpStorm.
 * User: Syed Haider Hassan
 * Date: 2/4/14
 * Time: 4:09 PM
 */
class Configurations extends Admin_Controller{
    function __construct(){
        parent::__construct();
        $this->load->library('Datatables.php');
        $this->load->library('table');
        $this->load->model('system/configuration');
    }



    /**
     * Under This Block Only Thoses Functions Will Reside Which Opens Up The Templates/Views - Called the View Functions Block
     */
    //Function:ManageForms will load the view of Manage Forms.
    function ManageForms(){
        $this->data['title']="Manage Forms";
        //echo "'".$this->uri->segment(1)."'";
        //exit;
        $this->parser->parse('admin/systemConfigurationManageForms',$this->data);
    }

    //Function:ManageForms will load the view of Manage Forms.
    function ManageTabs(){
        $this->data['title']="Manage Tabs";
        $this->parser->parse('admin/systemConfigurationManageTabs',$this->data);
    }
    function SitePreferences(){
        $this->data['title']="Site Preferences";
        $data = "settingsID,settingsKey,settingsValue";
        $tbl="sys_config";
        $this->data['data']=$this->Common_Model->select_fields($tbl, $data, $single=FALSE);
        //$this->parser->parse('admin/systemConfigurationSitePreferences',$this->data);
        $this->parser->parse('admin/system/configurations/SitePreferences.tpl',$this->data);
    }
/*---------------------End of View Functions Block---------------------------*/



    //List all the forms in DataTables if belong to the certain role..
    //DT= Data Tables
 function listForms_DT(){
     $this->datatables->select('FormID, FormName, FormPath, FormCIPath')
         //->unset_column('FormID')
         ->add_column("Actions", "<a href='#editBtnModal' data-toggle='modal' class='editBtnFunc'><i style='color: #666666' class='fa fa-pencil fa-fw fa-2x'></i></a><a href='#' id='deleteBtn' class='deleteBtnFunc'><i style='color: #ff0000' class='fa fa-times fa-fw fa-2x'></i></a>", "FormID")
         ->from('sys_forms');
     echo $this->datatables->generate();
}//end of list_forms_view
    function listTabs_DT(){
        $this->datatables->select('TabID, TabName, TabOrder, TabDesc')
            //->unset_column('FormID')
            ->add_column("Actions", "<a href='#editBtnModal_ManageTabs' data-toggle='modal' class='editBtnFunc_ManageTabs'><i style='color: #666666' class='fa fa-pencil fa-fw fa-2x'></i></a><a href='#' id='deleteBtn' class='deleteBtnFunc'><i style='color: #ff0000' class='fa fa-times fa-fw fa-2x'></i></a>", "TabID")
            ->from('sys_tabs');
        echo $this->datatables->generate();
    }

    function GetFormData($id)
    {
        $where = array(
            'FormID' => $id
        );
        $tbl='sys_forms';
        $data=('FormName,FormPath,FormCIPath,IsMenuLink');
        $result = $this->Common_Model->select_fields_where($tbl,$data,$where);
        print json_encode($result);
    }
    function UpdateFormData()
    {
        if($this->input->post())
        {
            $FormID = mysql_real_escape_string($this->input->post('FormID'));
            $FormName = mysql_real_escape_string($this->input->post('FormName'));
            $FormPath = mysql_real_escape_string($this->input->post('FormPath'));
            $FormCIPath = mysql_real_escape_string($this->input->post('FormCIPath'));
            $IsMenuLink = mysql_real_escape_string($this->input->post('IsMenuLink'));
            $tbl="sys_forms";
            $data=array(
                'FormName' => $FormName,
                'FormPath' => $FormPath,
                'FormCIPath' => $FormCIPath,
                'IsMenuLink' => $IsMenuLink,
            );
            $field = "FormID";
            $affected_row = $this->Common_Model->update_query($tbl,$field,$FormID,$data);
            if($affected_row)
            {
                echo "OK::Record Successfully Updated::success";

            }else{
                echo "FAIL::Some Error, Record Could Not Be Updated::error";
            }

        }
        else
        {
            echo "FAIL::No Data Posted, You Must Enter Data.::warning";
        }
    }
    function deleteFormData($FormID)
    {
        $columns = "MenuID";
        $where = array(
            'FormID' =>$FormID
        );
        $MenuIDs = $this->Common_Model->select_fields_where('sys_forms',$columns,$where,TRUE);
        //echo $MenuIDs->MenuID;
        $tbl = "sys_forms";
        $where = array(
                'FormID' => $FormID
            );
        $result1 = $this->Common_Model->delete($tbl,$where);
        $tbl = "sys_menus";
        $where = array(
            'MenuID' => $MenuIDs->MenuID
        );
        $result2 = $this->Common_Model->delete($tbl,$where);
        if ($result1==true && $result2==true){
            echo "OK::Record Successfully Deleted::success";
        }
        else{
            echo "FAIL::Some Error, Record Could Not Be Deleted::error";
        }

    }
    function addNewForm(){
        if($this->input->post()){
            $MenuName = mysql_real_escape_string($this->input->post('MenuName'));
            $FormName = mysql_real_escape_string($this->input->post('FormName'));
            $FormPath = mysql_real_escape_string($this->input->post('FormPath'));
            $FormCIPath = mysql_real_escape_string($this->input->post('FormCIPath'));
            $IsMenuLink = mysql_real_escape_string($this->input->post('IsMenuLink'));
            $TabID = mysql_real_escape_string($this->input->post('TabID'));
            $MenuOrder = mysql_real_escape_string($this->input->post('MenuOrder'));
            $ParentMenuID = mysql_real_escape_string($this->input->post('ParentMenuID'));
            if(empty($ParentMenuID)){
                $ParentMenuID = "0";
            }
            $data_sysMenus = array(
                'TabID' => $TabID,
                'MenuName' => $MenuName,
                'MenuOrder' => $MenuOrder,
                'ParentID' => $ParentMenuID
            );
            $data_sysForms = array(
                'FormName' => $FormName,
                'FormPath' => $FormPath,
                'FormCIPath' => $FormCIPath,
                'IsMenuLink' => $IsMenuLink
            );
            $result = $this->Common_Model->insertInToMultipleTables($data_sysMenus,$data_sysForms);

            if($result==true){
                echo "OK::New Form Successfully Added::success";
            }
            else{
                echo "FAIL::Some Error, New Form Could Not Be Created::error";
            }
        }
        else{
            echo "FAIL::No Data Posted, You Must Enter Data::warning";
        }
    }
    function loadAllParentFormNames($TabID){
        $value = $this->input->post('term');
        $PTable='sys_menus';
        $data=array('FormID','FormName');
        $field='FormName';
        $where = array(
            'TabID' =>$TabID
        );
        $joins=array(
            array(
                'table' => 'sys_forms',
                'condition' => 'sys_forms.MenuID = sys_menus.MenuID',
                'jointype' => 'INNER'
            )
        );
        $searchResults = $this->Common_Model->get_autoCompleteJoin($PTable, $joins, $where, $data, $field, $value,$group_by=false);
        print json_encode($searchResults);
    }

 // -----------------------Tabs Section
    function loadAllTabNames(){
        $value = $this->input->post('term');
        $tbl='sys_tabs';
        $data=('TabID,TabName');
        $field='TabName';
        $searchResults = $this->Common_Model->get_autoComplete($tbl, $data, $field, $value, $where='',$group_by=false,$limit='');
        print json_encode($searchResults);
    }
    function GetTabData($tabID)
    {
        $where = array(
            'TabID' => $tabID
        );
        $tbl='sys_tabs';
        $data=('TabName,TabOrder,TabDesc');
        $result = $this->Common_Model->select_fields_where($tbl,$data,$where);
        print json_encode($result);
    }
    function UpdateTabData()
    {
        $tabID = $this->input->post('TabID');
        $tabName = $this->input->post('TabName');
        $tabOrder = $this->input->post('TabOrder');
        $tabDesc = $this->input->post('TabDesc');
        $tbl="sys_tabs";
        $data=array(
            'TabName' => $tabName,
            'TabOrder' => $tabOrder,
            'TabDesc' => $tabDesc
        );
        $field = "TabID";
        $affected_row = $this->Common_Model->update_query($tbl,$field,$tabID,$data);
        if($affected_row)
        {
            echo "OK::Record Successfully Updated::success";

        }else{
            echo "FAIL::Some Error, Record Could Not Be Deleted::success";
        }
    }
    function addNewTab(){
        if($this->input->post()){
            $tabName = mysql_real_escape_string($this->input->post('TabName'));
            $tabOrder = mysql_real_escape_string($this->input->post('TabOrder'));
            $tabDesc = mysql_real_escape_string($this->input->post('TabDesc'));
            //see if tabOrder is a numeric Value
            if(is_numeric($tabOrder)){
                $data = array(
                    'TabName' => $tabName,
                    'TabOrder' => $tabOrder,
                    'TabDesc' => $tabDesc
                );
                $tbl = "sys_tabs";
                $result = $this->Common_Model->insert_record($tbl,$data);
                if($result==true){
                    echo "OK::New Tab Successfully Added::success";
                }
            }
            else
            {
                echo "FAIL::Tab Order Must Be a Numeric Value::warning";
            }
        }
        else
        {
            echo "FAIL::No Data Posted, You Must Enter Data.::warning";
        }

    }

    function deleteTabData($tabID)
    {
        $columns = "MenuID";
        $where = array(
            'TabID' =>$tabID
        );
        $tbl = "sys_tabs";
        $result = $this->Common_Model->delete($tbl,$where);
        if ($result==true){
            echo "OK::Record Successfully Deleted::success";
        }
        else{
            echo "FAIL::Some Error, Record Could not Be Deleted.::error";
        }

    }

    /*-------------------Now Site Configuration-------------------*/

   function UpdateSiteSettings($textBoxNameAttr){
       if($this->input->post() && !empty($textBoxNameAttr)){
           $settingsValue = $this->input->post('name');
       }
       $data = array(
         'SettingsValue'  => $settingsValue
       );
       $where = array(
           'SettingsKey' => $textBoxNameAttr
       );
       $tbl = "sys_config";
       $result = $this->Common_Model->update($tbl, $where, $data);
       if($result == true){
           echo "OK::Record Successfully Updated::success";
       }
       else{
           echo "Some Error,".$result."::error";
       }
   }
    function UploadFiles(){
      $allowedExt = array('jpeg','jpg','png','gif');
        if($this->input->post()){
            $fieldName = $this->input->post('field');
            $uploadTo = $this->input->post('uploadTo');
        }

        if(isset($_FILES[0]['name']))
        {
            $FileName = $_FILES[0]['name'];
            $ext = end(explode('.',$FileName));

            if(!in_array(strtolower(end(explode('.',$FileName))),$allowedExt))
            {
                echo "FAIL:: Only Image Upload is Allowed, No Other Extensions Are Excepted";
                return;
            }else
            {
                $table = 'sys_config';
                $settingsValue = 'SettingsValue';
                $where = array(
                    'SettingsKey' => $fieldName
                );
                switch($uploadTo){
                    case "site":
                        $uploadPath = './uploads/site_settings/';
                        break;
                    case "users":
                        $uploadPath = './uploads/users/';
                        break;
                    default:
                        $uploadPath = './uploads/';
            }
                //Check if Database is not returning Empty Result.
                $oldFile= $this->Common_Model->select_fields_where($table, $settingsValue,$where,$single=TRUE);
                $oldFile = $oldFile->SettingsValue;
                if (!empty($oldFile)) {
                    //Check If File Exist against the name defined in DB
                    if (file_exists($uploadPath .$oldFile)) {
                        //Delete the Old File..
                        unlink($uploadPath . $oldFile);
                    }
                }
                $FileName = "HRS_".time().".".$ext;
                move_uploaded_file($_FILES[0]['tmp_name'],$uploadPath.$FileName);
                $data['SettingsValue'] = $FileName;
            }
        }

        $result =  $this->Common_Model->update($table, $where, $data);
        if($result == true){
            echo "OK::File Uploaded Successfully::success";
        }else{
            echo "FAIL::Some Error in Database, File Could Not Be Uploaded";
        }
    }

    function customSearchTest(){
        if($this->input->post()){
            $field = $this->input->post('searchFilter');
            $columns= 'roomName';
//            $result = $this->Common_Model->select_fields_where_like('roomnames', $columns,$where='',$single=FALSE,$columns,$field);
            echo 'baba ji ka functino';
            }
        }
}