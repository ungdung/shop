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
        $language = $this->post('language');
        $theme  =   $this->post('theme');
        $webTitle = $this->post('web_title');
        $isCustomer = $this->k_customer_model->find_by(array('username'=>$username));
        $isEmailAdmin = $this->k_users_model->find_by(array('email'=>$email));
        $isLanguage = $this->db->where('language_id',$language)->get('language')->row();
        $isTheme = $this->db->where('theme_id',$theme)->get('theme')->row();
        if(!$isTheme || !$isLanguage) {
            $this->response(array('status'=>false,'message'=>lang('Theme or language not found')));
        }
        if(!$isCustomer AND !$isEmailAdmin) {
            if($customerID  = $this->createUser($username,$email,$password,$first_name,$last_name)) {
                if($this->createSettings($customerID,$webTitle)) {
                    $this->response(array('status'=>true,'customer_id'=>$username));
                }
                else {
                    $this->db->where('customer_id',$customerID)->delete('customer');
                    $this->db->where('customer_id',$customerID)->delete('users');
                }
            }
            else {
                $this->response(array('status'=>false,'message'=>lang('Have error')));
            }
        }
        else {
            $this->response(array('status'=>false,'message'=>lang('Username or email exists')));
        }
    }

    private function createUser($username,$email,$password,$first_name,$last_name,$lang_id=1,$theme_id=1) {

        $customer = array(
            'username'      =>  $username,
            'expiry_date'   =>  date("Y-m-d"),
            'created_on'    =>  date("Y-m-d H:i:s"),
            'language_id'   =>  $lang_id,
            'theme_id'      =>  $theme_id
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

    private function createSettings($customer_id,$web_title) {
        $data = array(
            'customer_id'   =>  $customer_id,
        );
        $data['name']  =    'meta.title';
        $data['value'] =    $web_title;
        $r1 = $this->db->insert('settings',$data);
        $data['name']  =    'meta.keyword';
        $data['value'] =    $web_title;
        $r2 = $this->db->insert('settings',$data);
        $data['name']  =    'meta.description';
        $data['value'] =    $web_title;
        $r4 = $this->db->insert('settings',$data);
        $data['name']  =    'maintenance.mode';
        $data['value'] =    0;
        $r5 = $this->db->insert('settings',$data);
        $data['name']  =    'maintenance.content';
        $data['value'] =    'Maintenance';
        $r6 = $this->db->insert('settings',$data);
        if($r1 AND $r2 AND $r3 AND $r4 AND $r5 AND $r6) {
            return true;
        }
    }
}