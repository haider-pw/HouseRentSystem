<?php if (!defined('BASEPATH')) exit('No direct script access allowed');
/**
 * Created by PhpStorm.
 * User: HaiderHassan
 * Date: 2/4/14
 * Time: 4:09 PM
 */
class Configurations extends Admin_Controller{
    function __construct(){
        parent::__construct();
        $this->load->library('Datatables.php');
        $this->load->library('table');
        $this->load->helper('dataTables');
        $this->load->model('system/configuration');
    }


    //Function:ManageForms will load the view of Manage Forms.
    function ManageForms(){
        $data['title']="Users Dashboard";
        $this->parser->parse('admin/systemConfigurationManageForms.tpl',$this->data);
    }


    function testing(){
        $data['title']="Users Dashboard";
        $this->parser->parse('admin/systemConfigurationManageForms.tpl',$this->data);
    }


    //List all the forms in DataTables if belong to the certain role..
    //DT= Data Tables
 function listForms_DT(){
     $this->datatables->select('FormID, FormName, FormPath, FormCIPath')
         //->unset_column('FormID')
         ->add_column("Actions", "<a href='#editBtnModal' data-toggle='modal' class='editBtnFunc'><i style='color: #666666' class='fa fa-pencil fa-fw fa-2x'></i></a><a href='#' id='deleteBtn'><i style='color: #ff0000' class='fa fa-times fa-fw fa-2x'></i></a>", "FormID")
         ->from('sys_forms');
     echo $this->datatables->generate();
}//end of list_forms_view

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
        $FormID = $this->input->post('FormID');
        $FormName = $this->input->post('FormName');
        $FormPath = $this->input->post('FormPath');
        $FormCIPath = $this->input->post('FormCIPath');
        $tbl="sys_forms";
        $data=array(
            'FormName' => $FormName,
            'FormPath' => $FormPath,
            'FormCIPath' => $FormCIPath,
        );
        $field = "FormID";
        $affected_row = $this->Common_Model->update_query($tbl,$field,$FormID,$data);
        if($affected_row)
        {
            echo true;

        }else{
            echo false;
        }
    }
    function delete($id)
    {
        //add some delete code
        redirect('subscriber');
    }
    function loadAllParentFormNames(){
        $value = $this->input->post('term');
        $tbl='sys_forms';
        $data=('FormID,FormName');
        $field='FormName';
        $searchResults = $this->Common_Model->get_autoComplete($tbl, $data, $field, $value, $where='',$group_by=false,$limit='');
        print json_encode($searchResults);
    }

}