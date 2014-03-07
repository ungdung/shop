<?php
/**
 * Author: Keith.
 * Email: coder.notepad@gmail.com
 * Date: 12/20/13
 * Time: 2:57 PM
 */

class Slider_model extends BF_Model {

    protected $table_name = 'slider';
    protected $key = 'slider_id';
    protected $target_url = '/content/slider/detail/';
    protected $customer_id =true;

    public function __construct()
    {
        parent::__construct();

    }//end __construct()

    public function loadTable($kTable) {
        //set column you want select.
        $kTable['columns'][] = $this->key;
        //get data fill to table
        parent::select($kTable['columns']);
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
                    'image'=> anchor(MODULE_URL.'/edit/'.$var->slider_id,'<img src="'.(is_file($var->image) ? file_url($var->image) : '').'" style="max-width:40px;max-height:40px;" />'),
                    'title'=> $var->title,
                    'active' => showStatus($var->active),
                    "DT_RowId"  =>  $var->slider_id,
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