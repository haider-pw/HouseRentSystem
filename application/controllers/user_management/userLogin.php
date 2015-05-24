<?php
/**
 * Created by PhpStorm.
 * User: HaiderHassan
 * Date: 12/30/13
 * Time: 1:13 AM
 */

class userLogin extends MY_Controller{
    function __construct(){
        parent::__construct();
    }

public function login(){
    if(!$this->input->post()){
    // if nothing submitted or this controller method is directly accessed then user will be redirected to the home page.
        $data['template'] = "home.tpl";
        $this->smarty->view( 'main.tpl', $data);
    }else{
        $this->form_validation->set_rules('Username', 'Username', 'trim|required|min_length[5]|max_length[50]|strtolower|xss_clean');
        $this->form_validation->set_rules('Password', 'Password', 'trim|required|min_length[5]|max_length[50]|md5|do_hash');
        $this->form_validation->run();
        $sourcePage = $this->input->post('sourcePage');
        $username = $this->input->post('Username');
        $password = $this->input->post('Password');
        $where = array(
            'Username' => $username,
            'Password' => $password
        );
        $result = $this->Common_Model->login($where);
        // if the user successfully logged in, then result will be TRUE
        if($result===TRUE){
            redirect($sourcePage); // redirect to the main URI of the Site for the current
        }else{
            //redirect('/user_management/login_form?STATUS=LOGINFAILED');
            echo "wrong pass";
            exit();
        }

    }
}
    public function logout(){
        if($_POST){ //if the use logouts from the main site, he will be redirected to page he was currently viewing
            $sourcePage = mysql_real_escape_string($_POST["sourcePage"]);
            //redirect($sourcePage);
            $this->Common_Model->logout();
            echo 'true';
        }
        else{ //if the user was in administration, then this logout function will redirect him to the main site page.
            $this->Common_Model->logout();
            redirect(base_url('main/index'));
        }

    }

    public function loginFailed(){
        $data = NULL; // if needed any data then will use in this to forward to template
        //$this->parser->parse('user_management/failed_login.tpl',$data);
        redirect($this->data['errorPage_401']);
    }
}