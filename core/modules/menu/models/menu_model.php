<?php if (!defined('BASEPATH')) exit('No direct script access allowed');
/**
 * Author: Keith.
 * Email: coder.notepad@gmail.com
 * Date: 12/20/13
 * Time: 2:36 PM
 */


class Menu_model extends BF_Model
{

    protected $table_name = 'menu';
    protected $key = 'id';



    function __construct() {
        parent::__construct();
    }

    function update($id,$data) {
        if($id==0)
            return parent::insert($data);
        else
            return parent::update($id,$data);
    }

    public function _delete($ids= array()) {
    $menus = array();
        if(!empty($ids)) {
            foreach($ids as $var) {
                $menus = array_merge($this->getChildrenItems($var),$menus);
            }
            parent::_delete($menus);
        }
    }

    private function getChildrenItems($item) {
        $menu = parent::find_all_by(array('parent'=>$item));
        $items= array($item);
        if(!empty($menu)) {
            foreach($menu as $var) {
                $items[] = $var->id;
            }
        }
        return $items;
    }


    public function buildListCatalogHTML($catalog=false,$parent_id=0) {
        $str='';
        if(!is_array($catalog) AND $parent_id==0) {
            $catalog = $this->listOrder($catalog);
        }
        if($catalog===false AND $parent_id==0) {
            $catalog = $this->listOrder();
        }
        if(!empty($catalog)) {
            $str .= '<ol class="dd-list">';
            foreach($catalog as $var) {
                $str .='<li class="dd-item" data-id="'.$var->id.'">
                        <div class="dd-handle">'.$var->name.'</div>';
                if(is_array($var->subCatalog)){
                    $str .= $this->buildListCatalogHTML($var->subCatalog,$var->parent);
                }
                $str .='</li>';
            }
            $str .='</ol>';
        }
        return $str;
    }

    public function listOrder($id=0,$parent_id=0) {
        $parent = parent::order_by('order','asc')->find_all_by(array('parent' => $parent_id,'id !='=>$id));
        $category = array();
        if(!empty($parent)) {
            foreach($parent as $key=>$var) {
                $category[$key] = $var;
                $category[$key]->subCatalog = $this->listOrder($id,$var->id);
            }
        }
        return $category;
    }

}




