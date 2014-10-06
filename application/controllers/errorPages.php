<?php
/**
 * Created by PhpStorm.
 * User: HaiderHassan
 * Date: 10/6/14
 * Time: 8:47 AM
 */

class ErrorPages extends My_Controller {

    function __construct(){
        parent::__construct();
    }

    function error_404()
    {
        $this->output->set_status_header('404');
        $this->data['title'] = '404 - Not Found';
        $this->parser->parse('error_pages/404',$this->data);
    }
    function error_403()
    {
        $this->output->set_status_header('403');
        $this->data['title'] = '404 - Not Found';
        $this->parser->parse('error_pages/403',$this->data);
    }
}