<?php
/**
 * Author: Keith.
 * Email: coder.notepad@gmail.com
 * Date: 12/20/13
 * Time: 2:57 PM
 */

class Product_model extends BF_Model {

    protected $table_name = 'product';
    protected $category = 'product_category';
    protected $key = 'product_id';
    protected $target_url = '/content/product/detail/';
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
            $this->action = 'created a slider';
            return parent::insert($data);
        }
        $this->action = 'updated a slider';
        $result = parent::update($id,$data);
        if($result) {
            return $id;
        }
        return false;
    }


} 