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
        $TRWhere = array(
            'ResID' => $data['ResID'],
            'IsActive' => '1'
        );
        $this->db->select('TRID')->from('hrs_tenant_residential')->where($TRWhere);
        $query = $this->db->get();
        $records = $query->num_rows();
        if(isset($records) && $records>0){
            $msg = 'FAIL::Record Already Exist In Database for this Property::error';
            return $msg;
        }
        $this->db->trans_start();
       //Inserting Record First in the hrs_tenant_residential
        $this->db->insert($PTable, $data);
        //Now Will Update the Residential Info..
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
    function removeTenantFromProperty($resID){
        $this->db->trans_start();
        //First UnAssign Tenant From the Selected Property
        $condition = array(
            'ResID' => $resID
        );
        $TRData = array(
            'DateRevoked' => $this->modelData['dbCurrentDate'],
            'RevokedBy' => $this->modelData['UserID'],
            'IsActive' => (int)'0'
        );
        $this->db->update('hrs_tenant_residential',$TRData, $condition);

        //Now We Will Update Residential Info
        $this->db->where('ResID', $resID);
        $resData = array(
            'TenantID' => '0',
            'VacID'   => '2'
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