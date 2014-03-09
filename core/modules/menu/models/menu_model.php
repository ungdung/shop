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
    protected $key = 'menu_id';
    protected $customer_id = true;
    protected $log_activity = false;


    function __construct() {
        parent::__construct();
    }

    function save($id,$data) {
        if($id==0)
            return parent::insert($data);
        else
            return parent::update($id,$data);
    }

    public function _delete($ids= array()) {
        $menu = $this->getChildrenItems($ids);
        return parent::_delete($menu);
    }

    private function getChildrenItems($id) {
        $items[] = $id;
        $menu = parent::find_all_by(array('parent_id'=>$id));
        if(!empty($menu)) {
            foreach($menu as $var) {
                $items = array_merge($items,$this->getChildrenItems($var->menu_id));
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
                $str .='<li class="dd-item" data-id="'.$var->menu_id.'">
                        <div class="dd-handle">'.anchor(MODULE_URL.'/index/'.$var->menu_id,$var->name).'</div>';
                if(is_array($var->subCatalog)){
                    $str .= $this->buildListCatalogHTML($var->subCatalog,$var->parent_id);
                }
                $str .='</li>';
            }
            $str .='</ol>';
        }
        return $str;
    }

    public function buildOptionsCatalogHTML($catalog=false,$pre = null,$parent_id=0) {
        $str = '';
        if(!is_array($catalog) AND $parent_id==0) {
            $catalog = $this->listOrder($catalog);
        }
        if($catalog===false AND $parent_id==0) {
            $catalog = $this->listOrder();
        }
        if(!empty($catalog)) {
            foreach($catalog as $var) {
                if($parent_id != $var->parent_id) {
                    $pre .= '-- ';
                    $parent_id = $var->parent_id;
                }
                $str .= '<option value="'.$var->menu_id.'">'.$pre.$var->name.'</option>';
                if(is_array($var->subCatalog)){
                    $str .= $this->buildOptionsCatalogHTML($var->subCatalog,$pre,$parent_id);
                }
            }
        }
        return $str;
    }

    public function listOrder($id=0,$parent_id=0) {
        $parent = parent::order_by('order','asc')->find_all_by(array('parent_id' => $parent_id,'menu_id !='=>$id));
        $category = array();
        if(!empty($parent)) {
            foreach($parent as $key=>$var) {
                $category[$key] = $var;
                $category[$key]->subCatalog = $this->listOrder($id,$var->menu_id);
            }
        }
        return $category;
    }


}




