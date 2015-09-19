<?php
/**
 * Created by PhpStorm.
 * User: HaiderHassan
 * Date: 8/26/14
 * Time: 9:39 PM
 */


if(!function_exists('checkActiveClassAdminTabs')) {

    function checkActiveClassAdminTabs($tabName){
        $CI =& get_instance();
        $sessionTabName = $CI->session->userdata('activetb');
        if(strtolower($sessionTabName)===strtolower($tabName)){
            $activeClass = 'class="active"';
            return $activeClass;
        }
        //return strtolower($menuName);
    }
}//End of Function CheckUserLanguage

if(!function_exists('checkActiveClassMainMenu')) {

    function checkActiveClassMainMenu($menuName){
        $CI =& get_instance();
        $controller = $CI->uri->segment(2);
        if(strtolower($controller)===strtolower($menuName)){
            $activeClass = 'class="active"';
            return $activeClass;
        }
        //return strtolower($menuName);
    }
}//End of Function CheckUserLanguage
if(!function_exists('checkActiveClassSubMenu')) {
    function checkActiveClassSubMenu($menuName){
        $CI =& get_instance();
        $page = $CI->uri->segment(3);
        if(strtolower($page)===strtolower($menuName)){
            $activeClass = 'class="active"';
            return $activeClass;
        }
    }
}//End of Function CheckUserLanguage

//Returns the BASEPATH for the Template
if (!function_exists('getBasePath')) {
    function getBasePath()
    {
        return FCPATH;
    }
}


if (! function_exists('array_column')) {
    function array_column(array $input, $columnKey, $indexKey = null) {
        $array = array();
        foreach ($input as $value) {
            if ( ! isset($value[$columnKey])) {
                trigger_error("Key \"$columnKey\" does not exist in array");
                return false;
            }
            if (is_null($indexKey)) {
                $array[] = $value[$columnKey];
            }
            else {
                if ( ! isset($value[$indexKey])) {
                    trigger_error("Key \"$indexKey\" does not exist in array");
                    return false;
                }
                if ( ! is_scalar($value[$indexKey])) {
                    trigger_error("Key \"$indexKey\" does not contain scalar value");
                    return false;
                }
                $array[$value[$indexKey]] = $value[$columnKey];
            }
        }
        return $array;
    }
}


?>
