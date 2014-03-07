<?php if (!defined('BASEPATH')) exit('No direct script access allowed');
/**
 * Author: Keith.
 * Email: coder.notepad@gmail.com
 * Date: 12/20/13
 * Time: 2:36 PM
 */

class Settings extends Admin_Controller
{

	public function __construct()
	{
		parent::__construct();
        $this->auth->restrict('Site.Settings.Manage');
        $this->lang->load('system');
		Template::set('toolbar_title', lang('Web Config'));
        Template::set_block('secNav','settings/_secNav');

	}//end __construct()

	public function index()
	{
        if($this->input->post('webConfig')) {
            if($this->save_settings()) {
                Template::set_message(lang('Update Success'),'success');
            }
        }
        if($this->input->post('btnMaintenance')) {
            if($this->save_maintenance()) {
                Template::set_message(lang('Update Success'),'success');
            }
        }
        $settings = $this->settings_lib->find_all();
        Template::set('languages',$this->db->get('language')->result());
		Template::set('settings', $settings);
		Template::render();

	}//end index()

	private function save_settings()
	{
        $this->form_validation->set_rules('title', lang("Site Title"), 'required|trim|strip_tags|xss_clean');
        $this->form_validation->set_rules('keyword', lang("Meta Keyword"), 'required|trim|strip_tags|xss_clean');
        $this->form_validation->set_rules('description', lang("Meta Description"), 'required|trim|strip_tags|xss_clean');
		if ($this->form_validation->run()) {
            $data = array(
                array('name' => 'meta.title', 'value' => $this->input->post('title')),
                array('name' => 'meta.keyword', 'value' => $this->input->post('keyword')),
                array('name' => 'meta.description', 'value' => $this->input->post('description'))
            );
            // save the settings to the DB
            $updated = $this->settings_model->update_batch($data, 'name');
            return $updated;
		}
	}//end save_settings()

    private function save_maintenance() {
        $this->form_validation->set_rules('opMaintenance', lang("Mode"), 'required|trim|strip_tags|xss_clean');
        $this->form_validation->set_rules('maintenance_content', lang("Content"), 'required');
        if ($this->form_validation->run()) {
            $data = array(
                array('name' => 'maintenance.mode', 'value' => $this->input->post('opMaintenance')),
                array('name' => 'maintenance.content', 'value' => $this->input->post('maintenance_content')),
            );
            // save the settings to the DB
            $updated = $this->settings_model->update_batch($data, 'name');
            return $updated;
        }
    }
}//end Settings()
