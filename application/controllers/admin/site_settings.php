<?php if (!defined('BASEPATH')) exit('No direct script access allowed');
/**
 * Created by PhpStorm.
 * User: HaiderHassan
 * Date: 2/4/14
 * Time: 4:09 PM
 */
class Site_Settings extends Admin_Controller{
    function __construct(){
        parent::__construct();
    }

    function Preferences(){
        $data['title']="Users Dashboard";
        $this->parser->parse('admin/site_system/site_preferences.tpl',$this->data);
    }
}