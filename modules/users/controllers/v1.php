<?php
if (!defined('BASEPATH')) exit('No direct script access allowed');
/**
 * Author: Keith.
 * Email: coder.notepad@gmail.com
 * Date: 3/6/14
 * Time: 8:29 PM
 */

class V1 extends REST_Controller {


    function __construct() {
        parent::__construct();
        $this->load->model('k_customer_model');
        $this->load->model('k_users_model');
    }

    public function sign_up_post() {
        $username = $this->post('username');
        $email = $this->post('email');
        $password = $this->post('password');
        $first_name = $this->post('first_name');
        $last_name = $this->post('last_name');
        $isCustomer = $this->k_customer_model->find_by(array('username'=>$username));
        $isEmailAdmin = $this->k_users_model->find_by(array('email'=>$email));
        if(!$isCustomer AND !$isEmailAdmin) {
            if($this->createUser($username,$email,$password,$first_name,$last_name)) {
                $this->response(array('status'=>true,'customer_id'=>$username));
            }
            else {
                $this->response(array('status'=>false,'message'=>lang('Have error')));
            }
        }
        else {
            $this->response(array('status'=>false,'message'=>lang('Username or email exits')));
        }
    }

    private function createUser($username,$email,$password,$first_name,$last_name) {
        $expiryDate = date('Y-m-d H:i:s');
        $customer = array(
            'username'      =>  $username,
            'expiry_date'   =>  date("Y-m-d"),
            'created_on'    =>  date("Y-m-d H:i:s"),
        );
        $customer_id = $this->k_customer_model->insert($customer);
        $administrator = array(
            'email'     =>  $email,
            'role_id'   =>  1,
            'customer_id'=> $customer_id,
            'first_name' => $first_name,
            'last_name'  => $last_name,
            'created_by' => 1,
            'modify_by'  => 1,
        );
        $result = false;
        $this->load->library('auth');
        $password = $this->auth->hash_password($password);
        if(isset($password['hash'])) $administrator['password_hash']=$password['hash'];
        if($user = $this->k_users_model->insert($administrator)) {
            $result = $this->k_customer_model->update($customer_id,array('created_by'=>$user));
        }
        if($result) {
            return $customer_id;
        } else {
            return false;
        }
    }
}