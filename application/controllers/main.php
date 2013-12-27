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
        $data['template'] = "home.tpl";
        $data['templateName'] = "Home template";
        $this->smarty->view( 'main.tpl', $data);
    }
}