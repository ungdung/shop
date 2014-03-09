<?php
if (!defined('BASEPATH')) exit('No direct script access allowed');
/**
 * Author: Keith.
 * Email: coder.notepad@gmail.com
 * Date: 3/9/14
 * Time: 10:28 AM
 */

class Theme_model extends BF_Model {

    protected $table_name = 'theme';
    protected $key = 'theme_id';
    protected $set_created= false;
    protected $set_modified = false;
    protected $log_user = false;

    function __construct() {
        parent::__construct();
    }

    function find_all_themes($category = array(),$tags = array(),$limit,$offset) {
        parent::select('theme.*')->join('theme_category','theme_category.theme_id=theme.theme_id','left')
                ->join('theme_tags','theme_tags.theme_id=theme.theme_id','left')
                ->group_by('theme.theme_id');
        if(!empty($category)) {
            parent::where_in('theme_category.category_id',$category);
        }
        if(!empty($tags)) {
            parent::where_in('theme_tags.tags',$tags);
        }
        $themes = parent::limit($limit,$offset)->order_by('theme_id','desc')->find_all();
        $data = array();
        if(!empty($themes)) {
            foreach($themes as $key => $theme) {
                $data[$key]             =   $theme;
                $data[$key]->categories =   $this->db->select('web_category.*')->join('theme_category','theme_category.category_id=web_category.category_id')->where('theme_id',$theme->theme_id)->get('web_category')->result();
                $data[$key]->tags       =   $this->db->where('theme_id',$theme->theme_id)->get('theme_tags')->result();
            }
        }
        return $data;
    }

    function find($id) {
        $theme = parent::find($id);
        $theme->categories =   $this->db->select('web_category.*')->join('theme_category','theme_category.category_id=web_category.category_id')->where('theme_id',$theme->theme_id)->get('web_category')->result();
        $theme->tags       =   $this->db->where('theme_id',$theme->theme_id)->get('theme_tags')->result();
        return $theme;
    }
}