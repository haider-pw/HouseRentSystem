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
        $selectData = array('PR.RecordID, PR.TenantID, R.ResID AS ResidentialID,RT.TypeName AS ResType, R.ResNo, U.FullName AS TenantName,  PR.PaymentMonthYear, PR.DueDate, PR.Rent, PR.Water, PR.Gas, PR.Services, PR.TotalDues,PR.PeriodStart, PR.PeriodEnd, P.PaymentReceived, P.DatePaymentReceived',false);
        $joins = array(
          array(
              'table' => 'hrs_payments P',
              'condition'=> 'P.RecordID = PR.RecordID',
              'jointype' => 'LEFT'
          ),
            array(
                'table' => 'hrs_residentials R',
                'condition'=>'R.TenantID = PR.TenantID AND R.IsTrashed = 0',
                'jointype' => 'INNER'
            ),
            array(
                'table' => 'hrs_residential_type RT',
                'condition' => 'RT.ResTypeID = R.ResTypeID',
                'jointype' => 'LEFT'
            ),
            array(
                'table' => 'hrs_tenants T',
                'condition' => 'T.TenantID = PR.TenantID',
                'jointype' => 'INNER'
            ),
            array(
                'table' => 'users_users U',
                'condition' => 'T.UserID = U.UserID',
                'jointype' => 'INNER'
            )
        );
        $where = array(
            'PR.RecordID' => $paymentRecordID
        );
        $resultDetails = $this->common_model->select_fields_joined($selectData,$table,$joins,$where);


        //Fixing Data for View
        $paymentDetails = new stdClass();
        $paymentDetails->PaymentID = $resultDetails[0]->RecordID;
        $paymentDetails->ResID = $resultDetails[0]->ResidentialID;
        $paymentDetails->ResNo = $this->data['ResIdentification'].$resultDetails[0]->ResNo;
        $paymentDetails->ResType = $resultDetails[0]->ResType;
        $paymentDetails->TenantName = $resultDetails[0]->TenantName;
        $paymentDetails->PaymentMonthYear = date('M-Y',strtotime($resultDetails[0]->PaymentMonthYear));
        $paymentDetails->DueDate = date('d-M-Y',strtotime($resultDetails[0]->DueDate));
        $paymentDetails->Dues = array();
        $paymentDetails->Payments = array();
        $totalReceivedPayments = 0;
        foreach($resultDetails as $key=>$row){
            if(!empty($row->Rent) && !array_key_exists('Rent',$paymentDetails->Dues)){
                $paymentDetails->Dues['Rent'] = array(
                    'Amount' => $row->Rent,
                    'Description' => 'Rent payment for '.date('d-M-Y',strtotime($row->PeriodStart)).'-'.$row->PeriodEnd
                );
            }
            if(!empty($row->Water) && !array_key_exists('Utility-Water',$paymentDetails->Dues)){
                $paymentDetails->Dues['Utility-Water'] = array(
                    'Amount' => $row->Water,
                    'Description' => 'Rent payment for '.$row->PeriodStart.'-'.$row->PeriodEnd
                );

            }
            if(!empty($row->Gas) && !array_key_exists('Utility-Gas',$paymentDetails->Dues)){
                $paymentDetails->Dues['Utility-Gas'] = array(
                    'Amount' => $row->Gas,
                    'Description' => 'Gas payment for '.date('d-M-Y',strtotime($row->PeriodStart)).'-'.$row->PeriodEnd
                );
            }
            if(!empty($row->Services) && !array_key_exists('Utility-Services',$paymentDetails->Dues)){
                $paymentDetails->Dues['Services'] = array(
                    'Amount' => $row->Services,
                    'Description' => 'Rent payment for '.$row->PeriodStart.'-'.$row->PeriodEnd
                );
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
        $this->parser->parse('admin/hrs/payments/PaymentDetails',$this->data);
    }
}
