
<!-- 
    sourn wrote
    show gantt view
-->

<link rel="stylesheet" type="text/css" href="plugins/gantt/public/assets/css/jsgantt.css" />
<script language="javascript" src="plugins/gantt/public/assets/javascript/jsgantt.js"></script>
<div style="position:relative" class="gantt" id="GanttChartDIV"></div>

<script>
  var g = new JSGantt.GanttChart('g',document.getElementById('GanttChartDIV'), 'day');
  g.setShowRes(1); // Show/Hide Responsible (0/1)
  g.setShowDur(1); // Show/Hide Duration (0/1)
  g.setShowComp(1); // Show/Hide % Complete(0/1)
  if( g ) {
      g.AddTaskItem(new JSGantt.TaskItem(1,   'Define Chart API',     '',          '',          'ff0000', 'http://help.com', 0, 'Brian',     0, 1, 0, 1));
    g.Draw();   
    g.DrawDependencies();
  }
  else
  {
    alert("data not defined");
  }
</script>