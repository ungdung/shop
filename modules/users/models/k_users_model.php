<?php
if (!defined('BASEPATH')) exit('No direct script access allowed');
/**
 * Author: Keith.
 * Email: coder.notepad@gmail.com
 * Date: 3/6/14
 * Time: 9:02 PM
 */

class K_users_model extends K_Model {

    protected $table_name = 'users';
    protected $key = 'id';
    protected $set_created = true;
    protected $set_modify = true;

    public function __construct() {
        parent::__construct();
    }


}