<?php if (!defined('BASEPATH')) exit('No direct script access allowed');
/**
 * Created by PhpStorm.
 * User: HaiderHassan
 * Date: 2/4/14
 * Time: 4:09 PM
 */
class Residentials extends Admin_Controller{
    function __construct(){
        parent::__construct();
    }

    function Houses(){
        $data['title']="Houses";
        $this->parser->parse('admin/systemResidentialsHouses.tpl',$this->data);
    }
    function Flats(){
        $data['title']="Houses";
        $this->parser->parse('admin/systemResidentialsFlats.tpl',$this->data);
    }
}