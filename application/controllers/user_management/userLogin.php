<?php
/**
 * Created by PhpStorm.
 * User: HaiderHassan
 * Date: 12/30/13
 * Time: 1:13 AM
 */

class userLogin extends My_Controller{
    function __construct(){
        parent::__construct();
    }

public function login(){
/*    if(!$this->input->post()){// if nothing submitted then

        $data['last_visited_page']='';
        $this->smarty->view( 'main.tpl', $data);
    }else{
        // This code verifies that the user has properly logged in
        $this->load->model('user_management/Check_login_model');
        if($this->Check_login_model->authenticate()>=1){
            redirect('/main/'); // redirect to the main URI of the Site for the current
        }else{
            redirect('/user_management/login_form?STATUS=LOGINFAILED');
            exit();
        }

    }*/
echo "controller showing current url"; current_url();
}
}