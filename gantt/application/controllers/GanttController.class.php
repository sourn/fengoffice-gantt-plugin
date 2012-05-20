<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of GanttController
 *
 * @author sourn
 */
class GanttController extends ApplicationController {
    var $plugin_name = "gantt";	
    function __construct() {
            parent::__construct();
            prepare_company_website_controller($this, 'website');
    }
    function gantt_get_data() {
        
    }
    function show_gantt() {
        require_javascript('jsgantt.js', $this->plugin_name);
    }
}

?>
