<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

/**
 * Created by PhpStorm.
 * User: HaiderHassan
 * Date: 2/2/14
 * Time: 6:28 PM
 */

class Login_Check extends Common_Model
{
    function __construct()
    {
        parent::__construct();
    }

    // The following function will check if the user has  logged in properly or not.
    // The the user is not logged then then this function will force him out of the system and ask for re login
    // This function returns true if a user authentication is successfully
    public function authenticate($auth_mode = 'NO_COOKIES')
    {

        $this->load->library('form_validation');
        $this->load->helper('security');
        global $set_CookieUsername;
        global $set_CookiePassword;
        global $Username;
        global $Password;

        if($auth_mode=='NO_COOKIES'){
            $this->form_validation->set_rules('Username', 'Username', 'trim|required|min_length[5]|max_length[50]|strtolower|xss_clean');
            $this->form_validation->set_rules('Password', 'Password', 'trim|required|min_length[5]|max_length[50]|md5|do_hash');
            $this->form_validation->run();

            $set_CookieUsername = $this->input->post('Username');
            $set_CookiePassword = $this->input->post('Password');

            $this->load->helper('security');
            $this->load->helper('cookie');
            $Username = $this->input->post('Username'); // already forced to lower case
            $Password = $this->input->post('Password'); // this password is already encrypted and
        }else{// Use Cookies for re-authentication
            $Username=$this->encrypt->decode($this->input->cookie('Username', TRUE));
            $Password=$this->encrypt->decode($this->input->cookie('Password', TRUE));
        }
        $this->db->select('*');
        $this->db->from('sys_user_accounts');
        $this->db->join('sys_ui_languages', 'sys_ui_languages.UI_LanguageID = sys_user_accounts.UI_LanguageID', 'LEFTJOIN');
        $this->db->where('Username', $Username);
        $this->db->where('Password', $Password);
        $this->db->where('IsActive', 1);
        $query = $this->db->get();
        //echo ($query->num_rows());
        if ($query->num_rows() >= 1) { // If this user is found then true
            $row = $query->row();
            $this->session->set_userdata('UserID', '200-' . $row->UserID); // Initial by Kifayat
            //$this->session->set_userdata('UserID',  $row->UserID);
            $this->session->set_userdata('Email', $row->Email);
            $this->session->set_userdata('FullName', $row->FirstName . " " . $row->LastName);
            $this->session->set_userdata('FileNo', $row->FileNo);
            $this->session->set_userdata('UserLanguageDirection', $row->UI_Direction);
            $this->session->set_userdata('UserLang', $row->UI_LanguageID);
            $this->session->set_userdata('logged_in', TRUE);

            //---  Set cookie when user check remember_me checkbox  ---//
            if (isset($_POST['remember_me'])) {

                //---  Now setting cookie  ---//
                $cookie_info = array(
                    'name' => 'userid',
                    'value' => '200-' . $row->UserID,
                    'expire' => 720000
                );
                $this->input->set_cookie($cookie_info);
                //---  End of cookie  ---//

                //---  Now setting cookie  ---//
                $cookie_info = array(
                    'name' => 'Username',
                    'value' => $this->encrypt->encode($set_CookieUsername),
                    'expire' => 720000
                );
                $this->input->set_cookie($cookie_info);
                //---  End of cookie  ---//

                //---  Now setting cookie  ---//
                $cookie_info = array(
                    'name' => 'Password',
                    'value' => $this->encrypt->encode($set_CookiePassword),
                    'expire' => 720000
                );
                $this->input->set_cookie($cookie_info);
                //---  End of cookie  ---//

            }
            //---  end of remember_me ---//*/


            $cookie_info = $this->input->cookie('remember_me');
            if ($cookie_info || $cookie_info > 0) {
                $this->session->set_userdata('UserID', $cookie_info);
            }

            return true; // User Login Information found Correct
        } else
            return false;// No User Login information found

    }

    // end of authenticate function

    // The following function will check if the user has  logged in properly or not.
    // The the user is not logged then then this function will force him out of the system and ask for re login
    public function is_logged_in()
    {
        $user_id = $this->session->userdata('UserID');
        if (strlen($user_id) <= 0) {
            // No Login Information Found in the session Object
            // So now we will check if we have in cookies
            if (get_cookie('Username')==true&& get_cookie('Password')==true) {
                $this->authenticate("USE_COOKIES");
            }else // nothing found in cookies
/*                if ($this->input->is_ajax_request())
                    redirect('/user_management/ajax_redirect_failed_login');
                else
                    redirect('/user_management/login_form?STATUS=SESSION_EXPIRED');*/
                redirect('/user_management/userLogin/loginFailed');
        }
        return true;
    }
}