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
    }

    function ManageForms(){
        $data['title']="Users Dashboard";
        $this->parser->parse('admin/systemConfigurationManageForms.tpl',$this->data);
    }
}