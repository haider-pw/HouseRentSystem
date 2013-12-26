<?php

class main extends Frontend_Controller{
    function __construct(){
        parent::__construct();
    }

    public function index()
    {
        $this->smarty->view( 'home.tpl');
    }
}