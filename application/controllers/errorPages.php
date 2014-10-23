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
    //401 function executes if:
//    A user tries to open a page/method which is only allowed for logged in users.
    function error_401()
    {
        $this->output->set_status_header('401');
        $this->data['title'] = '401 - Unauthorized Access';
        $this->parser->parse('error_pages/401',$this->data);
    }
    //404 function executes if:
//    For a Page that do not exist anymore or if a user try to open a link or method that do not exist.
    function error_404()
    {
        $this->output->set_status_header('404');
        $this->data['title'] = '404 - Not Found';
        $this->parser->parse('error_pages/404',$this->data);
    }
    //403function executes if:
//    If a user try to access a page, which he should not.
    function error_403()
    {
        $this->output->set_status_header('403');
        $this->data['title'] = '404 - Forbidden';
        $this->parser->parse('error_pages/403',$this->data);
    }
    //500function executes if:
//    If a server errors occur or If User tries something Stupid.
    function error_500()
    {
        $this->output->set_status_header('500');
        $this->data['title'] = '500 - Server Error';
        $this->parser->parse('error_pages/500',$this->data);
    }

}