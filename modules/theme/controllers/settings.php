<?php
if (!defined('BASEPATH')) exit('No direct script access allowed');
/**
 * Author: Keith.
 * Email: coder.notepad@gmail.com
 * Date: 3/9/14
 * Time: 10:23 AM
 */

class Settings extends Admin_Controller {

    protected $previous_page;
    function __construct() {
        parent::__construct();
        $this->lang->load('theme');
        $this->load->model('theme_model');
        Template::set('toolbar_title',lang('Theme'));
        if(strpos(site_url(MODULE_URL),$this->previous_page)!==false)
            $hasView = false;
        else {
            $hasView = true;
        }
        Template::set('hasView',$hasView);
        Template::set_block('sub_nav','settings/_sub_nav');

    }

    function index($offset=0) {
        $categorySelected = $tagsSelected = array();
        if($category = $this->input->get('category') AND is_array($category)) {
            $categorySelected = $this->input->get('category');
        }
        if($tags = $this->input->get('tags') AND is_array($tags)) {
            $tagsSelected = $this->input->get('tags');
        }
        $this->load->library('pagination');

        $this->pager['base_url'] = site_url(MODULE_URL.'/index');
        $this->pager['total_rows'] = $this->theme_model->count_all();
        $this->pager['per_page'] = $this->limit;
        $this->pagination->initialize($this->pager);


        Template::set('categories',$this->db->order_by('category_name')->get('web_category')->result());
        Template::set('tags',$this->db->order_by('tags')->group_by('tags')->get('theme_tags')->result());
        Template::set('themes',$this->theme_model->find_all_themes($categorySelected,$tagsSelected,$this->limit,$offset));
        Template::set('categorySelected',$categorySelected);
        Template::set('tagsSelected',$tagsSelected);
        Template::render();
    }

    function detail($id =false) {
        if(!$theme = $this->theme_model->find($id)) {
            Template::set_message('URL Not Found');
            Template::redirect(MODULE_URL);
        }
        Assets::add_js($this->load->view('settings/detail_js',null,true),'inline');
        Template::set('theme',$theme);
        Template::render();
    }

    function install() {
        if($theme_id = $this->input->post('theme')) {
            if(!$theme = $this->theme_model->find($theme_id)) {
                $result = array('status'=>false,'message'=>lang('Theme does not exists'));
            }
            $this->theme_model->update($theme_id,array('theme_installs'=>$theme->theme_installs+1));
            $this->load->model('users/customer_model');
            if($this->customer_model->update(CUSTOMER_ID,array('theme_id'=>$theme_id))) {
                $result  = array('status'=>true,'message'=>sprintf(lang('Install theme success'),$theme->theme_name));
            }
            else {
                $result = array('status'=>false,'message'=>lang('Have an error occurs'));
            }
            exit(json_encode($result));
        }
    }
}