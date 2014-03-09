<?php
/**
 * Author: Keith.
 * Email: coder.notepad@gmail.com
 * Date: 12/20/13
 * Time: 2:57 PM
 */

class News_category_model extends BF_Model {

    protected $table_name = 'news_category';
    protected $key = 'category_id';
    protected $target_url = '/content/news/detail/';
    protected $customer_id =true;

    public function __construct()
    {
        parent::__construct();
    }//end __construct()

    public function loadTable($kTable) {
        //set column you want select.
        $kTable['columns'][] = $this->key;
        //get data fill to table
        parent::select($kTable['columns'])->join('product_category','product_category.category_id = product.category_id');
        //build where query
        $strWhere = null;
        if(!empty($kTable['where'])) {
            foreach($kTable['where'] as $where) {
                $key = array_shift(array_keys($where));
                $value = array_shift(array_values($where));
                $strWhere .= " {$key} LIKE '%{$value}%' OR";
            }
            $strWhere = "(".substr($strWhere,0,-2).")";
        }
        //list all data
        $data= parent::where($strWhere,null,false)->order_by($kTable['order_by'],$kTable['sort_by'])->limit($kTable['limit'],$kTable['offset'])->find_all();

        // total rows found.
        $totalDisplayRecords = parent::where($strWhere,null,false)->count_all();

        //total rows in database
        $totalRecords = parent::count_all();

        $result = array(
            "sEcho" => $kTable['sEcho'],
            "iTotalRecords" => $totalRecords,
            "iTotalDisplayRecords" => $totalDisplayRecords,
            "aaData" => array()
        );
        if(!empty($data)) {
            foreach($data as $k=> $var) {
                $var = array (
                    'name'=> anchor(MODULE_URL.'/edit/'.$var->product_id,$var->product_name),
                    'catego'=> $var->category_name,
                    'active' => showStatus($var->product_active),
                    "DT_RowId"  =>  $var->product_id,
                );
                $result['aaData'][$k] = $var;
            }
        }
        return $result;
    }


    public function save($id=false,$data=array()) {
        if(!$id) {
            $this->action = 'created a category';
            return parent::insert($data);
        }
        $this->action = 'updated a category';
        $result = parent::update($id,$data);
        if($result) {
            return $id;
        }
        return false;
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
                $str .='<li class="dd-item" data-id="'.$var->category_id.'">
                        <div class="dd-handle">'.anchor(MODULE_URL.'/category/'.$var->category_id,$var->category_name).'</div>';
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
                $str .= '<option value="'.$var->category_id.'">'.$pre.$var->category_name.'</option>';
                if(is_array($var->subCatalog)){
                    $str .= $this->buildOptionsCatalogHTML($var->subCatalog,$pre,$parent_id);
                }
            }
        }
        return $str;
    }

    public function listOrder($id=0,$parent_id=0) {
        $parent = parent::order_by('order','asc')->find_all_by(array('parent_id' => $parent_id,'category_id !='=>$id));

        $category = array();
        if(!empty($parent)) {
            foreach($parent as $key=>$var) {
                $category[$key] = $var;
                $category[$key]->subCatalog = $this->listOrder($id,$var->category_id);
            }
        }
        return $category;
    }
} 