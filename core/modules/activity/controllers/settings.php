<?php
if (!defined('BASEPATH')) exit('No direct script access allowed');
/**
 * Author: Keith.
 * Email: coder.notepad@gmail.com
 * Date: 3/2/14
 * Time: 2:59 PM
 */

class Settings extends Admin_Controller {

    function __construct() {
        parent::__construct();
        $this->load->model('activity_model');
    }

    function getNotification($offset=0) {
        $activities = $this->activity_model->getNotification($offset);
        $total_unread = $this->activity_model->count_by(array('read'=>0));
        $result = $this->load->view('settings/notification',array('activities'=>$activities),TRUE);
        exit(json_encode(array('total_unread'=>$total_unread,'result'=>$result)));
    }
} 