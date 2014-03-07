<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class BF_Lang extends CI_Lang {

    function load($langfile = '', $idiom = '', $return = FALSE, $add_suffix = TRUE, $alt_path = '')
    {

        $langfile = str_replace('.php', '', $langfile);

        if ($add_suffix == TRUE)
        {
            $langfile = str_replace('_lang.', '', $langfile).'_lang';
        }

        $langfile .= '.php';

        if (in_array($langfile, $this->is_loaded, TRUE))
        {
            return;
        }

        // Is there a possible module?
        $matches = explode('/', $langfile);
        $module = '';

        if (strpos($matches[0], '.php') === false)
        {
            $module = $matches[0];
            $orig_langfile = $langfile;
            $langfile = str_replace($module .'/', '', $langfile);
        }

        unset($matches);



        if ($idiom == '')
        {
            $deft_lang = LANGUAGE;
            $idiom = ($deft_lang == '') ? 'english' : $deft_lang;
        }

        // Determine where the language file is and load it
        if ($alt_path != '' && file_exists($alt_path.'language/'.$idiom.'/'.$langfile))
        {
            include($alt_path.'language/'.$idiom.'/'.$langfile);
        }
        else
        {
            $found = FALSE;

            foreach (get_instance()->load->get_package_paths(TRUE) as $package_path)
            {
                if (file_exists($package_path. 'language/'.$idiom.'/'.$langfile))
                {
                    include($package_path. 'language/'.$idiom.'/'.$langfile);
                    $found = TRUE;
                    break;
                }
            }

            if ($found !== TRUE)
            {
                show_error('Unable to load the requested language file: language/'.$idiom.'/'.$langfile);
            }
        }


        if ( ! isset($lang))
        {
            log_message('error', 'Language file contains no data: language/'.$idiom.'/'.$langfile);
            return;
        }

        if ($return == TRUE)
        {
            return $lang;
        }

        $this->is_loaded[] = $langfile;
        $this->language = array_merge($this->language, $lang);
        unset($lang);

        log_message('debug', 'Language file loaded: language/'.$idiom.'/'.$langfile);
        return TRUE;
    }

    // --------------------------------------------------------------------
}