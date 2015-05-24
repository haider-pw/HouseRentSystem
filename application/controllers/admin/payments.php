<?php
/**
 * Created by PhpStorm.
 * User: COD3R
 * Date: 5/24/2015
 * Time: 6:18 PM
 */

class payments extends Admin_Controller
{
    function __construct()
    {
        parent::__construct();
    }

    public function invoice(){
        $this->data['title'] = "Payment Invoice";
        $this->parser->parse('admin/hrs/payments/invoice', $this->data);
    }
}
