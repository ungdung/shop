<?php
/**
 * Author: Keith.
 * Email: coder.notepad@gmail.com
 * Date: 12/20/13
 * Time: 2:57 PM
 */

class Customer_model extends BF_Model {

    protected $table_name = 'customer';
    protected $date_format = 'datetime';


    public function __construct()
    {
        parent::__construct();
    }//end __construct()

    public function isUser() {
        if($customer = $this->getCustomer()) {
            return true;
        }
        return false;
    }

    public function getCustomer() {
        parent::select('customer.*');
        parent::join('domain','domain.customer_id=customer.customer_id','left');
        if(defined('CUSTOMER')) {
            parent::where('username',CUSTOMER);
        }
        else {
            parent::where(array('domain'=>$_SERVER['HTTP_HOST'],'domain.active'=>1));
        }
        return parent::find_by(array('expiry_date >'=>date("Y-m-d"),'customer.active'=>1));
    }

    public function getLanguageAvailable() {
        return $this->db->select('customer_language.is_default, language.language_id, language.code, language.name')->join('customer_language','customer_language.language_id=language.language_id')
                ->where(array('customer_id'=>CUSTOMER_ID,'language.active'=>1,'is_default'=>0))
                ->get('language')->result();
    }


} 