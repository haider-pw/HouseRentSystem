<?php
/**
 * Created by PhpStorm.
 * User: HaiderHassan
 * Date: 8/10/14
 * Time: 11:51 AM
 */
class Configuration extends Common_Model
{
    function __construct()
    {
        parent::__construct();
    }

    function addNewForm($data_sysMenus,$data_sysForms,$data_sysFormsInGroups){

        $this->db->trans_begin();

        $this->db->insert('sys_menus', $data_sysMenus);
        $menuID = $this->db->insert_id();

        $data_sysForms['MenuID'] = $menuID;
        $this->db->insert('sys_forms', $data_sysForms);
        $formID = $this->db->insert_id();

        $data_sysFormsInGroups['FormID'] = $formID;
        $this->db->insert('sys_forms_in_groups', $data_sysFormsInGroups);

        if ($this->db->trans_status() === FALSE)
        {
            $this->db->trans_rollback();
            return false;
        }
        else
        {
            $this->db->trans_commit();
            return true;
        }
    }//end of insert_job
}