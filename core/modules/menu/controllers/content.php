<?php if (!defined('BASEPATH')) exit('No direct script access allowed');
/**
 * Author: Keith.
 * Email: coder.notepad@gmail.com
 * Date: 12/20/13
 * Time: 2:36 PM
 */


class Content extends Admin_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->lang->load('menu');
        Template::set('toolbar_title', lang("Menu Manage"));
        $this->auth->restrict('Site.Menu.Manage');
        $this->load->model('menu_model');
    }

    public function index($id=false) {
        $menu = $this->menu_model->find($id);
        if($menu) {
            Template::set('menu',$menu);
        }
        if($this->input->post()) {
            if($_POST['submit']==lang('Create New') AND $id) {
                $id = false;
            }
            if($newid = $this->save($id)) {
                if($id) {
                    Template::set_message(lang('Update Success','success'));
                }
                else {
                    Template::set_message(lang('Create Success','success'));
                    Template::redirect(MODULE_URL.'/index/'.$newid);
                }
            }
        }
        Assets::add_js('plugins/ui/jquery.drag.drop.menu.js');
        Assets::add_css('drag.drop.menu.css');
        Assets::add_js($this->load->view('content/index_js',null,true),'inline');
        Template::render();
    }

    public function sorting() {
        $data = $this->input->post('menu');
        $this->doSorting($data);
    }
    private function doSorting($data,$parent_id=0) {
        if(!empty($data)) {
            $i=0;
            foreach($data as $item) {
                ++$i;
                $this->menu_model->update($item['id'],array('order'=>$i,'parent_id'=>$parent_id));
                if(isset($item['children'])) {
                    $this->doSorting($item['children'],$item['id']);
                }
            }
        }
    }

    private function save($id=false) {
        $this->form_validation->set_rules('name','lang:Name','required|trim|strip_tags|xss_clean');
        $this->form_validation->set_rules('url','lang:URL','required|trim|strip_tags|xss_clean');
        $this->form_validation->set_rules('image','lang:Image','trim|strip_tags|xss_clean');
        $this->form_validation->set_rules('target','lang:Target','required|trim|strip_tags|xss_clean');
        $this->form_validation->set_rules('parent','lang:Parent','trim|strip_tags|xss_clean');
        if($this->form_validation->run()) {
            return $this->menu_model->save($id,$this->input->post());
        }
    }
}