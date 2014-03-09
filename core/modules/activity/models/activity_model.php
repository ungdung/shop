<?php
if (!defined('BASEPATH')) exit('No direct script access allowed');
/**
 * Author: Keith.
 * Email: coder.notepad@gmail.com
 * Date: 3/1/14
 * Time: 7:43 PM
 */

class Activity_model extends BF_Model {

    protected $table_name = 'activity';
    protected $key = 'activity_id';
    protected $customer_id = true;
    protected $log_activity = false;

    protected $log_user =false;
    protected $set_created = false;

    protected $set_modified = false;
    protected $soft_deletes = false;

    public function __construct() {
        parent::__construct();
    }


    public function getNotification() {
        parent::select('activity.*, users.avatar, users.first_name, users.last_name')->join('users','users.id=activity.user_id')->limit(30)->order_by('activity_id','desc');
        return parent::find_all();
    }
} 