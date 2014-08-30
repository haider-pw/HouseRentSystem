<?php if (!defined('BASEPATH')) exit('No direct script access allowed');
/**
 * Created by PhpStorm.
 * User: HaiderHassan
 * Date: 2/4/14
 * Time: 4:09 PM
 */
class Residentials extends Admin_Controller{
    function __construct(){
        parent::__construct();
    }

    function Houses(){
        $this->data['title']="Houses";
        $this->parser->parse('admin/hrsResidentialsHouses.tpl',$this->data);
    }
    function Flats(){
        $this->data['title']="Flats";
        $this->parser->parse('admin/hrsResidentialsFlats.tpl',$this->data);
    }

    function listResidentials_DT()
    {

        /*        $this->datatables->select('ResID,hrs_residentials.ResTypeID,ResRooms,ResKitchens,ResBathrooms,ResDescription,TypeName')
                    //->unset_column('FormID')
                    ->from('hrs_residentials')
                    ->join('hrs_residential_type', 'hrs_residentials.ResTypeID=hrs_residential_type.ResTypeID', $type = "INNER")
                    ->add_column("Actions", "<a href='#editBtnModal' data-toggle='modal' class='editBtnFunc'><i style='color: #666666' class='fa fa-pencil fa-fw fa-2x'></i></a><a href='#' id='deleteBtn' class='deleteBtnFunc'><i style='color: #ff0000' class='fa fa-times fa-fw fa-2x'></i></a>", "FormID");
                echo $this->datatables->generate();*/
        $data = ('ResID,hrs_residentials.ResTypeID,ResNo,TypeName,ResRooms,ResKitchens,ResBathrooms,ResDescription');
        $pTable = "hrs_residentials";
        $joins = array(
            array(
                'table' => 'hrs_residential_type',
                'condition' => 'hrs_residential_type.ResTypeID=hrs_residentials.ResTypeID',
                'type' => 'INNER'
            )
        );
        $id = "ResID";
        $addColumn = "<a href='#editBtnModal' data-toggle='modal' class='editBtnFunc'><i style='color: #666666' class='fa fa-pencil fa-fw fa-2x'></i></a><a href='#' id='deleteBtn' class='deleteBtnFunc'><i style='color: #ff0000' class='fa fa-times fa-fw fa-2x'></i></a>";
        $result = $this->Common_Model->select_fields_joined_DT($data, $pTable,$joins, $where = '', $addColumn, $unsetColumn='');
        echo $result;
    }
}