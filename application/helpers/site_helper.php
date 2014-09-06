<?php
/**
 * Created by PhpStorm.
 * User: HaiderHassan
 * Date: 8/26/14
 * Time: 9:39 PM
 */
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


?>
