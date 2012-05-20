<?php

/**
 * Description of GanttGetData
 * 
 * Get needed information to jsGantt view
 * 
 * @author sourn
 */

abstract class GanttGetData extends MysqlDBAdapter {

    	static private $columns = array(
	    'pID' => DATA_TYPE_INTEGER,
	    'pName' => DATA_TYPE_STRING,
	    'pStart' => DATA_TYPE_STRING,
            'pEnd' => DATA_TYPE_STRING,
            'pColor' => DATA_TYPE_INTEGER,
            'pMile' => DATA_TYPE_INTEGER,
            'pRes' => DATA_TYPE_STRING,
            'pComp' => DATA_TYPE_INTEGER,
            'pParent' => DATA_TYPE_INTEGER
	);
        
        function __construct() {
		Hook::fire('object_definition', 'GanttGetData', self::$columns);
		parent::__construct('GanttGetData', 'gantt_get_data', true);
	}
        
        function getColumns() {
		return array_keys(self::$columns);
	}
}

?>
