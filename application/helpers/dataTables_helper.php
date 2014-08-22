<?php
/**
 * Created by PhpStorm.
 * User: HaiderHassan
 * Date: 8/22/14
 * Time: 6:42 AM
 */
function get_editUpdateButtons($id)
{
    $CI =& get_instance();
    $html = '<span class="actions">';
    $html .= '<a href="' . base_url() . 'subscriber/edit/' . $id . '"><img src="' . base_url() . 'assets/images/edit.png"/></a>';
    $html .= '<a href="' . base_url() . 'subscriber/delete/' . $id . '"><img src="' . base_url() . 'assets/images/delete.png"/></a>';
    $html .= '</span>';

    return $html;
}

/*<a href='#editBtnModal' class='editBtnFunc' ><i style='color: #666666' class='fa fa-pencil fa-fw fa-2x'></i></a>*/