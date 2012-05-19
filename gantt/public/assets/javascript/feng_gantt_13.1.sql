-- feng_gantt_13.1.sql

-- SQL statements to drop and recreate all objects necessary for jsGantt functionality in Feng Office.

-- NOTE: PHPmyAdmin may require you to replace the semicolon (;) at the end of these commands with its
-- own delimiter, the double-dollar sign ($$).

-- If upgrading from an earlier version of feng_gantt, it is recommended that you manually DROP all
-- feng_gantt-related objects first, as some may be orphaned otherwise.  All feng_gantt objects have
-- a name beginning with 'my_', but you may have other applications which *also* have objects with
-- this prefix, so exercise caution as always when DROPping database objects.

-- Search and Replace fengoffice_dev with the name of your database.

-- DROP and CREATE TABLEs

DROP TABLE IF EXISTS my_tblmilestones;
CREATE TABLE `my_tblmilestones` (
  `rowcount` varchar(20) DEFAULT NULL,
  `pID` int(32) DEFAULT NULL,
  `pName` varchar(128) DEFAULT NULL,
  `pStart` date DEFAULT NULL,
  `pEnd` date DEFAULT NULL,
  `pColor` decimal(10,0) DEFAULT NULL,
  `pMile` int(11) DEFAULT NULL,
  `pRes` varchar(32) DEFAULT NULL,
  `pEmail` varchar(32) DEFAULT NULL,
  `pComp` decimal(10,0) DEFAULT NULL,
  `pGroup` int(11) DEFAULT NULL,
  `pParent` varchar(64) DEFAULT NULL,
  `pWBS` varchar(64) DEFAULT NULL,
  `pOrderBy` varchar(256) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS my_tbltasks1;
CREATE TABLE `my_tbltasks1` (
  `rowcount` varchar(128) DEFAULT NULL,
  `pMilestoneID` int(11) DEFAULT NULL,
  `pTaskID` int(11) DEFAULT NULL,
  `pID` int(11) DEFAULT NULL,
  `pName` varchar(128) DEFAULT NULL,
  `pStart` date NOT NULL,
  `pEnd` date NOT NULL DEFAULT '0000-00-00',
  `pColor` decimal(10,0) DEFAULT NULL,
  `pMile` int(11) DEFAULT NULL,
  `pRes` varchar(32) DEFAULT NULL,
  `pEmail` varchar(32) DEFAULT NULL,
  `pComp` decimal(10,0) DEFAULT NULL,
  `pGroup` int(11) DEFAULT NULL,
  `pParent` varchar(64) DEFAULT NULL,
  `pWBS` varchar(64) DEFAULT NULL,
  `pOrderBy` varchar(256) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS my_tbltasks2;
CREATE TABLE `my_tbltasks2` (
  `rowcount` varchar(128) DEFAULT NULL,
  `pID` int(11) DEFAULT NULL,
  `pName` varchar(128) DEFAULT NULL,
  `pStart` date NOT NULL,
  `pEnd` date NOT NULL DEFAULT '0000-00-00',
  `pColor` decimal(10,0) DEFAULT NULL,
  `pMile` int(11) DEFAULT NULL,
  `pRes` varchar(32) DEFAULT NULL,
  `pEmail` varchar(32) DEFAULT NULL,
  `pComp` decimal(10,0) DEFAULT NULL,
  `pGroup` int(11) DEFAULT NULL,
  `pParent` varchar(64) DEFAULT NULL,
  `pWBS` varchar(64) DEFAULT NULL,
  `pOrderBy` varchar(256) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS my_tbltasks3;
CREATE TABLE `my_tbltasks3` (
  `rowcount` varchar(128) DEFAULT NULL,
  `pID` int(11) DEFAULT NULL,
  `pName` varchar(128) DEFAULT NULL,
  `pStart` date NOT NULL,
  `pEnd` date NOT NULL DEFAULT '0000-00-00',
  `pColor` decimal(10,0) DEFAULT NULL,
  `pMile` int(11) DEFAULT NULL,
  `pRes` varchar(32) DEFAULT NULL,
  `pEmail` varchar(32) DEFAULT NULL,
  `pComp` decimal(10,0) DEFAULT NULL,
  `pGroup` int(11) DEFAULT NULL,
  `pParent` varchar(64) DEFAULT NULL,
  `pWBS` varchar(64) DEFAULT NULL,
  `pOrderBy` varchar(256) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS my_tbltasks4;
CREATE TABLE `my_tbltasks4` (
  `rowcount` varchar(128) DEFAULT NULL,
  `pID` int(11) DEFAULT NULL,
  `pName` varchar(128) DEFAULT NULL,
  `pStart` date NOT NULL,
  `pEnd` date NOT NULL DEFAULT '0000-00-00',
  `pColor` decimal(10,0) DEFAULT NULL,
  `pMile` int(11) DEFAULT NULL,
  `pRes` varchar(32) DEFAULT NULL,
  `pEmail` varchar(32) DEFAULT NULL,
  `pComp` decimal(10,0) DEFAULT NULL,
  `pGroup` int(11) DEFAULT NULL,
  `pParent` varchar(64) DEFAULT NULL,
  `pWBS` varchar(64) DEFAULT NULL,
  `pOrderBy` varchar(256) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS my_tbltasks5;
CREATE TABLE `my_tbltasks5` (
  `rowcount` varchar(128) DEFAULT NULL,
  `pID` int(11) DEFAULT NULL,
  `pName` varchar(128) DEFAULT NULL,
  `pStart` date NOT NULL,
  `pEnd` date NOT NULL DEFAULT '0000-00-00',
  `pColor` decimal(10,0) DEFAULT NULL,
  `pMile` int(11) DEFAULT NULL,
  `pRes` varchar(32) DEFAULT NULL,
  `pEmail` varchar(32) DEFAULT NULL,
  `pComp` decimal(10,0) DEFAULT NULL,
  `pGroup` int(11) DEFAULT NULL,
  `pParent` varchar(64) DEFAULT NULL,
  `pWBS` varchar(64) DEFAULT NULL,
  `pOrderBy` varchar(256) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS my_tblworkspaces;
CREATE TABLE `my_tblworkspaces` (
  `rowcount` varchar(20) DEFAULT NULL,
  `pID` int(11) DEFAULT NULL,
  `pName` varchar(64) DEFAULT NULL,
  `pStart` date DEFAULT NULL,
  `pEnd` date DEFAULT NULL,
  `pColor` decimal(10,0) DEFAULT NULL,
  `pMile` int(11) DEFAULT NULL,
  `pRes` varchar(32) DEFAULT NULL,
  `pEmail` varchar(32) DEFAULT NULL,
  `pComp` decimal(10,0) DEFAULT NULL,
  `pGroup` int(11) DEFAULT NULL,
  `pParent` varchar(64) DEFAULT NULL,
  `pWBS` varchar(64) DEFAULT NULL,
  `pOrderBy` varchar(256) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS my_rowcountparents;
CREATE TABLE `my_rowcountparents` (
  `rowcountparents` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- DROP and CREATE FUNCTIONs

DROP FUNCTION IF EXISTS fengoffice_dev.my_getworkspace;
CREATE FUNCTION fengoffice_dev.`my_getworkspace`(s CHAR(20)) RETURNS char(128) CHARSET latin1
RETURN (select pID from my_workspaces where pID=s);

DROP FUNCTION IF EXISTS fengoffice_dev.my_getworkspacerow;
CREATE FUNCTION fengoffice_dev.`my_getworkspacerow`(s CHAR(20)) RETURNS char(128) CHARSET latin1
RETURN (SELECT rowcount FROM my_tblworkspaces WHERE pID=s);

DROP FUNCTION IF EXISTS fengoffice_dev.my_getworkspacepwbs;
CREATE FUNCTION fengoffice_dev.`my_getworkspacepwbs`(s CHAR(20)) RETURNS char(128) CHARSET latin1
RETURN (select pWBS from my_workspaces where pID=s);

DROP FUNCTION IF EXISTS fengoffice_dev.my_getworkspacecolor;
CREATE FUNCTION fengoffice_dev.`my_getworkspacecolor`(s CHAR(20)) RETURNS char(128) CHARSET latin1
RETURN (select pColor from my_workspaces where pID=s);

DROP FUNCTION IF EXISTS fengoffice_dev.my_getworkspacename;
CREATE FUNCTION fengoffice_dev.`my_getworkspacename`(s CHAR(20)) RETURNS char(128) CHARSET latin1
RETURN (SELECT name FROM og_projects WHERE id=s);

DROP FUNCTION IF EXISTS fengoffice_dev.my_gettaskworkspacerow;
CREATE FUNCTION fengoffice_dev.`my_gettaskworkspacerow`(s CHAR(20)) RETURNS char(128) CHARSET latin1
RETURN (SELECT CONCAT(rowcount, '.99999') FROM my_tblworkspaces WHERE pID=s);

DROP FUNCTION IF EXISTS fengoffice_dev.my_gettask4row;
CREATE FUNCTION fengoffice_dev.`my_gettask4row`(s CHAR(20)) RETURNS char(128) CHARSET latin1
RETURN (SELECT rowcount FROM my_tbltasks4 WHERE pID=concat('77777', s));

DROP FUNCTION IF EXISTS fengoffice_dev.my_gettask3row;
CREATE FUNCTION fengoffice_dev.`my_gettask3row`(s CHAR(20)) RETURNS char(128) CHARSET latin1
RETURN (SELECT rowcount FROM my_tbltasks3 WHERE pID=concat('77777', s));

DROP FUNCTION IF EXISTS fengoffice_dev.my_gettask2row;
CREATE FUNCTION fengoffice_dev.`my_gettask2row`(s CHAR(20)) RETURNS char(128) CHARSET latin1
RETURN (SELECT rowcount FROM my_tbltasks2 WHERE pID=concat('77777', s));

DROP FUNCTION IF EXISTS fengoffice_dev.my_gettask1row;
CREATE FUNCTION fengoffice_dev.`my_gettask1row`(s CHAR(20)) RETURNS char(128) CHARSET latin1
RETURN (SELECT rowcount FROM my_tbltasks1 WHERE pID=concat('77777', s));

DROP FUNCTION IF EXISTS fengoffice_dev.my_getmilestonerow;
CREATE FUNCTION fengoffice_dev.`my_getmilestonerow`(s CHAR(20)) RETURNS char(128) CHARSET latin1
RETURN (SELECT rowcount FROM my_tblmilestones WHERE pID=s);

DROP FUNCTION IF EXISTS fengoffice_dev.my_getmilestonecolor;
CREATE FUNCTION fengoffice_dev.`my_getmilestonecolor`(s CHAR(20)) RETURNS char(128) CHARSET latin1
RETURN (SELECT pColor FROM my_milestones WHERE pID=s);

DROP FUNCTION IF EXISTS fengoffice_dev.my_getmilestone;
CREATE FUNCTION fengoffice_dev.`my_getmilestone`(s CHAR(20)) RETURNS char(50) CHARSET latin1
RETURN (SELECT pWBS FROM my_milestones WHERE pID=CONCAT(55555,s));

DROP FUNCTION IF EXISTS fengoffice_dev.my_get0taskworkspaceid;
CREATE FUNCTION fengoffice_dev.`my_get0taskworkspaceid`(s CHAR(20)) RETURNS char(50) CHARSET latin1
RETURN (select workspace_id from og_workspace_objects where object_manager='ProjectTasks' and object_id = s);

-- DROP and CREATE VIEWs

DROP VIEW IF EXISTS my_jsgantt;
CREATE VIEW `my_jsgantt` AS select `my_tblworkspaces`.`rowcount` AS `rowcount`,`my_tblworkspaces`.`pID` AS `pID`,`my_tblworkspaces`.`pName` AS `pName`,date_format(`my_tblworkspaces`.`pStart`,'%m/%d/%Y') AS `pStart`,date_format(`my_tblworkspaces`.`pEnd`,'%m/%d/%Y') AS `pEnd`,`my_tblworkspaces`.`pColor` AS `pColor`,`my_tblworkspaces`.`pMile` AS `pMile`,`my_tblworkspaces`.`pRes` AS `pRes`,`my_tblworkspaces`.`pEmail` AS `pEmail`,`my_tblworkspaces`.`pComp` AS `pComp`,`my_tblworkspaces`.`pGroup` AS `pGroup`,`my_tblworkspaces`.`pParent` AS `pParent`,`my_tblworkspaces`.`pWBS` AS `pWBS`,`my_tblworkspaces`.`pOrderBy` AS `pOrderBy` from `my_tblworkspaces` union all select `my_tblmilestones`.`rowcount` AS `rowcount`,`my_tblmilestones`.`pID` AS `pID`,`my_tblmilestones`.`pName` AS `pName`,date_format(`my_tblmilestones`.`pStart`,'%m/%d/%Y') AS `pStart`,date_format(`my_tblmilestones`.`pEnd`,'%m/%d/%Y') AS `pEnd`,`my_tblmilestones`.`pColor` AS `pColor`,`my_tblmilestones`.`pMile` AS `pMile`,`my_tblmilestones`.`pRes` AS `pRes`,`my_tblmilestones`.`pEmail` AS `pEmail`,`my_tblmilestones`.`pComp` AS `pComp`,`my_tblmilestones`.`pGroup` AS `pGroup`,`my_tblmilestones`.`pParent` AS `pParent`,`my_tblmilestones`.`pWBS` AS `pWBS`,`my_tblmilestones`.`pOrderBy` AS `pOrderBy` from `my_tblmilestones` union all select `my_tbltasks1`.`rowcount` AS `rowcount`,`my_tbltasks1`.`pID` AS `pID`,`my_tbltasks1`.`pName` AS `pName`,date_format(`my_tbltasks1`.`pStart`,'%m/%d/%Y') AS `pStart`,date_format(`my_tbltasks1`.`pEnd`,'%m/%d/%Y') AS `pEnd`,`my_tbltasks1`.`pColor` AS `pColor`,`my_tbltasks1`.`pMile` AS `pMile`,`my_tbltasks1`.`pRes` AS `pRes`,`my_tbltasks1`.`pEmail` AS `pEmail`,`my_tbltasks1`.`pComp` AS `pComp`,`my_tbltasks1`.`pGroup` AS `pGroup`,`my_tbltasks1`.`pParent` AS `pParent`,`my_tbltasks1`.`pWBS` AS `pWBS`,`my_tbltasks1`.`pOrderBy` AS `pOrderBy` from `my_tbltasks1` union all select `my_tbltasks2`.`rowcount` AS `rowcount`,`my_tbltasks2`.`pID` AS `pID`,`my_tbltasks2`.`pName` AS `pName`,date_format(`my_tbltasks2`.`pStart`,'%m/%d/%Y') AS `pStart`,date_format(`my_tbltasks2`.`pEnd`,'%m/%d/%Y') AS `pEnd`,`my_tbltasks2`.`pColor` AS `pColor`,`my_tbltasks2`.`pMile` AS `pMile`,`my_tbltasks2`.`pRes` AS `pRes`,`my_tbltasks2`.`pEmail` AS `pEmail`,`my_tbltasks2`.`pComp` AS `pComp`,`my_tbltasks2`.`pGroup` AS `pGroup`,`my_tbltasks2`.`pParent` AS `pParent`,`my_tbltasks2`.`pWBS` AS `pWBS`,`my_tbltasks2`.`pOrderBy` AS `pOrderBy` from `my_tbltasks2` union all select `my_tbltasks3`.`rowcount` AS `rowcount`,`my_tbltasks3`.`pID` AS `pID`,`my_tbltasks3`.`pName` AS `pName`,date_format(`my_tbltasks3`.`pStart`,'%m/%d/%Y') AS `pStart`,date_format(`my_tbltasks3`.`pEnd`,'%m/%d/%Y') AS `pEnd`,`my_tbltasks3`.`pColor` AS `pColor`,`my_tbltasks3`.`pMile` AS `pMile`,`my_tbltasks3`.`pRes` AS `pRes`,`my_tbltasks3`.`pEmail` AS `pEmail`,`my_tbltasks3`.`pComp` AS `pComp`,`my_tbltasks3`.`pGroup` AS `pGroup`,`my_tbltasks3`.`pParent` AS `pParent`,`my_tbltasks3`.`pWBS` AS `pWBS`,`my_tbltasks3`.`pOrderBy` AS `pOrderBy` from `my_tbltasks3` union all select `my_tbltasks4`.`rowcount` AS `rowcount`,`my_tbltasks4`.`pID` AS `pID`,`my_tbltasks4`.`pName` AS `pName`,date_format(`my_tbltasks4`.`pStart`,'%m/%d/%Y') AS `pStart`,date_format(`my_tbltasks4`.`pEnd`,'%m/%d/%Y') AS `pEnd`,`my_tbltasks4`.`pColor` AS `pColor`,`my_tbltasks4`.`pMile` AS `pMile`,`my_tbltasks4`.`pRes` AS `pRes`,`my_tbltasks4`.`pEmail` AS `pEmail`,`my_tbltasks4`.`pComp` AS `pComp`,`my_tbltasks4`.`pGroup` AS `pGroup`,`my_tbltasks4`.`pParent` AS `pParent`,`my_tbltasks4`.`pWBS` AS `pWBS`,`my_tbltasks4`.`pOrderBy` AS `pOrderBy` from `my_tbltasks4` union all select `my_tbltasks5`.`rowcount` AS `rowcount`,`my_tbltasks5`.`pID` AS `pID`,`my_tbltasks5`.`pName` AS `pName`,date_format(`my_tbltasks5`.`pStart`,'%m/%d/%Y') AS `pStart`,date_format(`my_tbltasks5`.`pEnd`,'%m/%d/%Y') AS `pEnd`,`my_tbltasks5`.`pColor` AS `pColor`,`my_tbltasks5`.`pMile` AS `pMile`,`my_tbltasks5`.`pRes` AS `pRes`,`my_tbltasks5`.`pEmail` AS `pEmail`,`my_tbltasks5`.`pComp` AS `pComp`,`my_tbltasks5`.`pGroup` AS `pGroup`,`my_tbltasks5`.`pParent` AS `pParent`,`my_tbltasks5`.`pWBS` AS `pWBS`,`my_tbltasks5`.`pOrderBy` AS `pOrderBy` from `my_tbltasks5`;

DROP VIEW IF EXISTS my_workspaces;
CREATE VIEW `my_workspaces` AS select `fengoffice_dev`.`og_projects`.`id` AS `pID`,replace(`fengoffice_dev`.`og_projects`.`name`,'&','and') AS `pName`,NULL AS `pStart`,NULL AS `pEnd`,`fengoffice_dev`.`og_projects`.`color` AS `pColor`,0 AS `pMile`,NULL AS `pRes`,NULL AS `pEmail`,'0' AS `pComp`,1 AS `pGroup`,(case `fengoffice_dev`.`og_projects`.`id` when `fengoffice_dev`.`og_projects`.`p1` then 0 when `fengoffice_dev`.`og_projects`.`p2` then `fengoffice_dev`.`og_projects`.`p1` when `fengoffice_dev`.`og_projects`.`p3` then `fengoffice_dev`.`og_projects`.`p2` when `fengoffice_dev`.`og_projects`.`p4` then `fengoffice_dev`.`og_projects`.`p3` when `fengoffice_dev`.`og_projects`.`p5` then `fengoffice_dev`.`og_projects`.`p4` when `fengoffice_dev`.`og_projects`.`p6` then `fengoffice_dev`.`og_projects`.`p5` when `fengoffice_dev`.`og_projects`.`p7` then `fengoffice_dev`.`og_projects`.`p6` when `fengoffice_dev`.`og_projects`.`p8` then `fengoffice_dev`.`og_projects`.`p7` when `fengoffice_dev`.`og_projects`.`p9` then `fengoffice_dev`.`og_projects`.`p8` end) AS `pParent`,(case `fengoffice_dev`.`og_projects`.`p2` when 0 then `fengoffice_dev`.`og_projects`.`p1` else (case `fengoffice_dev`.`og_projects`.`p3` when 0 then concat(`fengoffice_dev`.`og_projects`.`p1`,'.',`fengoffice_dev`.`og_projects`.`p2`) else (case `fengoffice_dev`.`og_projects`.`p4` when 0 then concat(`fengoffice_dev`.`og_projects`.`p1`,'.',`fengoffice_dev`.`og_projects`.`p2`,'.',`fengoffice_dev`.`og_projects`.`p3`) else (case `fengoffice_dev`.`og_projects`.`p5` when 0 then concat(`fengoffice_dev`.`og_projects`.`p1`,'.',`fengoffice_dev`.`og_projects`.`p2`,'.',`fengoffice_dev`.`og_projects`.`p3`,'.',`fengoffice_dev`.`og_projects`.`p4`) else (case `fengoffice_dev`.`og_projects`.`p6` when 0 then concat(`fengoffice_dev`.`og_projects`.`p1`,'.',`fengoffice_dev`.`og_projects`.`p2`,'.',`fengoffice_dev`.`og_projects`.`p3`,'.',`fengoffice_dev`.`og_projects`.`p4`,'.',`fengoffice_dev`.`og_projects`.`p5`) else (case `fengoffice_dev`.`og_projects`.`p7` when 0 then concat(`fengoffice_dev`.`og_projects`.`p1`,'.',`fengoffice_dev`.`og_projects`.`p2`,'.',`fengoffice_dev`.`og_projects`.`p3`,'.',`fengoffice_dev`.`og_projects`.`p4`,'.',`fengoffice_dev`.`og_projects`.`p5`,'.',`fengoffice_dev`.`og_projects`.`p6`) else (case `fengoffice_dev`.`og_projects`.`p8` when 0 then concat(`fengoffice_dev`.`og_projects`.`p1`,'.',`fengoffice_dev`.`og_projects`.`p2`,'.',`fengoffice_dev`.`og_projects`.`p3`,'.',`fengoffice_dev`.`og_projects`.`p4`,'.',`fengoffice_dev`.`og_projects`.`p5`,'.',`fengoffice_dev`.`og_projects`.`p6`,'.',`fengoffice_dev`.`og_projects`.`p7`) else (case `fengoffice_dev`.`og_projects`.`p9` when 0 then concat(`fengoffice_dev`.`og_projects`.`p1`,'.',`fengoffice_dev`.`og_projects`.`p2`,'.',`fengoffice_dev`.`og_projects`.`p3`,'.',`fengoffice_dev`.`og_projects`.`p4`,'.',`fengoffice_dev`.`og_projects`.`p5`,'.',`fengoffice_dev`.`og_projects`.`p6`,'.',`fengoffice_dev`.`og_projects`.`p7`,'.',`fengoffice_dev`.`og_projects`.`p8`) else (case `fengoffice_dev`.`og_projects`.`p10` when 0 then concat(`fengoffice_dev`.`og_projects`.`p1`,'.',`fengoffice_dev`.`og_projects`.`p2`,'.',`fengoffice_dev`.`og_projects`.`p3`,'.',`fengoffice_dev`.`og_projects`.`p4`,'.',`fengoffice_dev`.`og_projects`.`p5`,'.',`fengoffice_dev`.`og_projects`.`p6`,'.',`fengoffice_dev`.`og_projects`.`p7`,'.',`fengoffice_dev`.`og_projects`.`p8`,'.',`fengoffice_dev`.`og_projects`.`p9`) else concat(`fengoffice_dev`.`og_projects`.`p1`,'.',`fengoffice_dev`.`og_projects`.`p2`,'.',`fengoffice_dev`.`og_projects`.`p3`,'.',`fengoffice_dev`.`og_projects`.`p4`,'.',`fengoffice_dev`.`og_projects`.`p5`,'.',`fengoffice_dev`.`og_projects`.`p6`,'.',`fengoffice_dev`.`og_projects`.`p7`,'.',`fengoffice_dev`.`og_projects`.`p8`,'.',`fengoffice_dev`.`og_projects`.`p9`,'.',`fengoffice_dev`.`og_projects`.`p10`) end) end) end) end) end) end) end) end) end) AS `pWBS`,concat(ifnull(`my_getworkspacename`(`fengoffice_dev`.`og_projects`.`p1`),'0'),ifnull(`my_getworkspacename`(`fengoffice_dev`.`og_projects`.`p2`),'0'),ifnull(`my_getworkspacename`(`fengoffice_dev`.`og_projects`.`p3`),'0'),ifnull(`my_getworkspacename`(`fengoffice_dev`.`og_projects`.`p4`),'0'),ifnull(`my_getworkspacename`(`fengoffice_dev`.`og_projects`.`p5`),'0'),ifnull(`my_getworkspacename`(`fengoffice_dev`.`og_projects`.`p6`),'0'),ifnull(`my_getworkspacename`(`fengoffice_dev`.`og_projects`.`p7`),'0'),ifnull(`my_getworkspacename`(`fengoffice_dev`.`og_projects`.`p8`),'0'),ifnull(`my_getworkspacename`(`fengoffice_dev`.`og_projects`.`p9`),'0'),ifnull(`my_getworkspacename`(`fengoffice_dev`.`og_projects`.`p10`),'0')) AS `pOrderBy` from `fengoffice_dev`.`og_projects` where ((not(`fengoffice_dev`.`og_projects`.`id` in (select `fengoffice_dev`.`og_users`.`personal_project_id` AS `personal_project_id` from `fengoffice_dev`.`og_users`))) and (not(`fengoffice_dev`.`og_projects`.`p1` in (select `fengoffice_dev`.`og_users`.`personal_project_id` AS `personal_project_id` from `fengoffice_dev`.`og_users`)))) order by concat(ifnull(`my_getworkspacename`(`fengoffice_dev`.`og_projects`.`p1`),'0'),ifnull(`my_getworkspacename`(`fengoffice_dev`.`og_projects`.`p2`),'0'),ifnull(`my_getworkspacename`(`fengoffice_dev`.`og_projects`.`p3`),'0'),ifnull(`my_getworkspacename`(`fengoffice_dev`.`og_projects`.`p4`),'0'),ifnull(`my_getworkspacename`(`fengoffice_dev`.`og_projects`.`p5`),'0'),ifnull(`my_getworkspacename`(`fengoffice_dev`.`og_projects`.`p6`),'0'),ifnull(`my_getworkspacename`(`fengoffice_dev`.`og_projects`.`p7`),'0'),ifnull(`my_getworkspacename`(`fengoffice_dev`.`og_projects`.`p8`),'0'),ifnull(`my_getworkspacename`(`fengoffice_dev`.`og_projects`.`p9`),'0'),ifnull(`my_getworkspacename`(`fengoffice_dev`.`og_projects`.`p10`),'0'));

DROP VIEW IF EXISTS my_milestonestoworkspaces;
CREATE VIEW `my_milestonestoworkspaces` AS select `og_workspace_objects`.`workspace_id` AS `workspace_id`,`og_workspace_objects`.`object_manager` AS `object_manager`,`og_workspace_objects`.`object_id` AS `object_id` from `og_workspace_objects` where (`og_workspace_objects`.`object_manager` = 'ProjectMilestones');

DROP VIEW IF EXISTS my_milestones;
CREATE VIEW `my_milestones` AS select cast(concat(55555,`og_project_milestones`.`id`) as char(16) charset utf8) AS `pID`,replace(`og_project_milestones`.`name`,'&','and') AS `pName`,NULL AS `pStart`,`og_project_milestones`.`due_date` AS `pEnd`,`my_workspaces`.`pColor` AS `pColor`,1 AS `pMile`,`og_users`.`username` AS `pRes`,`og_users`.`email` AS `pEmail`,(case `og_project_milestones`.`completed_by_id` when 1 then 100 else 0 end) AS `pComp`,1 AS `pGroup`,`my_workspaces`.`pID` AS `pParent`,concat(`my_workspaces`.`pWBS`,'.',`my_milestonestoworkspaces`.`object_id`) AS `pWBS`,`my_workspaces`.`pOrderBy` AS `pOrderBy` from (((`my_workspaces` join `my_milestonestoworkspaces` on((`my_workspaces`.`pID` = `my_milestonestoworkspaces`.`workspace_id`))) join `og_project_milestones` on((`my_milestonestoworkspaces`.`object_id` = `og_project_milestones`.`id`))) left join `og_users` on(((`og_project_milestones`.`assigned_to_user_id` = `og_users`.`id`) and (`og_project_milestones`.`assigned_to_company_id` = `og_users`.`company_id`)))) where ((not(`my_workspaces`.`pID` in (select `og_users`.`personal_project_id` AS `personal_project_id` from `og_users`))) and isnull(`og_project_milestones`.`trashed_on`));

-- DROP and CREATE PROCEDUREs

DROP PROCEDURE IF EXISTS fengoffice_dev.get_my_workspaces;
CREATE PROCEDURE fengoffice_dev.`get_my_workspaces`()
BEGIN

DELETE FROM my_tblworkspaces;

INSERT INTO my_tblworkspaces

 SELECT CONCAT('9', LPAD(@rowcount:=@rowcount+1, 4, '0')) AS rowcount, subSelect.*
  FROM (SELECT `og_projects`.`id` AS `pID`,
               replace(`og_projects`.`name`, '&', 'and') AS `pName`,
               NULL AS `pStart`,
               NULL AS `pEnd`,
               `og_projects`.`color` AS `pColor`,
               0 AS `pMile`,
               NULL AS `pRes`,
               NULL AS `pEmail`,
               '0' AS `pComp`,
               1 AS `pGroup`,
               (CASE `og_projects`.`id`
                   WHEN `og_projects`.`p1` THEN 0
                   WHEN `og_projects`.`p2` THEN `og_projects`.`p1`
                   WHEN `og_projects`.`p3` THEN `og_projects`.`p2`
                   WHEN `og_projects`.`p4` THEN `og_projects`.`p3`
                   WHEN `og_projects`.`p5` THEN `og_projects`.`p4`
                   WHEN `og_projects`.`p6` THEN `og_projects`.`p5`
                   WHEN `og_projects`.`p7` THEN `og_projects`.`p6`
                   WHEN `og_projects`.`p8` THEN `og_projects`.`p7`
                   WHEN `og_projects`.`p9` THEN `og_projects`.`p8`
                END)
                  AS `pParent`,
               (CASE `og_projects`.`p2`
                   WHEN 0
                   THEN
                      `og_projects`.`p1`
                   ELSE
                      (CASE `og_projects`.`p3`
                          WHEN 0
                          THEN
                             concat(`og_projects`.`p1`,
                                    '.',
                                    `og_projects`.`p2`)
                          ELSE
                             (CASE `og_projects`.`p4`
                                 WHEN 0
                                 THEN
                                    concat(`og_projects`.`p1`,
                                           '.',
                                           `og_projects`.`p2`,
                                           '.',
                                           `og_projects`.`p3`)
                                 ELSE
                                    (CASE `og_projects`.`p5`
                                        WHEN 0
                                        THEN
                                           concat(`og_projects`.`p1`,
                                                  '.',
                                                  `og_projects`.`p2`,
                                                  '.',
                                                  `og_projects`.`p3`,
                                                  '.',
                                                  `og_projects`.`p4`)
                                        ELSE
                                           (CASE `og_projects`.`p6`
                                               WHEN 0
                                               THEN
                                                  concat(`og_projects`.`p1`,
                                                         '.',
                                                         `og_projects`.`p2`,
                                                         '.',
                                                         `og_projects`.`p3`,
                                                         '.',
                                                         `og_projects`.`p4`,
                                                         '.',
                                                         `og_projects`.`p5`)
                                               ELSE
                                                  (CASE `og_projects`.`p7`
                                                      WHEN 0
                                                      THEN
                                                         concat(
                                                            `og_projects`.
                                                            `p1`,
                                                            '.',
                                                            `og_projects`.
                                                            `p2`,
                                                            '.',
                                                            `og_projects`.
                                                            `p3`,
                                                            '.',
                                                            `og_projects`.
                                                            `p4`,
                                                            '.',
                                                            `og_projects`.
                                                            `p5`,
                                                            '.',
                                                            `og_projects`.
                                                            `p6`)
                                                      ELSE
                                                         (CASE `og_projects`.
                                                               `p8`
                                                             WHEN 0
                                                             THEN
                                                                concat(
                                                                   `og_projects`.
                                                                   `p1`,
                                                                   '.',
                                                                   `og_projects`.
                                                                   `p2`,
                                                                   '.',
                                                                   `og_projects`.
                                                                   `p3`,
                                                                   '.',
                                                                   `og_projects`.
                                                                   `p4`,
                                                                   '.',
                                                                   `og_projects`.
                                                                   `p5`,
                                                                   '.',
                                                                   `og_projects`.
                                                                   `p6`,
                                                                   '.',
                                                                   `og_projects`.
                                                                   `p7`)
                                                             ELSE
                                                                (CASE `og_projects`.
                                                                      `p9`
                                                                    WHEN 0
                                                                    THEN
                                                                       concat(
                                                                          `og_projects`.
                                                                          `p1`,
                                                                          '.',
                                                                          `og_projects`.
                                                                          `p2`,
                                                                          '.',
                                                                          `og_projects`.
                                                                          `p3`,
                                                                          '.',
                                                                          `og_projects`.
                                                                          `p4`,
                                                                          '.',
                                                                          `og_projects`.
                                                                          `p5`,
                                                                          '.',
                                                                          `og_projects`.
                                                                          `p6`,
                                                                          '.',
                                                                          `og_projects`.
                                                                          `p7`,
                                                                          '.',
                                                                          `og_projects`.
                                                                          `p8`)
                                                                    ELSE
                                                                       (CASE `og_projects`.
                                                                             `p10`
                                                                           WHEN 0
                                                                           THEN
                                                                              concat(
                                                                                 `og_projects`.
                                                                                 `p1`,
                                                                                 '.',
                                                                                 `og_projects`.
                                                                                 `p2`,
                                                                                 '.',
                                                                                 `og_projects`.
                                                                                 `p3`,
                                                                                 '.',
                                                                                 `og_projects`.
                                                                                 `p4`,
                                                                                 '.',
                                                                                 `og_projects`.
                                                                                 `p5`,
                                                                                 '.',
                                                                                 `og_projects`.
                                                                                 `p6`,
                                                                                 '.',
                                                                                 `og_projects`.
                                                                                 `p7`,
                                                                                 '.',
                                                                                 `og_projects`.
                                                                                 `p8`,
                                                                                 '.',
                                                                                 `og_projects`.
                                                                                 `p9`)
                                                                           ELSE
                                                                              concat(
                                                                                 `og_projects`.
                                                                                 `p1`,
                                                                                 '.',
                                                                                 `og_projects`.
                                                                                 `p2`,
                                                                                 '.',
                                                                                 `og_projects`.
                                                                                 `p3`,
                                                                                 '.',
                                                                                 `og_projects`.
                                                                                 `p4`,
                                                                                 '.',
                                                                                 `og_projects`.
                                                                                 `p5`,
                                                                                 '.',
                                                                                 `og_projects`.
                                                                                 `p6`,
                                                                                 '.',
                                                                                 `og_projects`.
                                                                                 `p7`,
                                                                                 '.',
                                                                                 `og_projects`.
                                                                                 `p8`,
                                                                                 '.',
                                                                                 `og_projects`.
                                                                                 `p9`,
                                                                                 '.',
                                                                                 `og_projects`.
                                                                                 `p10`)
                                                                        END)
                                                                 END)
                                                          END)
                                                   END)
                                            END)
                                     END)
                              END)
                       END)
                END)
                  AS `pWBS`,
               concat(
                  ifnull(`my_getworkspacename`(`og_projects`.`p1`), '0'),
                  ifnull(`my_getworkspacename`(`og_projects`.`p2`), '0'),
                  ifnull(`my_getworkspacename`(`og_projects`.`p3`), '0'),
                  ifnull(`my_getworkspacename`(`og_projects`.`p4`), '0'),
                  ifnull(`my_getworkspacename`(`og_projects`.`p5`), '0'),
                  ifnull(`my_getworkspacename`(`og_projects`.`p6`), '0'),
                  ifnull(`my_getworkspacename`(`og_projects`.`p7`), '0'),
                  ifnull(`my_getworkspacename`(`og_projects`.`p8`), '0'),
                  ifnull(`my_getworkspacename`(`og_projects`.`p9`), '0'),
                  ifnull(`my_getworkspacename`(`og_projects`.`p10`), '0'))
                  AS `pOrderBy`
          FROM (SELECT @rowcount := 0) AS rowcountinit, `og_projects`
         WHERE ((NOT (`og_projects`.`id` IN
                         (SELECT `og_users`.`personal_project_id`
                                    AS `personal_project_id`
                            FROM `og_users`)))
                AND (NOT (`og_projects`.`p1` IN
                             (SELECT `og_users`.`personal_project_id`
                                        AS `personal_project_id`
                                FROM `og_users`))))
        ORDER BY pOrderBy, pWBS) AS subSelect, (SELECT @rowcount:=0) AS rowcountinit;

END;


DROP PROCEDURE IF EXISTS fengoffice_dev.get_my_rowcountparents;
CREATE PROCEDURE fengoffice_dev.`get_my_rowcountparents`(User VARCHAR(128))
BEGIN

  DECLARE strRowCount INT;
  
  SET strRowCount = (select Max((char_length(rowcount)+1)/6) as parent from my_jsgantt where pRes IN(User));
  
  Delete from my_rowcountparents;  
    
  WHILE strRowCount > 0 DO
  
    INSERT INTO my_rowcountparents (rowcountparents) 
    SELECT distinct left(rowcount, ((strRowCount-1)*6)-1) from my_jsgantt where pRes IN (User) and char_length(rowcount)<(6*(strRowCount+2))-1;
  
    SET strRowCount = strRowCount -1;
 
  END WHILE;
  
  UPDATE my_tblworkspaces set pParent=0 where char_length(rowcount)=5 and rowcount IN(select rowcountparents from my_rowcountparents);
  

END;



DROP PROCEDURE IF EXISTS fengoffice_dev.get_my_tasks1;
CREATE PROCEDURE fengoffice_dev.`get_my_tasks1`()
BEGIN

DELETE FROM my_tbltasks1;

INSERT INTO my_tbltasks1

SELECT CONCAT(

ifnull(my_getmilestonerow(concat('55555',subSelect.milestone_id)),
my_gettaskworkspacerow(my_get0taskworkspaceid(subSelect.pTaskID)))

, '.', '0', 
LPAD(@rowcount:=@rowcount+1, 4, '0')) 

AS rowcount,

subSelect.pMilestoneID,
subSelect.pTaskID,

subSelect.pID, subSelect.pName, subSelect.pStart, subSelect.pEnd, subSelect.pColor,
subSelect.pMile, subSelect.pRes, subSelect.pEmail, subSelect.pComp, subSelect.pGroup,
subSelect.pParent, subSelect.pWBS, subSelect.pOrderBy
FROM(

select og_project_tasks.milestone_id as pMilestoneID,
og_project_tasks.id as pTaskID, 
cast(concat(77777,`og_project_tasks`.`id`) as char(16) charset utf8) AS `pID`,
replace(`og_project_tasks`.`title`,'&','and') AS `pName`,
`og_project_tasks`.`start_date` AS `pStart`,
`og_project_tasks`.`due_date` AS `pEnd`,


case og_project_tasks.milestone_id
when 0 
then my_getworkspacecolor(my_get0taskworkspaceid(og_project_tasks.id))
else
my_getmilestonecolor(concat(55555,`og_project_tasks`.`milestone_id`)) 
end 
as pColor,


0 AS `pMile`,
`og_users`.`username` AS `pRes`,
`og_users`.`email` AS `pEmail`,
(case `og_project_tasks`.`completed_by_id` when 0 then 0 else 100 end) AS `pComp`,

if(`og_project_tasks`.`id` in (select `og_project_tasks`.`parent_id` AS `id` 
from `og_project_tasks`),1,0) AS `pGroup`,



case (og_project_tasks.parent_id + og_project_tasks.milestone_id) when 0
then ifnull(my_getmilestonerow(concat('55555',og_project_tasks.milestone_id)),
my_getworkspace(my_get0taskworkspaceid(og_project_tasks.id))) 
else 
(case `og_project_tasks`.`parent_id` when 0 
then cast(concat(55555,`og_project_tasks`.`milestone_id`) as char(16) charset utf8) 
else cast(concat(77777,`og_project_tasks`.`parent_id`) as char(16) charset utf8) end)

end AS `pParent`,



ifnull(my_getmilestone(og_project_tasks.milestone_id), 
CONCAT(my_getworkspacepwbs(my_Get0TaskWorkspaceId(og_project_tasks.id)),'.',og_project_tasks.id)) as pWBS, 

'Unknown' AS `pOrderBy`,
milestone_id

from (`og_project_tasks` 
left join `og_users` 
on((`og_project_tasks`.`assigned_to_user_id` = `og_users`.`id`))) 

where isnull(`og_project_tasks`.`trashed_on`) 

and parent_id=0
order by `og_project_tasks`.`start_date`, `og_project_tasks`.`due_date`, og_project_tasks.title

) AS subSelect, (SELECT @rowcount:=0) AS rowcountinit 
where 
ifnull(my_getmilestonerow(concat('55555',subSelect.milestone_id)),
my_getworkspacerow(my_get0taskworkspaceid(subSelect.pTaskID))) is not null;

END;


DROP PROCEDURE IF EXISTS fengoffice_dev.get_my_tasks2;
CREATE PROCEDURE fengoffice_dev.`get_my_tasks2`()
BEGIN

DELETE FROM my_tbltasks2;

INSERT INTO my_tbltasks2

SELECT CONCAT(ParentRowCount, '.', '0', LPAD(@rowcount:=@rowcount+1, 4, '0')) AS rowcount, 
subSelect.pID, subSelect.pName, subSelect.pStart, subSelect.pEnd, subSelect.pColor,
subSelect.pMile, subSelect.pRes, subSelect.pEmail, subSelect.pComp, subSelect.pGroup,
subSelect.pParent, subSelect.pWBS, subSelect.pOrderBy
FROM(

select my_gettask1row(og_project_tasks.parent_id) AS ParentRowCount, 
cast(concat(77777,`og_project_tasks`.`id`) as char(16) charset utf8) AS `pID`,
replace(`og_project_tasks`.`title`,'&','and') AS `pName`,
`og_project_tasks`.`start_date` AS `pStart`,
`og_project_tasks`.`due_date` AS `pEnd`,

my_getmilestonecolor(concat(55555,`og_project_tasks`.`milestone_id`)) as pColor,

0 AS `pMile`,
`og_users`.`username` AS `pRes`,
`og_users`.`email` AS `pEmail`,
(case `og_project_tasks`.`completed_by_id` when 0 then 0 else 100 end) AS `pComp`,

if(`og_project_tasks`.`id` in (select `og_project_tasks`.`parent_id` AS `id` from `og_project_tasks`),1,0) AS `pGroup`,

(case `og_project_tasks`.`parent_id` when 0 then cast(concat(55555,`og_project_tasks`.`milestone_id`) as char(16) charset utf8) 
else cast(concat(77777,`og_project_tasks`.`parent_id`) as char(16) charset utf8) end) AS `pParent`,

my_getmilestone(og_project_tasks.milestone_id) as pWBS, 
'Unknown' AS `pOrderBy`,
milestone_id,
og_project_tasks.id AS ID

from (`og_project_tasks` left join `og_users` on((`og_project_tasks`.`assigned_to_user_id` = `og_users`.`id`))) 

where (isnull(`og_project_tasks`.`trashed_on`) )
and parent_id<>0
and my_gettask1row(og_project_tasks.parent_id) is not null
order by `og_project_tasks`.`start_date`, `og_project_tasks`.`due_date`, og_project_tasks.title

) AS subSelect, (SELECT @rowcount:=0) AS rowcountinit;


END;


DROP PROCEDURE IF EXISTS fengoffice_dev.get_my_tasks3;
CREATE PROCEDURE fengoffice_dev.`get_my_tasks3`()
BEGIN

DELETE FROM my_tbltasks3;

INSERT INTO my_tbltasks3

SELECT CONCAT(ParentRowCount, '.', '0', LPAD(@rowcount:=@rowcount+1, 4, '0')) AS rowcount, 
subSelect.pID, subSelect.pName, subSelect.pStart, subSelect.pEnd, subSelect.pColor,
subSelect.pMile, subSelect.pRes, subSelect.pEmail, subSelect.pComp, subSelect.pGroup,
subSelect.pParent, subSelect.pWBS, subSelect.pOrderBy
FROM(

select my_gettask2row(og_project_tasks.parent_id) AS ParentRowCount, 
cast(concat(77777,`og_project_tasks`.`id`) as char(16) charset utf8) AS `pID`,
replace(`og_project_tasks`.`title`,'&','and') AS `pName`,
`og_project_tasks`.`start_date` AS `pStart`,
`og_project_tasks`.`due_date` AS `pEnd`,

my_getmilestonecolor(concat(55555,`og_project_tasks`.`milestone_id`)) as pColor,

0 AS `pMile`,
`og_users`.`username` AS `pRes`,
`og_users`.`email` AS `pEmail`,
(case `og_project_tasks`.`completed_by_id` when 0 then 0 else 100 end) AS `pComp`,

if(`og_project_tasks`.`id` in (select `og_project_tasks`.`parent_id` AS `id` from `og_project_tasks`),1,0) AS `pGroup`,

(case `og_project_tasks`.`parent_id` when 0 then cast(concat(55555,`og_project_tasks`.`milestone_id`) as char(16) charset utf8) 
else cast(concat(77777,`og_project_tasks`.`parent_id`) as char(16) charset utf8) end) AS `pParent`,

my_getmilestone(og_project_tasks.milestone_id) as pWBS, 
'Unknown' AS `pOrderBy`,
milestone_id,
og_project_tasks.id AS ID

from (`og_project_tasks` left join `og_users` on((`og_project_tasks`.`assigned_to_user_id` = `og_users`.`id`))) 

where (isnull(`og_project_tasks`.`trashed_on`) )
and parent_id<>0
and my_gettask2row(og_project_tasks.parent_id) is not null
order by `og_project_tasks`.`start_date`, `og_project_tasks`.`due_date`, og_project_tasks.title

) AS subSelect, (SELECT @rowcount:=0) AS rowcountinit;


END;


DROP PROCEDURE IF EXISTS fengoffice_dev.get_my_tasks4;
CREATE PROCEDURE fengoffice_dev.`get_my_tasks4`()
BEGIN

DELETE FROM my_tbltasks4;

INSERT INTO my_tbltasks4

SELECT CONCAT(ParentRowCount, '.', '0', LPAD(@rowcount:=@rowcount+1, 4, '0')) AS rowcount, 
subSelect.pID, subSelect.pName, subSelect.pStart, subSelect.pEnd, subSelect.pColor,
subSelect.pMile, subSelect.pRes, subSelect.pEmail, subSelect.pComp, subSelect.pGroup,
subSelect.pParent, subSelect.pWBS, subSelect.pOrderBy
FROM(

select my_gettask3row(og_project_tasks.parent_id) AS ParentRowCount, 
cast(concat(77777,`og_project_tasks`.`id`) as char(16) charset utf8) AS `pID`,
replace(`og_project_tasks`.`title`,'&','and') AS `pName`,
`og_project_tasks`.`start_date` AS `pStart`,
`og_project_tasks`.`due_date` AS `pEnd`,

my_getmilestonecolor(concat(55555,`og_project_tasks`.`milestone_id`)) as pColor,

0 AS `pMile`,
`og_users`.`username` AS `pRes`,
`og_users`.`email` AS `pEmail`,
(case `og_project_tasks`.`completed_by_id` when 0 then 0 else 100 end) AS `pComp`,

if(`og_project_tasks`.`id` in (select `og_project_tasks`.`parent_id` AS `id` from `og_project_tasks`),1,0) AS `pGroup`,

(case `og_project_tasks`.`parent_id` when 0 then cast(concat(55555,`og_project_tasks`.`milestone_id`) as char(16) charset utf8) 
else cast(concat(77777,`og_project_tasks`.`parent_id`) as char(16) charset utf8) end) AS `pParent`,

my_GetMileStone(og_project_tasks.milestone_id) as pWBS, 
'Unknown' AS `pOrderBy`,
milestone_id,
og_project_tasks.id AS ID

from (`og_project_tasks` left join `og_users` on((`og_project_tasks`.`assigned_to_user_id` = `og_users`.`id`))) 

where (isnull(`og_project_tasks`.`trashed_on`) )
and parent_id<>0
and my_gettask3row(og_project_tasks.parent_id) is not null
order by `og_project_tasks`.`start_date`, `og_project_tasks`.`due_date`, og_project_tasks.title

) AS subSelect, (SELECT @rowcount:=0) AS rowcountinit;


END;


DROP PROCEDURE IF EXISTS fengoffice_dev.get_my_tasks5;
CREATE PROCEDURE fengoffice_dev.`get_my_tasks5`()
BEGIN

DELETE FROM my_tbltasks5;

INSERT INTO my_tbltasks5

SELECT CONCAT(ParentRowCount, '.', '0', LPAD(@rowcount:=@rowcount+1, 4, '0')) AS rowcount, 
subSelect.pID, subSelect.pName, subSelect.pStart, subSelect.pEnd, subSelect.pColor,
subSelect.pMile, subSelect.pRes, subSelect.pEmail, subSelect.pComp, subSelect.pGroup,
subSelect.pParent, subSelect.pWBS, subSelect.pOrderBy
FROM(

select my_gettask4row(og_project_tasks.parent_id) AS ParentRowCount, 
cast(concat(77777,`og_project_tasks`.`id`) as char(16) charset utf8) AS `pID`,
replace(`og_project_tasks`.`title`,'&','and') AS `pName`,
`og_project_tasks`.`start_date` AS `pStart`,
`og_project_tasks`.`due_date` AS `pEnd`,

my_getmilestonecolor(concat(55555,`og_project_tasks`.`milestone_id`)) as pColor,

0 AS `pMile`,
`og_users`.`username` AS `pRes`,
`og_users`.`email` AS `pEmail`,
(case `og_project_tasks`.`completed_by_id` when 0 then 0 else 100 end) AS `pComp`,

if(`og_project_tasks`.`id` in (select `og_project_tasks`.`parent_id` AS `id` from `og_project_tasks`),1,0) AS `pGroup`,

(case `og_project_tasks`.`parent_id` when 0 then cast(concat(55555,`og_project_tasks`.`milestone_id`) as char(16) charset utf8) 
else cast(concat(77777,`og_project_tasks`.`parent_id`) as char(16) charset utf8) end) AS `pParent`,

my_getmilestone(og_project_tasks.milestone_id) as pWBS, 
'Unknown' AS `pOrderBy`,
milestone_id,
og_project_tasks.id AS ID

from (`og_project_tasks` left join `og_users` on((`og_project_tasks`.`assigned_to_user_id` = `og_users`.`id`))) 

where (isnull(`og_project_tasks`.`trashed_on`) )
and parent_id<>0
and my_gettask4row(og_project_tasks.parent_id) is not null
order by `og_project_tasks`.`start_date`, `og_project_tasks`.`due_date`, og_project_tasks.title

) AS subSelect, (SELECT @rowcount:=0) AS rowcountinit;


END;


DROP PROCEDURE IF EXISTS fengoffice_dev.get_my_milestones;
CREATE PROCEDURE fengoffice_dev.`get_my_milestones`()
BEGIN

DELETE FROM my_tblmilestones;

INSERT INTO my_tblmilestones

SELECT CONCAT(my_getworkspacerow(pParent), '.', '5', LPAD(@rowcount:=@rowcount+1, 4, '0')) AS rowcount, subSelect.*
FROM(
select 
cast(concat(55555,`og_project_milestones`.`id`) as char(32) charset utf8) AS `pID`,
replace(`og_project_milestones`.`name`,'&','and') AS `pName`,
NULL AS `pStart`,
due_date AS `pEnd`,
`my_workspaces`.`pColor` AS `pColor`,
1 AS `pMile`,
`og_users`.`username` AS `pRes`,
`og_users`.`email` AS `pEmail`,

(case `og_project_milestones`.`completed_by_id` when 1 then 100 else 0 end) AS `pComp`,
1 AS `pGroup`,`my_workspaces`.`pID` AS `pParent`,
concat(`my_workspaces`.`pWBS`,'.',`my_milestonestoworkspaces`.`object_id`) AS `pWBS`,
`my_workspaces`.`pOrderBy` AS `pOrderBy` 

from (((`my_workspaces` 
join `my_milestonestoworkspaces` 
on((`my_workspaces`.`pID` = `my_milestonestoworkspaces`.`workspace_id`))) 
join `og_project_milestones` 
on((`my_milestonestoworkspaces`.`object_id` = `og_project_milestones`.`id`))) 
left join `og_users` 
on(((`og_project_milestones`.`assigned_to_user_id` = `og_users`.`id`) 
and (`og_project_milestones`.`assigned_to_company_id` = `og_users`.`company_id`)))) 

where ((not(`my_workspaces`.`pID` in (select `og_users`.`personal_project_id` AS `personal_project_id` 
from `og_users`))) 

and isnull(`og_project_milestones`.`trashed_on`)) ORDER BY pOrderBy) AS subSelect, (SELECT @rowcount:=0) AS rowcountinit;


END;


DROP PROCEDURE IF EXISTS fengoffice_dev.get_my_gantt;
CREATE PROCEDURE fengoffice_dev.`get_my_gantt`()
BEGIN
	
  call get_my_workspaces;
  call get_my_milestones;
  call get_my_tasks1;
  call get_my_tasks2;
  call get_my_tasks3;
  call get_my_tasks4;
  call get_my_tasks5;
  
END;
