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
    public function details($paymentRecordID){
        $this->data['title'] = "Payment Details";

        //Getting Details For Payment Record

        $table = 'hrs_payment_record PR';
        $selectData = array('PR.RecordID, PR.PaymentMonthYear, PR.DueDate, PR.Rent, PR.Water, PR.Gas, PR.Services, PR.TotalDues, P.PaymentReceived, P.DatePaymentReceived',false);
        $joins = array(
          array(
              'table' => 'hrs_payments P',
              'condition'=> 'P.RecordID = PR.RecordID',
              'jointype' => 'LEFT'
          )
        );
        $where = array(
            'PR.RecordID' => $paymentRecordID
        );
        $resultDetails = $this->common_model->select_fields_joined($selectData,$table,$joins,$where);


        //Fixing Data for View
        $paymentDetails = new stdClass();
        $paymentDetails->PaymentID = $resultDetails[0]->RecordID;
        $paymentDetails->Dues = array();
        $paymentDetails->Payments = array();
        $totalReceivedPayments = 0;
        foreach($resultDetails as $key=>$row){
            if(!empty($row->Rent) && !array_key_exists('Rent',$paymentDetails->Dues)){
                $paymentDetails->Dues['Rent'] = $row->Rent;
            }
            if(!empty($row->Water) && !array_key_exists('Utility-Water',$paymentDetails->Dues)){
                $paymentDetails->Dues['Utility-Water'] = $row->Water;
            }
            if(!empty($row->Gas) && !array_key_exists('Utility-Gas',$paymentDetails->Dues)){
                $paymentDetails->Dues['Utility-Gas'] = $row->Gas;
            }
            if(!empty($row->Services) && !array_key_exists('Utility-Services',$paymentDetails->Dues)){
                $paymentDetails->Dues['Utility-Services'] = $row->Services;
            }

            //Record All Received Payments

            if(!empty($row->PaymentReceived)){
                $receivedPaymentDetails = array(
                    'Amount' => $row->PaymentReceived,
                    'DateReceived' => date('d-M-Y',strtotime($row->DatePaymentReceived))
                );
                array_push($paymentDetails->Payments,$receivedPaymentDetails);
                if(is_numeric($row->PaymentReceived)){
                    $totalReceivedPayments += $row->PaymentReceived;
                }
            }

        }
        $paymentDetails->TotalPaymentsDue = (int) $resultDetails[0]->TotalDues;
        $paymentDetails->TotalPaymentsReceived = $totalReceivedPayments;
        $paymentDetails->TotalOutstanding = (int)$resultDetails[0]->TotalDues - (int)$totalReceivedPayments;
        $this->data['paymentDetails'] = $paymentDetails;

        var_dump($paymentDetails);

        $this->parser->parse('admin/hrs/payments/PaymentDetails',$this->data);
    }
}
