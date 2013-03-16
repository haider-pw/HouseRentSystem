<?php
/**
 * Created by JetBrains PhpStorm.
 * User: Kill3rCoder-Lapi
 * Date: 3/10/13
 * Time: 3:29 AM
 * To change this template use File | Settings | File Templates.
 */
/* @property tenant $tenant
 * tenant is coming for tenant model.
 * */

class tenants extends CI_Controller{
    function  index(){
        $this->load->model('tenant');
        $data['tenants']= $this->tenant->getTenants();
        echo "<pre>"; print_r($data['tenants']); echo "</pre>";
        $this->load->view('tenants', $data);
    }
}