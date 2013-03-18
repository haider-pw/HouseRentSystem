<?php
    defined('BASEPATH') OR exit('No direct script access allowed');

class Migration_Create_Users extends CI_Migration {

    public function up()
    {
        $this->dbforge->add_field(array(
            'U_ID' => array(
                'type' => 'INT',
                'constraint' => 11,
                'unsigned' => TRUE,
                'auto_increment' => TRUE
            ),
            'R_ID' => array(
                'type' => 'INT',
                'constraint' => '11',
            ),
            'U_Name' => array(
                'type' => 'VARCHAR',
                'null' => TRUE,
            ),
            'U_FatherName' => array(
                'type' => 'VARCHAR',
                'constraint' => '20',
            ),
            'U_CNIC' => array(
                'type' => 'VARCHAR',
                'constraint' => '20',
            ),
            'U_Email' => array(
                'type' => 'VARCHAR',
                'constraint' => '100',
            ),
            'U_Password' => array(
                'type' => 'VARCHAR',
                'constraint' => '24',
            ),
            'U_Mobile' => array(
                'type' => 'VARCHAR',
                'constraint' => '13',
            ),
            'U_CurrentAddress' => array(
                'type' => 'VARCHAR',
                'constraint' => '250',
            ),
            'U_Gender' => array(
                'type' => 'VARCHAR',
                'constraint' => '8',
            ),
            'U_Desc' => array(
                'type' => 'TEXT',
            ),
            'U_CNICPicFrond' => array(
                'type' => 'VARCHAR',
                'constraint' => '280',
            ),
            'U_CNICPicBack' => array(
                'type' => 'VARCHAR',
                'constraint' => '280',
            ),
            'U_CurrentJob' => array(
                'type' => 'VARCHAR',
                'constraint' => '200',
            ),
            'U_Active' => array(
                'type' => 'BIT',
                'constraint' => '1',
            ),

        ));

        $this->dbforge->create_table('users');
    }

    public function down()
    {
        $this->dbforge->drop_table('users');
    }
}