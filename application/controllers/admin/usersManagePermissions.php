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
        $this->load->model('system/configuration');
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

}