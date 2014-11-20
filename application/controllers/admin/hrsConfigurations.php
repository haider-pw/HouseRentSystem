<?php

/**
 * Created by PhpStorm.
 * User: Syed Haider Hassan
 * Date: 11/20/2014
 * Time: 9:45 AM
 */
class hrsConfigurations extends Admin_Controller
{
    function __construct()
    {
        parent::__construct();
    }

    function ManageUtilityTypes()
    {
        $UserID = $this->data['UserID'];
        if (is_admin($UserID) == TRUE || is_allowed($UserID) == TRUE) {
            $this->data['title'] = 'Manage Utility Types';
            $this->parser->parse('admin/hrs/configurations/utilityTypes', $this->data);
        } else {
            redirect($this->data['errorPage_403']);
        }
    }

    /*//////////////////////////////////////////////////////////////////////
    ////////////////////Functions for the Above Views/////////////////////
    ///////////////////////////////////////////////////////////////////////*/
}