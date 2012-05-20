<?php

/**
 * Description of GanttGetData
 * 
 * Get needed information to jsGantt view
 * 
 * @author sourn
 */

abstract class GanttGetData extends DataManager {

    	static private $columns = array(
	    'object_id' => DATA_TYPE_INTEGER,
	    'description' => DATA_TYPE_TEXT,
	    'show_description_in_overview' => DATA_TYPE_TINYINT,
            'color' => DATA_TYPE_INT
	);
        
        
}

?>
