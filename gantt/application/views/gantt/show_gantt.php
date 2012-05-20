
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
	g.AddTaskItem(new JSGantt.TaskItem(2,   'Create HTML Shell',    '3/24/2008', '3/25/2008', 'ffff00', 'http://help.com', 0, 'Brian',    20, 0, 0, 1,122));
    g.AddTaskItem(new JSGantt.TaskItem(3,   'Code Javascript',      '',          '',          'ff0000', 'http://help.com', 0, 'Brian',     0, 1, 0, 1));
    g.AddTaskItem(new JSGantt.TaskItem(31,  'Define Variables',     '2/25/2008', '3/17/2008', 'ff00ff', 'http://help.com', 0, 'Brian',    30, 0, 3, 1));
    g.AddTaskItem(new JSGantt.TaskItem(32,  'Calculate Chart Size', '3/15/2008', '3/24/2008', '00ff00', 'http://help.com', 0, 'Shlomy',   40, 0, 3, 1));
    g.AddTaskItem(new JSGantt.TaskItem(33,  'Draw Taks Items',      '',          '',          '00ff00', 'http://help.com', 0, 'Someone',  40, 1, 3, 1));
    g.AddTaskItem(new JSGantt.TaskItem(332, 'Task Label Table',     '3/6/2008',  '3/11/2008', '0000ff', 'http://help.com', 0, 'Brian',    60, 0, 33, 1));
    g.AddTaskItem(new JSGantt.TaskItem(333, 'Task Scrolling Grid',  '3/9/2008',  '3/29/2008', '0000ff', 'http://help.com', 0, 'Brian',    60, 0, 33, 1));
    g.Draw();   
    g.DrawDependencies();
  }
  else
  {
    alert("data not defined");
  }
</script>
