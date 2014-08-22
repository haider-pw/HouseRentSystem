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
     if($_POST) {
         $sEcho=mysql_real_escape_string($_POST["sEcho"]);
         $sSearch=mysql_real_escape_string($_POST["sSearch"]);
         $sColumns=mysql_real_escape_string($_POST["sColumns"]);
         $iColumns=mysql_real_escape_string($_POST["iColumns"]);
     }
/*     $iDisplayStart = $this->input->get_post('iDisplayStart', true);
     $iDisplayLength = $this->input->get_post('iDisplayLength', true);
     $iSortCol_0 = $this->input->get_post('iSortCol_0', true);
     $iSortingCols = $this->input->get_post('iSortingCols', true);
     $sSearch = $this->input->get_post('sSearch', true);
     $sEcho = $this->input->get_post('sEcho', true);*/
/*     $data=array('*');
     $PTable="sys_forms";
     $joins=array(
         array(
             "table"     => "sys_forms_in_roles",
             "condition" => "sys_forms_in_roles.FormID = sys_forms.FormID",
             "jointype"  => "inner"
         )
     );
     $cData['aaData']=$this->configuration->joined_get_by($data, $PTable, $joins,$where='',$group_by='');

    //-------

    header("Content-type: application/json");
    print json_encode($cData);*/



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
    function delete($id)
    {
        //add some delete code
        redirect('subscriber');
    }

}