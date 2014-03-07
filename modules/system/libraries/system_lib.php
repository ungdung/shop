<?php  defined('BASEPATH') or exit('No direct script access allowed');

class System_lib
{

    protected $ci;

    private static $cache = array();

    //--------------------------------------------------------------------

    public function __construct()
    {

        $this->ci =& get_instance();
        $this->ci->load->model('system/system_model');

        $this->find_all();

    }//end __construct()

    public function __get($name)
    {
        return self::get($name);

    }//end __get

    public function __set($name, $value)
    {
        return self::set($name, $value);

    }//end __set

    public static function item($name)
    {
        $ci =& get_instance();
        if(isset(self::$cache[$name]))
        {
            return self::$cache[$name];
        }

        $setting = $ci->system_model->find_by('name', $name);

        // Setting doesn't exist, maybe it's a config option
        $value = $setting ? $setting->value : config_item($name);

        // Store it for later
        self::$cache[$name] = $value;

        return $value;

    }//end item()

    public static function set($name, $value, $module='core')
    {
        $ci =& get_instance();

        if (isset(self::$cache[$name]))
        {
            $setting = $ci->system_model->update_where('name', $name, array('value' => $value));
        }
        else
        {
            // insert
            $data = array(
                'name'   => $name,
                'value'  => $value,
                'module' => $module,
            );

            $setting = $ci->system_model->insert($data);
        }

        self::$cache[$name] = $value;

        return TRUE;

    }//end set()

    public static function delete($name, $module='core')
    {
        $ci =& get_instance();

        if (isset(self::$cache[$name]))
        {
            $data = array(
                'name'   => $name,
                'module' => $module,
            );

            if ($ci->system_model->delete_where($data))
            {
                unset(self::$cache[$name]);

                return TRUE;
            }
        }

        return FALSE;

    }//end delete()

    public function find_all()
    {
        if(self::$cache)
        {
            return self::$cache;
        }
        $settings = $this->ci->system_model->find_all();

        foreach($settings as $setting)
        {
            self::$cache[$setting->name] = $setting->value;
        }

        return self::$cache;

    }//end find_all()

    public function find_by($field=null, $value=null)
    {

        $settings = $this->ci->system_model->find_by($field, $value);

        foreach($settings as $setting)
        {
            self::$cache[$setting['name']] = $setting['value'];
        }

        return $settings;

    }//end find_by()

    public function find_all_by($field=null, $value=null)
    {

        $settings = $this->ci->system_model->find_all_by($field, $value);

        if (is_array($settings) && count($settings))
        {
            foreach($settings as $key => $value)
            {
                self::$cache[$key] = $value;
            }
        }

        return $settings;

    }//end find_all_by()


}//end Settings_lib

if ( ! function_exists('system_item'))
{
    function system_item($name = NULL)
    {
        if ($name === NULL)
        {
            return FALSE;
        }

        return System_lib::item($name);
    }//end system_item()

}
