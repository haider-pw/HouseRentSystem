<?php
/**
 * Created by PhpStorm.
 * User: HaiderHassan
 * Date: 10/14/14
 * Time: 1:27 PM
 */

class Configurations extends Admin_Controller{
    function __construct(){
        parent::__construct();
        $this->load->library('Datatables.php');
        $this->load->library('table');
    }
}