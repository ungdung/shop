<?php if (!defined('BASEPATH')) exit('No direct script access allowed');
/**
 * Bonfire
 *
 * An open source project to allow developers get a jumpstart their development of CodeIgniter applications
 *
 * @package   Bonfire
 * @author    Bonfire Dev Team
 * @copyright Copyright (c) 2011 - 2013, Bonfire Dev Team
 * @license   http://guides.cibonfire.com/license.html
 * @link      http://cibonfire.com
 * @since     Version 1.0
 * @filesource
 */

// ------------------------------------------------------------------------

/**
 * Application Hooks
 *
 * This class provides a set of methods used for the CodeIgniter hooks.
 * http://www.codeigniter.com/user_guide/general/hooks.html
 *
 * @package    Bonfire
 * @subpackage Hooks
 * @category   Hooks
 * @author     Bonfire Dev Team
 * @link       http://guides.cibonfire.com/core/hooks.html
 *
 */
class App_hooks
{


	/**
	 * Stores the CodeIgniter core object.
	 *
	 * @access private
	 *
	 * @var object
	 */
	private $ci;

	/**
	 * List of pages where the hooks are not run.
	 *
	 * @access private
	 *
	 * @var array
	 */
	private $ignore_pages = array('/users/login', '/users/logout', '/users/register', '/users/forgot_password', '/users/activate', '/users/resend_activation', '/images');

	//--------------------------------------------------------------------


	/**
	 * Costructor
	 */
	public function __construct()
	{
		$this->ci =& get_instance();
	}//end __construct()

	//--------------------------------------------------------------------


	/**
	 * Stores the name of the current uri in the session as 'previous_page'.
	 * This allows redirects to take us back to the previous page without
	 * relying on inconsistent browser support or spoofing.
	 *
	 * Called by the "post_controller" hook.
	 *
	 * @access public
	 *
	 * @return void
	 */
	public function prep_redirect()
	{
		if (!class_exists('CI_Session'))
		{
			$this->ci->load->library('session');
		}

		if (!in_array($this->ci->uri->ruri_string(), $this->ignore_pages))
		{
			$this->ci->session->set_userdata('previous_page', current_url());
		}
	}//end prep_redirect()

	//--------------------------------------------------------------------

	/**
	 * Store the requested page in the session data so we can use it
	 * after the user logs in.
	 *
	 * Called by the "pre_controller" hook.
	 *
	 * @access public
	 *
	 * @return void
	 */
	public function save_requested()
	{
        // If the CI_Session class is not loaded, we might be called from
        // a controller that doesn't extend any of Bonfire's controllers.
        // In that case, we need to try to do this the old fashioned way
        // and add it straight to the session.
		if ( ! class_exists('CI_Session') && get_instance() === null)
		{
            // Let's try to grab it from the REQUEST_URI since
            // this will work in majority of cases.
            $uri = isset($_SERVER['REQUEST_URI']) && ! empty($_SERVER['REQUEST_URI']) ? $_SERVER['REQUEST_URI'] : null;

            // Try to get the current URL through PATH INFO
            if ( empty($uri) && isset($_SERVER['PATH_INFO']))
            {
                $path = (isset($_SERVER['PATH_INFO'])) ? $_SERVER['PATH_INFO'] : @getenv('PATH_INFO');
                if (trim($path, '/') != '' && $path != "/".SELF)
                {
                    $uri = $path;
                }
            }

            // Finally, let's try the query string.
            if (empty($uri) && isset($_SERVER['QUERY_STRING']))
            {
                $path =  (isset($_SERVER['QUERY_STRING'])) ? $_SERVER['QUERY_STRING'] : @getenv('QUERY_STRING');
                if (trim($path, '/') != '')
                {
                    $uri = $path;
                }
            }

            $_SESSION['requested_page'] = $uri;
            return;
		}

        // If we can get an actual instance, then just load the session lib.
        else if ( ! class_exists('CI_Session') && is_object( get_instance() ))
        {
            $this->load->library('session');
        }

		if ( ! in_array($this->ci->uri->ruri_string(), $this->ignore_pages))
		{
			$this->ci->session->set_userdata('requested_page', current_url());
		}
	}//end save_requested()

	//--------------------------------------------------------------------


	/**
	 * Check the online/offline status of the site.
	 *
	 * Called by the "post_controller_constructor" hook.
	 *
	 * @access public
	 *
	 * @return void
	 *
	 */
	public function check_site_status()
	{

        // If the settings lib is not available, try to load it.
        if ( ! isset($this->ci->settings_lib))
        {
            $this->ci->load->library('system/settings_lib');
        }

		if ($this->ci->settings_lib->item('site.maintenance') == 1 AND strpos(site_url($this->ci->uri->uri_string()),site_url(SITE_AREA))===false)
		{
            $segment = $this->ci->uri->segment(1);
			if($segment!='login' AND $segment!='logout' AND $segment!='uploader') {
                show_maintenance();
			}
		}
	}//end check_site_status()

	//--------------------------------------------------------------------

}//end class
