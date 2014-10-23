<?php
/**
 * Created by PhpStorm.
 * User: Syed Haider Hassan
 * Date: 10/23/14
 * Time: 4:49 PM
 */

class PropertiesModel extends Common_Model
{
    function __construct()
    {
        parent::__construct();
    }
    function assignTenantToProperty($PTable,$data){
        $this->db->trans_start();
        //Inserting Record First in the hrs_tenant_residential
        $this->db->insert($PTable, $data);
        //Now Will Update the Residential Info As it is not longer Available
        $this->db->where('ResID', $data['ResID']);
        $resData = array(
            'TenantID' => $data['TenantID'],
            'VacID'   => '1'
        );
        $this->db->update('hrs_residentials', $resData);
        $this->db->trans_complete();
        if ($this->db->trans_status() === FALSE)
        {
            return FALSE;
        }
        else{
            return TRUE;
        }
    }
}