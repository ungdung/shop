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
        $this->load->model('news_model');
        $this->load->model('news_category_model');
        Template::set_block('sub_nav','content/_sub_nav');
        $this->lang->load('news');
    }

    public function loadTable() {
        $this->auth->restrict('Permission.News.Manage');
        $result = $this->news_model->loadTable($this->kTable);
        exit(json_encode($result));
    }

    public function index() {
        $this->auth->restrict('Permission.News.Manage');
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
                            $this->news_model->_activate($ids);
                            break;
                        case 'deactive':
                            $this->news_model->_deactivate($ids);
                            break;
                        case 'delete':
                            $this->news_model->_delete($ids);
                            break;
                    }
                }
                die();
            }
        }
        Template::set('toolbar_title',lang('News Manage'));
        Template::render();
    } //end function index

    public function create() {
        $this->auth->restrict('Permission.News.Manage');
        if($this->input->post()) {
            if($id = $this->save()) {
                Template::set_message(lang('Create Success'),'success');
                Template::redirect(MODULE_URL.'/edit/'.$id);
            } // save data.
        }
        Assets::add_js($this->load->view('content/form_js',null,true),'inline');
        Template::set('toolbar_title',lang('Create News'));
        Template::set_view('content/form');
        Template::render();
    }

    public function edit($id = false) {
        $this->auth->restrict('Permission.News.Manage');
        if(!$news = $this->news_model->find($id)) {
            Template::set_message(lang('News Not Found'),'warning');
            Template::redirect(MODULE_URL);
        } // check exist
        if($this->input->post()) {
            if($this->save($id)) {
                Template::set_message(lang('Update Success'),'success');
                $user = $this->news_model->find($id);
            } // save data.
        }
        Assets::add_js($this->load->view('content/form_js',null,true),'inline');
        Template::set('toolbar_title',lang('Update News'));
        Template::set('news',$news);
        Template::set_view('content/form');
        Template::render();
    }

    private function save($id =false) {
        $this->form_validation->set_rules('news_title','lang:Title','required|trim|strip_tags|xss_clean');
        $this->form_validation->set_rules('news_category_id','lang:Category','required|trim|strip_tags|xss_clean');
        $this->form_validation->set_rules('news_image','lang:Image','required|trim|strip_tags|xss_clean');
        $this->form_validation->set_rules('news_intro','lang:Intro','required|trim|strip_tags|xss_clean');
        $this->form_validation->set_rules('news_description','lang:Description','trim');
        $this->form_validation->set_rules('news_tags','lang:Tags','required|trim|strip_tags|xss_clean');
        $this->form_validation->set_rules('active','lang:Active','required|trim|strip_tags|xss_clean');
        $this->form_validation->set_rules('news_meta_title','lang:Meta Title','required|trim|strip_tags|xss_clean');
        $this->form_validation->set_rules('news_meta_keyword','lang:Meta Keyword','required|trim|strip_tags|xss_clean');
        $this->form_validation->set_rules('news_meta_description','lang:Meta Description','required|trim|strip_tags|xss_clean');
        if($this->form_validation->run()) {
            return $this->news_model->save($id,$this->input->post());
        }
    }



    /** CATEGORY **/

    public function loadCategoryTable() {
        $this->auth->restrict('Permission.News.Manage');
        $result = $this->news_category_model->loadTable($this->kTable);
        exit(json_encode($result));
    }

    public function category($id=false,$type=null) {
        $this->auth->restrict('Permission.News.Manage');
        $category = $this->news_category_model->find($id);
        if($category) {
            Template::set('category',$category);
        }
        if($type=='delete') {
            $result = $this->news_category_model->delete($id);
            if($result) {
                Template::set_message(lang('Delete Success'),'success');
                Template::redirect(MODULE_URL.'/category');
            }
            else {
                Template::set_message(lang('Delete Error'),'error');
                Template::redirect(MODULE_URL.'/category');
            }
        }
        if($this->input->post()) {
            if($_POST['submit']==lang('Create New') AND $id) {
                $id = false;
            }
            if($newid = $this->save_category($id)) {
                if($id) {
                    Template::set_message(lang('Update Success','success'));
                }
                else {
                    Template::set_message(lang('Create Success','success'));
                    Template::redirect(MODULE_URL.'/category/'.$newid);
                }
            }
        }
        Assets::add_js('plugins/ui/jquery.drag.drop.menu.js');
        Assets::add_css('drag.drop.menu.css');
        Assets::add_js($this->load->view('content/category_js',null,true),'inline');
        Template::render();
    } //end function index

    public function sorting() {
        $this->auth->restrict('Permission.News.Manage');
        $data = $this->input->post('category');
        $this->doSorting($data);
    }
    private function doSorting($data,$parent_id=0) {
        if(!empty($data)) {
            $i=0;
            foreach($data as $item) {
                ++$i;
                $this->news_category_model->update($item['id'],array('order'=>$i,'parent_id'=>$parent_id));
                if(isset($item['children'])) {
                    $this->doSorting($item['children'],$item['id']);
                }
            }
        }
    }

    private function save_category($id=false) {
        $this->form_validation->set_rules('category_name','lang:Name','required|trim|strip_tags|xss_clean');
        $this->form_validation->set_rules('category_image','lang:Image','required|trim|strip_tags|xss_clean');
        $this->form_validation->set_rules('category_description','lang:Description','trim|strip_tags|xss_clean');
        $this->form_validation->set_rules('parent_id','lang:Parent','required|trim|strip_tags|xss_clean');
        $this->form_validation->set_rules('active','lang:Active','required|trim|strip_tags|xss_clean');
        $this->form_validation->set_rules('category_meta_title','lang:Meta Title','required|trim|strip_tags|xss_clean');
        $this->form_validation->set_rules('category_meta_keyword','lang:Meta Keyword','required|trim|strip_tags|xss_clean');
        $this->form_validation->set_rules('category_meta_description','lang:Meta Description','required|trim|strip_tags|xss_clean');
        if($this->form_validation->run()) {
            return $this->news_category_model->save($id,$this->input->post());
        }
    }
} 