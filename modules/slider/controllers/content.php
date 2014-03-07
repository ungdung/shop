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
        $this->load->model('slider_model');
        Template::set_block('sub_nav','content/_sub_nav');
        $this->lang->load('slider');
    }

    public function loadTable() {
        $this->auth->restrict('Permission.Slider.Manage');
        $result = $this->slider_model->loadTable($this->kTable);
        exit(json_encode($result));
    }

    public function index() {
        $this->auth->restrict('Permission.Slider.Manage');
        $action = $this->input->post('action');
        if (!empty($action))
        {
            $checked = $this->input->post('checked');

            if (!empty($checked))
            {
                foreach($checked as $ids)
                {
                    switch(strtolower($action))
                    {
                        case 'active':
                            $this->slider_model->_activate($ids);
                            break;
                        case 'deactive':
                            $this->slider_model->_deactivate($ids);
                            break;
                        case 'delete':
                            $this->slider_model->_delete($ids);
                            break;
                    }
                }
                die();
            }
        }
        Template::set('toolbar_title',lang('Slider Manage'));
        Template::render();
    } //end function index

    public function create() {
        $this->auth->restrict('Permission.Slider.Manage');
        if($this->input->post()) {
            if($id = $this->save()) {
                Template::set_message(lang('Create Success'),'success');
                Template::redirect(MODULE_URL.'/edit/'.$id);
            } // save data.
        }
        Assets::add_js($this->load->view('content/form_js',null,true),'inline');
        Template::set('toolbar_title',lang('Create Slider'));
        Template::set_view('content/form');
        Template::render();
    }

    public function edit($id = false) {
        if(!$id) {
            $id = $this->auth->user_id();
        }
        $this->auth->restrict('Permission.Slider.Manage');
        if(!$slider = $this->slider_model->find($id)) {
            Template::set_message(lang('User Not Found'),'warning');
            Template::redirect(MODULE_URL);
        } // check exist
        if($this->input->post()) {
            if($this->save($id)) {
                Template::set_message(lang('Update Success'),'success');
                $user = $this->slider_model->find($id);
            } // save data.
        }
        Assets::add_js($this->load->view('content/form_js',null,true),'inline');
        Template::set('toolbar_title',lang('Update Slider'));
        Template::set('slider',$slider);
        Template::set_view('content/form');
        Template::render();
    }

    private function save($id =false) {
        $this->form_validation->set_rules('image','lang:Image','required|trim|strip_tags|xss_clean');
        $this->form_validation->set_rules('title','lang:Title','required|trim|strip_tags|xss_clean');
        $this->form_validation->set_rules('intro','lang:Intro','trim|strip_tags|xss_clean');
        if($this->form_validation->run()) {
            return $this->slider_model->save($id,$this->input->post());
        }
    }
} 