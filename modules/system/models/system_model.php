<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class System_model extends BF_Model
{


	protected $table_name	= 'system';

	protected $key			= 'name';

	protected $soft_deletes	= FALSE;

	protected $date_format = 'datetime';

	protected $set_created = FALSE;

	protected $set_modified = FALSE;

	public function find_all_by($field=NULL, $value=NULL, $type='and')
	{
		if (empty($field)) return FALSE;

		// Setup our field/value check
		if ( ! is_array($field))
		{
			$field = array($field => $value);
		}

		if ($type == 'or')
		{
			$this->db->or_where($field);
		}
		else
		{
			$this->db->where($field);
		}

		$results = $this->find_all();

		$return_array = array();

		if (is_array($results) && count($results))
		{
			foreach ($results as $record)
			{
				$return_array[$record->name] = $record->value;
			}
		}

		return $return_array;

	}//end find_all_by()

}//end Settings_model
