<?php

class main extends Frontend_Controller{
    function __construct(){
        parent::__construct();
    }

    public function index()
    {
        $myArray = array('Controller' => $this->router->fetch_class(), 'Method' => $this->router->fetch_method());
        $this->smarty->assign('Fetch', $myArray);

        $this->smarty->assign("lang", "english");
        $this->data['template'] = "home.tpl";
        $this->data['templateName'] = "Home template";
        $this->parser->parse( 'main.tpl', $this->data);
        //echo "hello world";
 /*       $data['title'] = "test";
        $data['body'] = "babaji ka body";
        $this->parser->parse("smartytest.tpl", $data);*/
    }
}