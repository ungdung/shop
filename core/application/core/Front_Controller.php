<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

/**
 * Front Controller
 *
 * This class provides a common place to handle any tasks that need to
 * be done for all public-facing controllers.
 *
 * @package    Bonfire\Core\Controllers
 * @category   Controllers
 * @author     Bonfire Dev Team
 * @link       http://guides.cibonfire.com/helpers/file_helpers.html
 *
 */
class Front_Controller extends Base_Controller
{

    //--------------------------------------------------------------------
    protected $theme;
    /**
     * Class constructor
     *
     */
    public function __construct()
    {
        parent::__construct();
        $this->load->library('template');
        $this->load->library('assets');
        $this->theme = $this->db->where('theme_id',THEME_ID)->get('theme')->row('theme_folder');
        Template::set_default_theme($this->theme);
        Template::set_theme($this->theme);
    }//end __construct()

    //--------------------------------------------------------------------

}

/* End of file Front_Controller.php */
/* Location: ./application/core/Front_Controller.php */