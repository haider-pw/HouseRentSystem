<?php

class Common_Model extends MY_Model{

    function __construct(){
        parent::__construct();
    }

    public function login($Where){
        $UserTable = 'pbs_users';
        $user = $this->get($UserTable,$Where,TRUE);
        if(count($user)){
//Log the User in if User Record is Returned
            $data=array(
                'FullName' => $user['FullName'],
                'email' => $user['Email'],
                'UserID' => $user['UserID'],
                'LoggedIn' => TRUE
            );
            $this->session->set_userdata($data);
            return TRUE;
        }
    }
    public function logout(){
        $this->session->sess_destroy();
    }
    public function loggedin(){
        return (bool) $this->session->userdata('LoggedIn');
    }
    public function hash($string){
        return hash('sha512', $string.config_item('encryption_key'));
    }
}
