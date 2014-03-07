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
 * Auth Library
 *
 * Provides authentication functions for logging users in/out, restricting access
 * to controllers, and managing login attempts.
 *
 * Security and ease-of-use are the two primary goals of the Auth system in Bonfire.
 * This lib will be constantly updated to reflect the latest security practices that
 * we learn about, while maintaining the simple API.
 *
 * @package    Bonfire
 * @subpackage Modules_Users
 * @category   Libraries
 * @author     Bonfire Dev Team
 * @link       http://guides.cibonfire.com/helpers/file_helpers.html
 *
 */
class Auth
{

	/**
	 * The url to redirect to on successful login.
	 *
	 * @access public
	 *
	 * @var string
	 */
	public $login_destination = '';

	/**
	 * Stores the logged in user after the first test to improve performance.
	 *
	 * @access private
	 *
	 * @var object
	 */
	private $user;

	/**
	 * Stores the ip_address of the current user for performance reasons.
	 *
	 * @access private
	 *
	 * @var string
	 */
	private $ip_address;

	/**
	 * Stores the name of all existing permissions
	 *
	 * @access private
	 *
	 * @var array
	 */
	private $permissions = NULL;

	/**
	 * Stores permissions by role so we don't have to scour the database more than once.
	 *
	 * @access private
	 *
	 * @var array
	 */
	private $role_permissions = array();

	/**
	 * A pointer to the CodeIgniter instance.
	 *
	 * @access private
	 *
	 * @var object
	 */
	private $ci;

	//--------------------------------------------------------------------



	public function __construct()
	{
		$this->ci =& get_instance();

		$this->ip_address = $this->ci->input->ip_address();

		$this->ci->load->model('users/users_model');

		$this->ci->load->library('session');

		// Try to log the user in from session/cookie data
		$this->autologin();

		log_message('debug', 'Auth class initialized.');

	}//end __construct()

	//--------------------------------------------------------------------

	/**
	 * Attempt to log the user in.
	 *
	 * @access public
	 *
	 * @param string $login    The user's login credentials (email/username)
	 * @param string $password The user's password
	 * @param bool   $remember Whether the user should be remembered in the system.
	 *
	 * @return bool
	 */
	public function login($login, $password, $remember=FALSE)
	{
		if (empty($login) || empty($password))
		{
			Template::set_message(lang("Incorrect email or password"), 'error');
			return FALSE;
		}

		$this->ci->load->model('users/users_model', 'users_model');

		// Grab the user from the db
		$selects = 'id, email, CONCAT(first_name, " ", last_name) as full_name, avatar, users.role_id, users.active, password_hash';

        $user = $this->ci->users_model->select($selects,false)->find_by('email', $login);
		// check to see if a value of FALSE came back, meaning that the username or email or password doesn't exist.
		if ($user == FALSE)
		{
			Template::set_message(lang('Incorrect email or password'), 'error');
			return FALSE;
		}
		// Try password
		if ($this->check_password($password, $user->password_hash))
		{

			$this->clear_login_attempts($login);

			// We've successfully validated the login, so setup the session
			$this->setup_session($user->id, $user->full_name, $user->avatar, $user->password_hash, $user->email, $user->role_id, $remember,'');

			// Save the login info
			$data = array(
				'last_login'			=> date('Y-m-d H:i:s', time()),
				'last_ip'				=> $this->ip_address,
			);
            $this->ci->users_model->setAction('has logged');

			$this->ci->users_model->update($user->id, $data);

			// Clear the cached result of user() (and hence is_logged_in(), user_id() etc).
			// Doesn't fix `$this->current_user` in controller (for this page load)...
			unset($this->user);
			return TRUE;
		}

		// Bad password
		else
		{
			Template::set_message(lang('The Email or The Password is incorrect. Please try again'), 'error');
			$this->increase_login_attempts($login);
		}
		return FALSE;
	}//end login()

	//--------------------------------------------------------------------

	/**
	 * Destroys the autologin information and the current session.
	 *
	 * @access public
	 *
	 * @return void
	 */
	public function logout()
	{
		$data = array(
			'user_id'	=> $this->user_id(),
			'role_id'	=> $this->role_id()
		);
		// Destroy the autologin information
		$this->delete_autologin();

		// Destroy the session
		$this->ci->session->sess_destroy();

	}//end logout()

	//--------------------------------------------------------------------

	/**
	 * Checks the session for the required info, then verifies against the database.
	 *
	 * @access public
	 *
	 * @return object (or a false value)
	 */
	public function user()
	{
		// If we've already checked this session,
		// return that.
		if (isset($this->user))
		{
			return $this->user;
		}

		$this->user = FALSE;
		// Is there any session data we can use?
		if ($this->ci->session->userdata('identity') && $this->ci->session->userdata('user_id'))
		{
			// Grab the user account
			$user = $this->ci->users_model->find($this->ci->session->userdata('user_id'));

			if ($user !== FALSE)
			{
				// load do_hash()
				$this->ci->load->helper('security');

				// Ensure user_token is still equivalent to the SHA1 of the user_id and password_hash
				if (do_hash($this->ci->session->userdata('user_id') . $user->password_hash) === $this->ci->session->userdata('user_token'))
				{
					$this->user = $user;
				}
			}
		}//end if

		if ($this->user !== FALSE)
		{
			$this->user->id = (int) $this->user->id;
			$this->user->role_id = (int) $this->user->role_id;
		}
		return $this->user;

	}//end user()


	//--------------------------------------------------------------------

	/**
	 * Checks the session for the required info, then verifies against the database.
	 *
	 * @access public
	 *
	 * @return bool
	 */
	public function is_logged_in()
	{
		return (bool) $this->user();

	}//end is_logged_in()

	//--------------------------------------------------------------------

	/**
	 * Checks that a user is logged in (and, optionally of the correct role)
	 * and, if not, send them to the login screen.
	 *
	 * If no permission is checked, will simply verify that the user is logged in.
	 * If a permission is passed in to the first parameter, will check the user's role
	 * and verify that role has the appropriate permission.
	 *
	 * @access public
	 *
	 * @param string $permission (Optional) A string representing the permission to check for.
	 * @param string $uri        (Optional) A string representing an URI to redirect, if FALSE
	 *
	 * @return bool TRUE if the user has the appropriate access permissions. Redirect to the previous page if the user doesn't have permissions. Redirect to LOGIN_AREA page if the user is not logged in.
	 */
	public function restrict($permission=NULL, $uri=NULL)
	{
		// If user isn't logged in, don't need to check permissions
		if ($this->is_logged_in() === FALSE)
		{
			$this->ci->load->library('Template');
			Template::set_message($this->ci->lang->line('You need login'), 'error');
			Template::redirect(LOGIN_URL);
		}

		// Check to see if the user has the proper permissions
		if ( ! empty($permission) && ! $this->has_permission($permission))
		{
			// set message telling them no permission THEN redirect
			Template::set_message( lang('You need permission to view that page'), 'warning');

			if ( ! $uri)
			{
				$uri = $this->ci->session->userdata('previous_page');

				// If previous page was the same (e.g. user pressed F5),
				// but permission has been removed, then redirecting
				// to it will cause an infinite loop.
				if ($uri == current_url())
				{
					$uri = site_url();
				}
			}
			Template::redirect($uri);
		}

		return TRUE;

	}//end restrict()

	//--------------------------------------------------------------------



	//--------------------------------------------------------------------
	// !UTILITY METHODS
	//--------------------------------------------------------------------

	/**
	 * Retrieves the user_id from the current session.
	 *
	 * @access public
	 *
	 * @return int
	 */
	public function user_id()
	{
		if ( ! $this->is_logged_in())
		{
			return FALSE;
		}

		return $this->user()->id;

	}//end user_id()

	//--------------------------------------------------------------------

	/**
	 * Retrieves the logged identity from the current session.
	 * Built from the user's submitted login.
	 *
	 * @access public
	 *
	 * @return string The identity used to login.
	 */
	public function identity()
	{
		if ( ! $this->is_logged_in())
		{
			return FALSE;
		}

		return $this->ci->session->userdata('identity');

	}//end identity()

	//--------------------------------------------------------------------

	/**
	 * Retrieves the role_id from the current session.
	 *
	 * @return int The user's role_id.
	 */
	public function role_id()
	{
		if ( ! $this->is_logged_in())
		{
			return FALSE;
		}

		return $this->user()->role_id;

	}//end role_id()

	//--------------------------------------------------------------------

	/**
	 * Verifies that the user is logged in and has the appropriate access permissions.
	 *
	 * @access public
	 *
	 * @param string $permission A string with the permission to check for, ie 'Site.Signin.Allow'
	 * @param int    $role_id    The id of the role to check the permission against. If role_id is not passed into the method, then it assumes it to be the current user's role_id.
	 * @param bool   $override   Whether or not access is granted if this permission doesn't exist in the database
	 *
	 * @return bool TRUE/FALSE
	 */
	public function has_permission($permission, $role_id=NULL, $override = FALSE)
	{
		// move permission to lowercase for easier checking.
		$permission = strtolower($permission);

		// If no role is being provided, assume it's for the current
		// logged in user.
		if (empty($role_id))
		{
			$role_id = $this->role_id();
		}

		$this->load_permissions();
		$this->load_role_permissions($role_id);

		// did we pass?
		if (isset($this->permissions[$permission]))
		{
			$permission_id = $this->permissions[$permission];

			if (isset($this->role_permissions[$role_id][$permission_id]))
			{
				return TRUE;
			}
		}
		elseif ($override)
		{
			return TRUE;
		}

		return FALSE;


	}//end has_permission()

	//--------------------------------------------------------------------

	/**
	 * Checks to see whether a permission is in the system or not.
	 *
	 * @access public
	 *
	 * @param string $permission The name of the permission to check for. NOT case sensitive.
	 *
	 * @return bool TRUE/FALSE
	 */
	public function permission_exists($permission)
	{
		// move permission to lowercase for easier checking.
		$permission = strtolower($permission);

		$this->load_permissions();

		return isset($this->permissions[$permission]);

	}//end permission_exists()

	//--------------------------------------------------------------------

	/**
	 * Load the permission names from the database
	 *
	 * @access public
	 *
	 * @param int $role_id An INT with the role id to grab permissions for.
	 *
	 * @return void
	 */
	private function load_permissions()
	{
		if ( ! isset($this->permissions))
		{
			$this->ci->load->model('permissions/permission_model');

			$perms = $this->ci->permission_model->find_all();

			$this->permissions = array();

			foreach ($perms as $perm)
			{
				$this->permissions[strtolower($perm->name)] = $perm->permission_id;
			}
		}

	}//end load_permissions()

	/**
	 * Load the role permissions from the database
	 *
	 * @access public
	 *
	 * @param int $role_id An INT with the role id to grab permissions for.
	 *
	 * @return void
	 */
	private function load_role_permissions($role_id=NULL)
	{
		$role_id = ! is_null($role_id) ? $role_id : $this->role_id();

		if ( ! isset($this->role_permissions[$role_id]))
		{
			$this->ci->load->model('roles/role_permission_model');

			$role_perms = $this->ci->role_permission_model->find_for_role($role_id);

			$this->role_permissions[$role_id] = array();

			if (is_array($role_perms))
			{
				foreach($role_perms as $permission)
				{
					$this->role_permissions[$role_id][$permission->permission_id] = TRUE;
				}
			}
		}

	}//end load_role_permissions()

	//--------------------------------------------------------------------


	/**
	 * Retrieves the role_name for the requested role.
	 *
	 * @access public
	 *
	 * @param int $role_id An int representing the role_id.
	 *
	 * @return string A string with the name of the matched role.
	 */
	public function role_name_by_id($role_id)
	{
		if ( ! is_numeric($role_id))
		{
			return '';
		}

		$roles = array();

		// If we already stored the role names, use those...
		if (isset($this->role_names))
		{
			$roles = $this->role_names;
		}
		else
		{
			if ( ! class_exists('Role_model'))
			{
				$this->ci->load->model('roles/role_model');
			}
			$results = $this->ci->role_model->select('role_id, role_name')->find_all();

			foreach ($results as $role)
			{
				$roles[$role->role_id] = $role->role_name;
			}
		}

		// Try to return the role name
		if (isset($roles[$role_id]))
		{
			return $roles[$role_id];
		}

		return '';

	}//end role_name_by_id()

	//--------------------------------------------------------------------

	/*
	 * Passwords
	 */

	/**
	 * Hash a password
	 *
	 * @param String $pass		The password to hash
	 * @param Int $iterations	The number of iterations used in hashing the password
	 *
	 * @return Array			An associative array containing the hashed password and number of iterations
	 */
	public function hash_password($pass, $iterations=0)
	{
		// The shortest valid hash phpass can currently return is 20 characters,
		// which would only happen with CRYPT_EXT_DES
		$min_hash_len = 20;

		if (empty($iterations) || ! is_numeric($iterations) || $iterations <= 0)
		{
			$iterations = $this->ci->settings_lib->item('password_iterations');
		}

		// Load the password hash library
		if ( ! class_exists('PasswordHash'))
		{
			require(dirname(__FILE__) . '/../libraries/PasswordHash.php');
		}

		$hasher = new PasswordHash($iterations, false);
		$password = $hasher->HashPassword($pass);

		unset($hasher);

		if (strlen($password) < $min_hash_len)
		{
			return false;
		}

		return array('hash' => $password, 'iterations' => $iterations);

	}

	//--------------------------------------------------------------------

	/**
	 * Check the supplied password against the supplied hash
	 *
	 * @param String $password The password to check
	 * @param String $hash     The hash
	 *
	 * @return Bool    true if the password and hash match, else false
	 */
	public function check_password($password, $hash)
	{
		// Load the password hash library
		if ( ! class_exists('PasswordHash'))
		{
			require(dirname(__FILE__) . '/PasswordHash.php');
		}

		// Try password
		$hasher = new PasswordHash(-1, false);
		$return = $hasher->CheckPassword($password, $hash);
		unset($hasher);

		return $return;

	}

	//--------------------------------------------------------------------
	// !LOGIN ATTEMPTS
	//--------------------------------------------------------------------

	/**
	 * Records a login attempt into the database.
	 *
	 * @access protected
	 *
	 * @param string $login The login id used (typically email or username)
	 *
	 * @return void
	 */
	protected function increase_login_attempts($login)
	{
		$this->ci->db->insert('login_attempts', array('ip_address' => $this->ip_address, 'login' => $login));

	}//end increase_login_attempts()

	//--------------------------------------------------------------------

	/**
	 * Clears all login attempts for this user, as well as cleans out old logins.
	 *
	 * @access protected
	 *
	 * @param string $login   The login credentials (typically email)
	 * @param int    $expires The time (in seconds) that attempts older than will be deleted
	 *
	 * @return void
	 */
	protected function clear_login_attempts($login, $expires = 86400)
	{
		$this->ci->db->where(array('ip_address' => $this->ip_address, 'login' => $login));

		// Purge obsolete login attempts
		$this->ci->db->or_where('time <', date('Y-m-d H:i:s', time() - $expires));

		$this->ci->db->delete('login_attempts');

	}//end clear_login_attempts()

	//--------------------------------------------------------------------

	/**
	 * Get number of attempts to login occurred from given IP-address and/or login
	 *
	 * @param string $login (Optional) The login id to check for (email/username). If no login is passed in, it will only check against the IP Address of the current user.
	 *
	 * @return int An int with the number of attempts.
	 */
	function num_login_attempts($login=NULL)
	{
		$this->ci->db->select('1', FALSE);
		$this->ci->db->where('ip_address', $this->ip_address);
		if (strlen($login) > 0)
		{
			$this->ci->db->or_where('login', $login);
		}

		$query = $this->ci->db->get('login_attempts');

		return $query->num_rows();

	}//end num_login_attempts()

	//--------------------------------------------------------------------
	// !AUTO-LOGIN
	//--------------------------------------------------------------------

	/**
	 * Attempts to log the user in based on an existing 'autologin' cookie.
	 *
	 * @access private
	 *
	 * @return void
	 */
	private function autologin()
	{
		$this->ci->load->library('system/settings_lib');

		if ($this->ci->settings_lib->item('auth.allow_remember') == FALSE)
		{
			return;
		}

		$this->ci->load->helper('cookie');

		$cookie = get_cookie('autologin', TRUE);

		if ( ! $cookie)
		{
			return;
		}

		// We have a cookie, so split it into user_id and token
		list($user_id, $test_token) = explode('~', $cookie);

		// Try to pull a match from the database
		$this->ci->db->where( array('user_id' => $user_id, 'token' => $test_token) );
		$query = $this->ci->db->get('user_cookies');

		if ($query->num_rows() == 1)
		{
			// Save logged in status to save on db access later.
			$this->logged_in = TRUE;

			// If a session doesn't exist, we need to refresh our autologin token
			// and get the session started.
			if ( ! $this->ci->session->userdata('user_id'))
			{
				// Grab the current user info for the session
				$this->ci->load->model('users/users_model', 'users_model');
				$user = $this->ci->users_model->select('id, username, email, password_hash, users.role_id')->find($user_id);

				if ( ! $user)
				{
					return;
				}

				$this->setup_session($user->id, $user->username, $user->avatar, $user->password_hash, $user->email, $user->role_id, TRUE, $test_token);
			}
		}

	}//end autologin()

	//--------------------------------------------------------------------


	/**
	 * Create the auto-login entry in the database. This method uses
	 * Charles Miller's thoughts at:
	 * http://fishbowl.pastiche.org/2004/01/19/persistent_login_cookie_best_practice/
	 *
	 * @access private
	 *
	 * @param int    $user_id    An int representing the user_id.
	 * @param string $old_token The previous token that was used to login with.
	 *
	 * @return bool Whether the autologin was created or not.
	 */
	private function create_autologin($user_id, $old_token=NULL)
	{
		if ($this->ci->settings_lib->item('auth.allow_remember') == FALSE)
		{
			return FALSE;
		}

		// load random_string()
		$this->ci->load->helper('string');

		// Generate a random string for our token
		$token = random_string('alnum', 128);

		// If an old_token is presented, we're refreshing the autologin information
		// otherwise we're creating a new one.
		if (empty($old_token))
		{
			// Create a new token
			$data = array(
				'user_id'		=> $user_id,
				'token'			=> $token,
				'created_on'	=> date('Y-m-d H:i:s')
			);
			$this->ci->db->insert('user_cookies', $data);
		}
		else
		{
			// Refresh the token
			$this->ci->db->where('user_id', $user_id);
			$this->ci->db->where('token', $old_token);
			$this->ci->db->set('token', $token);
			$this->ci->db->set('created_on', date('Y-m-d H:i:s'));
			$this->ci->db->update('user_cookies');
		}

		if ($this->ci->db->affected_rows())
		{
			// Create the autologin cookie
			$this->ci->input->set_cookie('autologin', $user_id .'~'. $token, $this->ci->settings_lib->item('auth.remember_length'));

			return TRUE;
		}
		else
		{
			return FALSE;
		}

	}//end create_autologin()()

	//--------------------------------------------------------------------

	/**
	 * Deletes the autologin cookie for the current user.
	 *
	 * @access private
	 *
	 * @return void
	 */
	private function delete_autologin()
	{
		if ($this->ci->settings_lib->item('auth.allow_remember') == FALSE)
		{
			return;
		}

		// First things first.. grab the cookie so we know what row
		// in the user_cookies table to delete.
		$this->ci->load->helper('cookie');

		$cookie = get_cookie('autologin');
		if ($cookie)
		{
			list($user_id, $token) = explode('~', $cookie);

			// Now we can delete the cookie
			delete_cookie('autologin');

			// And clean up the database
			$this->ci->db->where('user_id', $user_id);
			$this->ci->db->where('token', $token);
			$this->ci->db->delete('user_cookies');
		}

		// Also perform a clean up of any autologins older than 2 months
		$this->ci->db->where('created_on', '< DATE_SUB(CURDATE(), INTERVAL 2 MONTH)');
		$this->ci->db->delete('user_cookies');

	}//end delete_autologin()

	//--------------------------------------------------------------------

	/**
	 * Creates the session information for the current user. Will also create an autologin cookie if required.
	 *
	 * @access private
	 *
	 * @param int $user_id          An int with the user's id
	 * @param string $username      The user's username
	 * @param string $password_hash The user's password hash. Used to create a new, unique user_token.
	 * @param string $email         The user's email address
	 * @param int    $role_id       The user's role_id
	 * @param bool   $remember      A boolean (TRUE/FALSE). Whether to keep the user logged in.
	 * @param string $old_token     User's db token to test against
	 * @param string $user_name     User's made name for displaying options
	 *
	 * @return bool TRUE/FALSE on success/failure.
	 */
	private function setup_session($user_id, $full_name, $avatar, $password_hash, $email, $role_id, $remember=FALSE, $old_token=NULL)
	{
		// What are we using as login identity?

		// Save the user's session info

		// load do_hash()
		$this->ci->load->helper('security');
        //check and set default avatar
        if(!is_file($avatar)) {
            $avatar = $this->ci->config->item('avatar_default');
        }

		$data = array(
            'user_id'		=> $user_id,
            'full_name'		=> $full_name,
            'email'		    => $email,
            'avatar'		=> $avatar,
			'auth_custom'	=> $email,
			'user_token'	=> do_hash($user_id . $password_hash),
			'identity'		=> $email,
			'role_id'		=> $role_id,
			'logged_in'		=> TRUE,
		);

		$this->ci->session->set_userdata($data);

		// Should we remember the user?
		if ($remember === TRUE)
		{
			return $this->create_autologin($user_id, $old_token);
		}

		return TRUE;

	}//end setup_session

	//--------------------------------------------------------------------


    public function userProfile($userID=false) {
        if(!$userID) {
            $user = new stdClass();
            $user->user_id = $this->ci->session->userdata('user_id');
            $user->full_name = $this->ci->session->userdata('full_name');
            $user->avatar = file_url($this->ci->session->userdata('avatar'));
            $user->email = $this->ci->session->userdata('email');
            $user->role_id = $this->ci->session->userdata('role_id');
        }
        else {
            $user = $this->ci->db->select('id, CONCAT(first_name, " ", last_name) as full_name, avatar, email, role_id',false)->where('id',$userID)->get('users')->row();
            //check and set default avatar
            if(isset($user->avatar) AND is_file($user->avatar)) {
                $user->avatar = file_url($user->avatar);
            }
            else if(isset($user->avatar)) {
                $user->avatar = file_url($this->ci->config->item('avatar_default'));
            }
        }
        return $user;
    }

    public function name($id) {
        return $this->ci->db->select('CONCAT(first_name, " ", last_name) as full_name',false)->where('id',$id)->get('users')->row('full_name');

    }



}//end Auth

//--------------------------------------------------------------------

if ( ! function_exists('has_permission'))
{
	/**
	 * A convenient shorthand for checking user permissions.
	 *
	 * @access public
	 *
	 * @param string $permission The permission to check for, ie 'Site.Signin.Allow'
	 * @param bool   $override   Whether or not access is granted if this permission doesn't exist in the database
	 *
	 * @return bool TRUE/FALSE
	 */
	function has_permission($permission, $override = FALSE)
	{
		$ci =& get_instance();

		return $ci->auth->has_permission($permission, NULL, $override);

	}//end has_permission()
}

//--------------------------------------------------------------------

if ( ! function_exists('permission_exists'))
{
	/**
	 * Checks to see whether a permission is in the system or not.
	 *
	 * @access public
	 *
	 * @param string $permission The name of the permission to check for. NOT case sensitive.
	 *
	 * @return bool TRUE/FALSE
	 */
	function permission_exists($permission)
	{
		$ci =& get_instance();

		return $ci->auth->permission_exists($permission);

	}//end permission_exists()
}

//--------------------------------------------------------------------

if ( ! function_exists('abbrev_name'))
{
	/**
	 * Retrieves first and last name from given string.
	 *
	 * @access public
	 *
	 * @param string $name Full name
	 *
	 * @return string The First and Last name from given parameter.
	 */
	function abbrev_name($name)
	{
		if (is_string($name))
		{
			list($fname, $lname) = explode(' ', $name, 2);

			if (is_null($lname)) // Meaning only one name was entered...
			{
				$lastname = ' ';
			}
			else
			{
				$lname = explode( ' ', $lname );
				$size = sizeof($lname);
				$lastname = $lname[$size-1]; //
			}

			return trim($fname.' '.$lastname) ;

		}

		// TODO: Consider an optional parameter for picking custom var session.
		// Making it auth private, and using auth custom var

		return $name;

	}//end abbrev_name()


}