<?php
if (!defined('BASEPATH')) exit('No direct script access allowed');
/**
 * Author: Keith.
 * Email: coder.notepad@gmail.com
 * Date: 3/8/14
 * Time: 12:36 AM
 */

class Content extends Admin_Controller {


    function __construct() {
        parent::__construct();
        $this->load->model('product_model');
        Template::set_block('sub_nav','content/_sub_nav');
        $this->lang->load('product');
    }
    public function index() {
        Template::render();
    }
}