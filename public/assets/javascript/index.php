<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="stylesheet" type="text/css" href="jsgantt.css"/>
<script type="text/javascript" language="javascript" src="jsgantt.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<style type="text/css">
<!--
    @media screen {
		body {
    		font-family:Arial, Helvetica, sans-serif;
    		font-size:11px;
			background-color:#ffffff;
		}
        .rightalign {
        	text-align: right;
        	vertical-align:top;
        }
		
		.sobluelabel {
			font-family: verdana, arial, helvetica, sans-serif;
			font-size:10px;
			font-weight : bold;
			color:#717fa1;
		}
		
		.short_instructions {
    		font-size:10px;
    		position:relative;
		}
		
		.progress {
    		font-size:10px;
    		float:left;
    		position:absolute;
		}
		
		input, textarea, select {
  			border: 1px solid #ccc;
	  		padding: 3px;
	  		font-family: verdana, arial, helvetica, sans-serif;
	  		font-size: 11px;
  		}

		select {
  			padding: 2px;
		}

		input:hover, textarea:hover, select:hover {
  			border: 1px solid deepskyblue;
		}

		input:focus, textarea:focus, select:focus {
 			border: 1px solid black;
		}
		
		.selections {
        	margin-left: auto ;
       		margin-right: auto ;
        	text-align: left ;
        	width: 750px ;
			background-color:#c8daf2;
			font-family: verdana, arial, helvetica, sans-serif;
			font-size:11px;
			color:#000;
        }
        
        .instructions {
        	padding-top: 0px;
        	padding-right: 15px;
        	padding-bottom: -5px;
        	padding-left: 15px;
			background-color:#c8daf2;
        }
        
        * {
        	overflow:visible !important;
        }
    }
    @media print {
    	.selections {
        	display:none;
    	}
    	#GanttChartDIV {
    		overflow:visible !important;
    	}
	} 
-->
</style>
<script type="text/javascript" language="javascript">
    function printerFriendly(){     
		// Set up terminator tags, they kill the script otherwise.
    	var myScriptTerminator = '</' + 'script' + '>';
    	var myStyleTerminator = '</' + 'style' + '>';

    	// Get a pointer to the HTML of the DIV element that contains our Gantt chart.
    	var myGanttChart = document.getElementById("GanttChartDIV").innerHTML;

		// Open a new window to put our printer-friendly copy of the chart in.
    	var myWin = window.open("","print_preview_window","location=no,status=no,toolbar=no,menubar=yes,resizable=yes,scrollbars=yes,height=600,width=800");

		// Write out the actual HTML code of the new window.
    	myWin.document.write('<html><head>');
    	myWin.document.write('<style type="text/css">');

		// Hide the date format selector (hacked jsgantt.js to add this id/name.
    	myWin.document.write('tr#dateformatselector { display:none; }');

		// Jump through some hoops to try to make FF print preview display more than one page.
		// It has trouble with DIVs that are bigger than the page size (since 2001)!
    	myWin.document.write('* { overflow:visible !important; }');
    	myWin.document.write('body { white-space:pre !important; }' + myStyleTerminator);

		// Write out the code recommended by jsgantt to insert the chart.
    	myWin.document.write('<link rel="stylesheet" type="text/css" href="jsgantt.css" />');
		myWin.document.write('<script language="javascript" src="jsgantt.js">' + myScriptTerminator);
		myWin.document.write('</head><body>');
		myWin.document.write('<div style="position:relative" class="gantt" id="GanttChartDIV">');
		myWin.document.write(myGanttChart);
		myWin.document.write('</div>');
		myWin.document.write('</body></html>');

		// Close out the document element so the window will display our new chart.
        myWin.document.close();
    }
</script>
</head>
<body>

<?php
// For safety, include some escape functions brought over from WordPress.

function clean_url( $url, $context = 'display' ) {
    $original_url = $url;
    
    if ('' == $url) return $url;
    $url = preg_replace('|[^a-z0-9-~+_.?#=!&;,/:%@$\|*\'()\\x80-\\xff]|i', '', $url);
    $strip = array('%0d', '%0a', '%0D', '%0A');
    $url = _deep_replace($strip, $url);
    $url = str_replace(';//', '://', $url);
    /* If the URL doesn't appear to contain a scheme, we
    * presume it needs http:// appended (unless a relative
    * link starting with / or a php file).
    */
    if ( strpos($url, ':') === false &&
      substr( $url, 0, 1 ) != '/' && substr( $url, 0, 1 ) != '#' && !preg_match('/^[a-z0-9-]+?\.php/i', $url) )
      $url = 'http://' . $url;
    
    // Replace ampersands and single quotes only when displaying.
    if ( 'display' == $context ) {
      $url = preg_replace('/&([^#])(?![a-z]{2,8};)/', '&#038;$1', $url);
      $url = str_replace( "'", '&#039;', $url );
    }
 return $url;
}

function _deep_replace($search, $subject){
    $found = true;
    while($found) {
      $found = false;
      foreach( (array) $search as $val ) {
          while(strpos($subject, $val) !== false) {
              $found = true;
              $subject = str_replace($val, '', $subject);
          }
      }
    }
return $subject;
}
  
function esc_url( $url ) {
	return clean_url( $url, 'display' );
}
  
function esc_url_raw( $url ) {
	return clean_url( $url, 'db' );
}

function isdate( $str ) { 
    $stamp = strtotime( $str );
    
    if (!is_numeric($stamp)) {
	    return FALSE;
    }
    $month = date( 'm', $stamp );
    $day   = date( 'd', $stamp );
    $year  = date( 'Y', $stamp );
    
    if (checkdate($month, $day, $year)) {
	    return TRUE;
    }    
	return FALSE;
} 

	// Set a carriage return character in case we have to echo some code, for readability.
	$crlf = chr(13);

	//(GIMMEGANTT) - Set up our connection to the Feng Office database.
	// There are two methods of connecting, either uncomment and fill in the fields
	// below, or place the same settings in another PHP file and 'include' it here.
	// To avoid confusion, uncomment and use one method, not both.
	// INCLUDE FILE...
	//include '../chartglobal.php';
	// OR FILL IN FIELDS.
	//$hostname_Feng = "hostname of your MySQL Server";
	//$database_Feng = "name of your Feng Office MySQL database";
	//$username_Feng = "username (account) with access to the database";
	//$password_Feng = "password for account with access to the database";
	
	// Actually make the connection to the database.
	$Feng = mysql_pconnect("localhost", "root", "lvbnhbq") or trigger_error(mysql_error(),E_USER_ERROR); 

	// Seeing as how this form calls itself to refresh the Gantt chart, let's check to see if we are being
	// called from ourself, and let's read the other values from the selection form too.
	$submitted = $_POST['hidSubmitted'];
    $workspaces = (isset($_POST['selWorkspaces']) ? $_POST['selWorkspaces'] : array());
    $resources = (isset($_POST['selResources']) ? $_POST['selResources'] : array());
    $startdate = (isset($_POST['pStart']) && isdate($_POST['pStart']) ? $_POST['pStart'] : '');
    $enddate = (isset($_POST['pEnd']) && isdate($_POST['pEnd']) ? $_POST['pEnd'] : '');
    $startchart = (isset($_POST['pStartChart']) && isdate($_POST['pStartChart']) ? '"' . $_POST['pStartChart'] . '"' : '""');
    $endchart = (isset($_POST['pEndChart']) && isdate($_POST['pEndChart']) ? '"' . $_POST['pEndChart'] . '"' : '""');
    $truncate = ((isset($_POST['txtTruncate']) && is_numeric($_POST['txtTruncate'])) ? (int)$_POST['txtTruncate'] : 50);
    $color = (((isset($_POST['chkColor']) && ($_POST['chkColor'] == 'on' || $_POST['chkColor'] == 'checked')) || (!$submitted)) ? true : false);
    $complete = (isset($_POST['chkComplete']) && ($_POST['chkComplete'] == 'on' || $_POST['chkComplete'] == 'checked') ? true : false);
    $duration = (((isset($_POST['chkDuration']) && ($_POST['chkDuration'] == 'on' || $_POST['chkDuration'] == 'checked')) || (!$submitted)) ? true : false);
    $dates = (((isset($_POST['chkDates']) && ($_POST['chkDates'] == 'on' || $_POST['chkDates'] == 'checked')) || (!$submitted)) ? true : false);
    $resource = (isset($_POST['chkResource']) && ($_POST['chkResource'] == 'on' || $_POST['chkResource'] == 'checked') ? true : false);
    $characterset = (isset($_POST['selCharacterSet']) ? $_POST['selCharacterSet'] : "ISO-8859-15");
	
	$SQL_STRING = '';
	$SQL_SELECT = 'SELECT * ';
	$SQL_FROM = 'FROM my_jsgantt ';
	$SQL_WHERE = '';
	$SQL_workspaces = '';
	$SQL_resources = '';
	$SQL_start = '';
	$SQL_end = '';
	$SQL_complete = '';
	$SQL_ORDER = ' ORDER BY rowcount;';
	$SQL_OVERRIDE = false;
    $SQL_resources_argument = '';
		
	// If we have form values, then we can build our SQL statement from them dynamically.
	// To loop through the multiple selection boxes, we can use a foreach loop, and because
	// PHP has the nasty habit of throwing a Warning: if it tries to foreach on "nothing"
	// we will cast our variables as "array" types in the foreach statements.
	if ($workspaces) {
		if (strstr(implode($workspaces), '---- Select All ----') != false) {
			$SQL_workspaces = '';
			$SQL_OVERRIDE = true;
		} else {
    		$SQL_workspaces = $SQL_workspaces . '(';
    		foreach ((array) $workspaces as $ws) {
    			$SQL_workspaces = $SQL_workspaces . 'pWBS = "' . $ws . '" OR pWBS LIKE("' . $ws . '.%") OR ';
    		}
    		// Close out our SQL string WHERE clause by trimming off the trailing OR and 
    		// spaces if any.
    		$SQL_workspaces = rtrim($SQL_workspaces, ' OR ') . ')';
    	}
	}
	
	if ($resources) {
		if (strstr(implode($resources), '---- Select All ----') != false) {
			$SQL_resources = '';
			$SQL_OVERRIDE = true;
		} else {
    		foreach ((array) $resources as $rs) {
    			$SQL_resources = $SQL_resources . '"' . $rs . '", ';
    		}
			// Set aside the final comma separated list to use as a stored-procedure argument.
   			$SQL_resources_argument = rtrim($SQL_resources , ', ');

    		// Close out our SQL string WHERE clause by trimming off the trailing comma and 
    		// spaces if any, and adding the necessary SQL constructs.
    		if ($SQL_workspaces) {
    			$SQL_resources = ' AND pRes IN (' . rtrim($SQL_resources , ', ') . ') ';
    		} else {
	    		$SQL_resources = ' pRes IN (' . rtrim($SQL_resources , ', ') . ') ';
	    	}
    	}
	}
	
	if ($startdate) {
		if ($SQL_workspaces || $SQL_resources) {
			$SQL_start = ' AND ';
		}
		$SQL_start = $SQL_start . ' (pStart IS NULL OR str_to_date(pStart, "%m/%d/%Y") >= str_to_date("' . $startdate. '", "%m/%d/%Y")) ';
	}

	if ($enddate) {
		if ($SQL_workspaces || $SQL_resources || $SQL_start) {
			$SQL_end = ' AND ';
		}
		$SQL_end = $SQL_end . ' (pEnd IS NULL OR str_to_date(pEnd, "%m/%d/%Y") <= str_to_date("' . $enddate. '", "%m/%d/%Y")) ';
	}

	if ($complete == false) {
		if ($SQL_workspaces || $SQL_resources || $SQL_start || $SQL_end) {
			$SQL_complete = ' AND ';
		}
		$SQL_complete = $SQL_complete . ' pComp < 100 ';
	}
	
	// Build our SQL statement with the values, or use the default if there are none.
	if ($SQL_workspaces || $SQL_resources || $SQL_start || $SQL_end || $SQL_complete) {
    	if ($SQL_resources_argument != '') {
    		$SQL_WHERE = ' WHERE (' . $SQL_workspaces . $SQL_resources . $SQL_start . $SQL_end . $SQL_complete . ') OR (rowcount IN (SELECT rowcountparents FROM my_rowcountparents) AND pComp < 100) ';	    	
    	} else {
		$SQL_WHERE = ' WHERE ' . $SQL_workspaces . $SQL_resources . $SQL_start . $SQL_end . $SQL_complete;
		}
	}	
	$SQL_STRING = $SQL_SELECT . $SQL_FROM . $SQL_WHERE . $SQL_ORDER;
?>

<!-- Instantiate the form for user selection and refresh -->

<div class="selections">
	<form method="post" action="<?php echo esc_url($_SERVER['PHP_SELF']) ?>">
    	<input name="hidSubmitted" type="hidden" value="true"/>
    	<fieldset name="grpInclude">
    		<legend><strong>Select data to include on Gantt:</strong></legend>
    			<table style="width: 100%">
    				<tr>
    					<td style="width:1561px;" rowspan="9" valign="top">
        					<p class="instructions">All selection criteria are 
                            considered optional, but to view the chart, you must make at least 
                            ONE selection and click &quot;Submit&quot;.&nbsp; Not making a selection in a given field 
                    		will default to all values, eg. all workspaces, resources or dates.&nbsp; 
                            Use CTRL and SHIFT 
                    			keys for multi-select as in any normal Windows 
                            application.</p>
                            <p class="instructions">If no chart appears, you 
                            have not made a selection, your selection criteria 
                            resulted in no records being returned, or you have 
                            bad data, eg. with embedded special characters.&nbsp; 
                            The &quot;View Frame Source&quot; function of Firefox is very 
                            useful for troubleshooting these types of errors.</p>
                            <p class="instructions">Once your chart is 
                            displayed, each task name or bar when 
                            clicked will open a new e-mail message addressed to the task&#39;s 
                            resource with the task name as subject.</p>
                            <p class="instructions">&quot;Task Dates&quot; will select 
                            only tasks occurring within the given range.&nbsp; 
                            &quot;Chart Dates&quot; will modify tasks to fit within the 
                            given range, eg. changing their start and end dates 
                            to improve display.</p>
                            <p class="instructions"><strong>NOTE:</strong>&nbsp; 
                            The Gantt feature is provided by jsGantt.&nbsp; It 
                            is written in JavaScript and runs much faster in Firefox than Internet 
                            Explorer.&nbsp; The formatting in Firefox is also more precise.</p>
                		</td>
    					<td class="rightalign" style="width: 81px; height: 144px;"><div class="sobluelabel">Workspaces:</div></td>
    					<td style="width: 465px; height: 144px;">
    						<select multiple="multiple" size="10" name="selWorkspaces[]" style="width: 250px">
                                <?php
                                
                                	// Query all of the workspaces.
                                	mysql_select_db($database_Feng, $Feng);
                                	$query_RsFeng = "SELECT pName, pWBS FROM my_workspaces";
                                	$RsFeng = mysql_query($query_RsFeng, $Feng) or die(mysql_error());
                                	$row_RsFeng = mysql_fetch_assoc($RsFeng);
                                	$totalRows_RsFeng = mysql_num_rows($RsFeng);
                                
                                	// Write all of the records to the form as options.
									foreach ((array) $workspaces as $ws) { // special case - was 'Select All' selected?
										if ($ws == '---- Select All ----') $sel = " selected='selected'";
									}
                                	echo "<option value='---- Select All ----' $sel>---- Select All ----</option>$crlf";
									$indent = '';
                                	do {
    									$pID = $row_RsFeng['pID'];
                                		$pName = htmlentities($row_RsFeng['pName'], 3, "UTF-8", false); //ENT_NOQUOTES=DEFAULT, ENT_COMPAT=2, ENT_QUOTES=3
										$pWBS = $row_RsFeng['pWBS'];
										$indent = str_repeat('...', substr_count($pWBS, '.'));                                		
                               			// Preserve selection through form submits.
    									$sel = '';
    									foreach ((array) $workspaces as $ws) {
    										if ($pWBS == $ws) $sel = " selected='selected'";
    									}
                               			echo "<option value='" . $pWBS . "'" . $sel . ">" . $indent . $pName . "</option>$crlf";
	                               	} while ($row_RsFeng = mysql_fetch_assoc($RsFeng));

                                	// Clean up the database connection.
                                	mysql_free_result($RsFeng);                         	
                                ?>
    						</select>
    					</td>
    				</tr>
    				<tr>
    					<td class="rightalign" style="width: 81px"><div class="sobluelabel">Resources:</div> </td>
    					<td style="width: 465px"> 
    						<select multiple="multiple" size="5" name="selResources[]" style="width: 250px">
                                <?php
                                
                                	// Query all of the resources.
                                	mysql_select_db($database_Feng, $Feng);
                                	$query_RsFeng = "SELECT display_name as pRes FROM og_users ORDER BY pRes";
                                	$RsFeng = mysql_query($query_RsFeng, $Feng) or die(mysql_error());
                                	$row_RsFeng = mysql_fetch_assoc($RsFeng);
                                	$totalRows_RsFeng = mysql_num_rows($RsFeng);
                                
                                	// Write all of the records to the form as options.
									foreach ((array) $resources as $rs) { // special case - was 'Select All' selected?
										if ($rs == '---- Select All ----') $sel = " selected='selected'";
									}
                                	echo "<option value='---- Select All ----' $sel>---- Select All ----</option>$crlf";
                                	do {
    									$pRes = $row_RsFeng['pRes'];
                                		$pResDisplay = htmlentities($row_RsFeng['pRes'], 3, "UTF-8", false); //ENT_NOQUOTES=DEFAULT, ENT_COMPAT=2, ENT_QUOTES=3
    									if ($pRes <> '') {
                                   			// Preserve selection through form submits.
        									$sel = '';
        									foreach ((array) $resources as $rs) {
        										if ($pRes == $rs) $sel = " selected='selected'";
        									}
	                                		echo '<option value="' . $pRes . '"' . $sel . '>' . $pResDisplay . '</option>' . $crlf;
	                                	}
                                	} while ($row_RsFeng = mysql_fetch_assoc($RsFeng));
                                
                                	// Clean up the database connection.
                                	mysql_free_result($RsFeng);
                                	
                                ?>
    						</select></td>
    				</tr>
    				<tr>
    					<td class="rightalign" style="width: 81px; height: 26px;">
                        <div class="sobluelabel">Task Dates:</div>  </td>
    					<td style="width: 465px; height: 26px;">
    						<input name="pStart" type="text" value="<?php echo (isset($_POST['pStart']) ? $_POST['pStart'] : ''); ?>" style="width: 75px" />
    						<span class="short_instructions">&nbsp;to&nbsp; </span>
    						<input name="pEnd" type="text" value="<?php echo (isset($_POST['pEnd']) ? $_POST['pEnd'] : ''); ?>" style="width: 75px" />
    						<span class="short_instructions"> (mm/dd/yyyy)</span ></td>
    				</tr>
    				<tr>
    					<td class="rightalign" style="width: 81px"><div class="sobluelabel">
                            Chart Dates:</div> </td>
    					<td style="width: 465px">
    						<input name="pStartChart" type="text" value="<?php echo (isset($_POST['pStartChart']) ? $_POST['pStartChart'] : ''); ?>" style="width: 75px" />
    						<span class="short_instructions">&nbsp;to&nbsp; </span>
    						<input name="pEndChart" type="text" value="<?php echo (isset($_POST['pEndChart']) ? $_POST['pEndChart'] : ''); ?>" style="width: 75px" />
    						<span class="short_instructions"> (mm/dd/yyyy)</span ></td>
    				</tr>
    				<tr>
    					<td class="rightalign" style="width: 81px"><div class="sobluelabel">Truncate:</div> </td>
    					<td style="width: 465px">
    						<input name="txtTruncate" type="text" style="width:30px;" value="<?php echo $truncate ?>" />
    						<span class="short_instructions">&nbsp;(shorten long names, 50 is recommended)</span >
    					</td>
    				</tr>
    				<tr>
    					<td class="rightalign" style="width: 81px"><div class="sobluelabel">Color(s):</div> </td>
    					<td style="width: 465px">
    						<input name="chkColor" type="checkbox" <?php if($color) echo 'checked="' . $_POST['chkColor'] . '"' ?> />
    						<span class="short_instructions">&nbsp;(inherit task colors from workspaces)</span >
    					</td>
    				</tr>
    				<tr>
    					<td class="rightalign" style="width: 81px"><div class="sobluelabel">% Complete:</div> </td>
    					<td style="width: 514px">
    						<input name="chkComplete" type="checkbox" <?php if($complete) echo 'checked="' . $_POST['chkComplete'] . '"' ?> /> 
                            <span class="short_instructions">&nbsp;(include tasks&#39; % complete, including 100%)</span >
                        </td>
    				</tr>
    				<tr>
    					<td class="rightalign" style="width: 81px"><div class="sobluelabel">Show:</div></td>
    					<td style="width: 514px">
    						<input name="chkDuration" type="checkbox" <?php if($duration) echo 'checked="' . $_POST['chkDuration'] . '"' ?> /> 
                            <span class="short_instructions">&nbsp;Duration</span >
    						<input name="chkDates" type="checkbox" <?php if($dates) echo 'checked="' . $_POST['chkDates'] . '"' ?> /> 
                            <span class="short_instructions">&nbsp;Dates</span >
    						<input name="chkResource" type="checkbox" <?php if($resource) echo 'checked="' . $_POST['chkResource'] . '"' ?> /> 
                            <span class="short_instructions">&nbsp;Resource</span >
    					</td>
    				</tr>
    				<tr>
    					<td class="rightalign" style="width: 81px"><div class="sobluelabel">
                            Char. Set:</div></td>
    					<td style="width: 514px">
    						<select name="selCharacterSet">    							
                                <?php
    							
									$csKeys = array('ISO-8859-15', 'ISO-8859-1', 'cp1252', 'UTF-8', 'cp866', 'cp1251', 'KOI8-R', 'BIG5', 'GB2312', 'BIG5-HKSCS', 'Shift_JIS', 'EUC-JP');
									$csNames = array('W. Europe, Latin-9','W. Europe, Latin-1','W. Europe (Windows)','ASCII/Unicode','Cyrillic (DOS)','Cyrillic (Win)','Russian','Chinese, Traditional','Chinese, Simplified','Chinese + HK','Japanese - Shift_JIS','Japanese - EUC-JS');
									                                
                                	// Write all of the records to the form as options.
									for ($cs = 0; $cs < 12; $cs++) { 
										$sel = '';
   										if ($csKeys[$cs] == $characterset) $sel = " selected='selected'";
                                		echo '<option value="' . $csKeys[$cs] . '"' . $sel . '>' . $csNames[$cs] . '</option>' . $crlf;
	                                }	
                                ?>
    							
    						</select>
    						<span class="short_instructions">&nbsp;(for task names)</span >
    					</td>
    				</tr>
    				<tr>
    					<td style="height: 35px;" colspan="3">
    						<input name="btnSubmit" type="submit" value="Submit" />
    						<?php
                            	// Basically, if anything was selected, then let's show the print buttons.
                            	if ($SQL_workspaces || $SQL_resources || $SQL_Start || $SQL_End || $SQL_OVERRIDE) {
                            ?><input name="btnPrint" type="button" value="Printer Friendly" onclick="printerFriendly(); return false;"/>
                            <?php
                            	}
                            ?>
                            <input name="btnNewWindow" type="button" value="Do this in a new window" onclick="window.open('#'); return false;"/> 
                            <span style="align:right;float:right;font-size:xx-small;">(Revision: 13.1)</span></td>
    				</tr>
    			</table>
    		</fieldset>
		</form>
	</div>
	<br />
<!-- Put the chart here, but not until something has been selected -->
<?php
	// Output the form so the screen doesn't look retarded if we have more work to do.
	ob_flush();
	flush();

	// If anything was selected, then let's show the chart, otherwise don't.
	if ($SQL_workspaces || $SQL_resources || $SQL_start || $SQL_end || $SQL_OVERRIDE) {
		//echo 'SQL command: ' . $SQL_STRING;
?>
<div style="position:relative" class="gantt" id="GanttChartDIV"></div>
<script type="text/javascript" language='javascript'>

	var g = new JSGantt.GanttChart('g', document.getElementById('GanttChartDIV'), 'week');
	g.setShowRes(<?php echo $resource ?>); // Show/Hide Resource (0/1)
	g.setShowDur(<?php echo $duration ?>); // Show/Hide Duration (0/1)
	g.setShowComp(<?php echo $complete ?>); // Show/Hide % Complete(0/1)
	g.setCaptionType('Resource');  // Set to Show Caption (None,Caption,Resource,Duration,Complete)
	g.setShowStartDate(<?php echo $dates ?>); // Show/Hide Start Date(0/1)
	g.setShowEndDate(<?php echo $dates ?>); // Show/Hide End Date(0/1)
	g.setDateInputFormat('mm/dd/yyyy');  // Set format of input dates ('mm/dd/yyyy', 'dd/mm/yyyy', 'yyyy-mm-dd')
	g.setDateDisplayFormat('mm/dd/yyyy'); // Set format to display dates ('mm/dd/yyyy', 'dd/mm/yyyy', 'yyyy-mm-dd')
	g.setFormatArr("day","week","month","quarter"); // Set format options (up to 4 : "minute","hour","day","week","month","quarter")
	
	if( g ) {

        <?php
			function myTruncate($string, $limit, $pad="...") { 
				// return if $limit = 0 or if string is shorter than $limit  
				if(strlen($string) <= $limit || $limit == 0) {
					return $string;
				} else {
					$string = substr($string, 0, $limit-3) . $pad; 
				} 
				return $string; 
			}
        	
        	mysql_select_db($database_Feng, $Feng);
        	$query_RsFeng = $SQL_STRING;
			// Call stored procedure(s) to populate the table(s) necessary for the chart.
			// Run this one regardless.
        	$RsFeng = mysql_query('CALL get_my_gantt', $Feng) or die(mysql_error());
			// Only run this one if we have resources selected.
			if($SQL_resources_argument != '') {
	        	$RsFeng = mysql_query('CALL get_my_rowcountparents (' . $SQL_resources_argument . ')', $Feng) or die(mysql_error());
			}
        	$RsFeng = mysql_query($query_RsFeng, $Feng) or die(mysql_error());
        	$row_RsFeng = mysql_fetch_assoc($RsFeng);
        	$totalRows_RsFeng = mysql_num_rows($RsFeng);
        
        	$i = 0;
        	do {
        		$pID = $row_RsFeng['pID'];
           		$pName = $row_RsFeng['pName'];
        		$pStart = ($row_RsFeng['pStart'] == '00/00/0000' ? '"' . date('m/d/Y') . '"' : '"' . str_replace('"', '\"', $row_RsFeng['pStart']) . '"');
        		$pEnd = ($row_RsFeng['pEnd'] == '00/00/0000' ? '"' . date('m/d/Y') . '"' : '"' . str_replace('"', '\"', $row_RsFeng['pEnd']) . '"');
        		$pColor = $row_RsFeng['pColor'];
        		$pLink = '""';
        		$pMile = $row_RsFeng['pMile'];
        		$pRes = ($row_RsFeng['pRes'] == '' ? '"None"' : '"' . $row_RsFeng['pRes'] . '"');
				$pEmail = str_replace("'", "\'", $row_RsFeng['pEmail']);
        		$pComp = $row_RsFeng['pComp'];
        		$pGroup = $row_RsFeng['pGroup'];
        		$pParent = ($row_RsFeng['pParent'] == '' ? 0 : $row_RsFeng['pParent']);
        		$pOpen = 1; //$row_RsFeng['pOpen'];
        		$pDepend = '"' . '' . '"';
        		$pCaption = '"' . '' . '"';

				// Set the first row's parent to 0 for now just to get rooted.  Otherwise indentation is broken.
        		$i++;
				$pParent = ($i == 1 ? 0 : $pParent);

				// Truncate the task names if the user asked us to.
				$pName = ($truncate > 0 ? myTruncate($pName, $truncate) : $pName);
				// Make the name printable, even with special characters.  htmlentities() will
				// only pass back a null if it finds an invalid characters, so try to convert
				// the string to valid UTF-8 first, then run it through htmlentities().
				$pName = mb_convert_encoding($pName, 'UTF-8', mb_detect_encoding($pName));				
           		$pName = htmlentities($pName, 3, $characterset, false); //ENT_NOQUOTES=DEFAULT, ENT_COMPAT=2, ENT_QUOTES=3
								
				// Set up the email link for each task while we have the name in the format we want.
				$pLink = ($pEmail == '' ? '""' : '"mailto:' . $pEmail .  '?subject=' . str_replace(" ", "%20", $pName) . '"');
				
				// If the task or whatever is completed, then strike through the name;
				if ($pComp == '100') {
					$pName = '<del>' . $pName . '</del>';
				}

				// Put the name in a double-quote wrapper.
				if ($pGroup) $pName = '<b>' . $pName . '</b>';
				$pName = '"' . $pName . '"';
				
				// Set pStart back to pEnd if it's greater (avoid negative durations).
				$pStart = ($pStart > $pEnd ? $pEnd : $pStart);
				
				// Set the start and end of each task to control chart display, if asked.

				if ($startchart != '""') {
					$pStart = ($pStart < $startchart ? $startchart : $pStart);
				}
				if ($endchart != '""') {
					$pEnd = ($pEnd > $endchart ? $endchart : $pEnd);
				}

				// Use colors if the user asked us to, otherwise set to black.
				if ($color) {
					$pColor = ($pColor > 12 ? $pColor - 12 : $pColor); // get a number between 1 and 12
					switch ($pColor) {
						case 0:
							$pColor = '"' . "cad4e0" . '"';
							break;
						case 1:
							$pColor = '"' . "8996a7" . '"';
							break;
						case 2:
							$pColor = '"' . "659eff" . '"';
							break;
						case 3:
							$pColor = '"' . "2c36cc" . '"';
							break;
						case 4:
							$pColor = '"' . "815ab7" . '"';
							break;
						case 5:
							$pColor = '"' . "ac6b81" . '"';
							break;
						case 6:
							$pColor = '"' . "e4382a" . '"';
							break;
						case 7:
							$pColor = '"' . "e6974a" . '"';
							break;
						case 8:
							$pColor = '"' . "c58234" . '"';
							break;
						case 9:
							$pColor = '"' . "bfaa2b" . '"';
							break;
						case 10:
							$pColor = '"' . "8a914e" . '"';
							break;
						case 11:
							$pColor = '"' . "94bb62" . '"';
							break;
						case 12:
							$pColor = '"' . "378f5f" . '"';
							break;
						default:
							$pColor = '"' . "000000" . '"';
							break;
					}
				} else {
					$pColor = '"' . "000000" . '"';				
				}

				// Do a little magic to make milestones appear as groups and not as milestone
				// symbols on their start date.
				if ($pMile) {
					$pMile = 0;
					//$pGroup = 0; //this causes dates to be NaN/NaN/NaN
				}
				
        		// Write each task to the Gantt chart.
        		echo "	g.AddTaskItem(new JSGantt.TaskItem($pID, $pName, $pStart, $pEnd, $pColor, $pLink, $pMile, $pRes, $pComp, $pGroup, $pParent, $pOpen, $pDepend, $pCaption)); $crlf";
				        
        	} while ($row_RsFeng = mysql_fetch_assoc($RsFeng));
        
        	// Close out the MySQL recordset.
        	mysql_free_result($RsFeng);
        ?>
		g.Draw();
		g.DrawDependencies();
	}
  	else
  	{
		alert('Gantt could not be drawn.');
	}
</script>
<?php 
	}
	//Close down the MySQL connection.
	mysql_close($Feng)
?>
</body>
</html>