<?php
if (!defined('BASEPATH')) exit('No direct script access allowed');
/**
 * Author: Keith.
 * Email: coder.notepad@gmail.com
 * Date: 3/6/14
 * Time: 9:02 PM
 */

class K_customer_model extends K_Model {

    protected $table_name = 'customer';
    protected $key = 'customer_id';
    protected $set_created = true;

    public function __construct() {
        parent::__construct();
    }


}