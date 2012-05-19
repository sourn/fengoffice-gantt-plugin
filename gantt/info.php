<?php

/*
 * sourn wrote
 * gantt plugin metadata
 */
return array(
    "name" => "gantt",
    "version" => 1,
    "author" => "sourn",
    "description" => "Gantt diagram",
    "order" => 1,
    "tabs" => array (
            array(
                    "id" => "gantt-panel",
                    "ordering" => 2,
                    "title" => "gantt tab",
                    "icon_cls" => "ico-mail",
                    "refresh_on_context_change" => true,
                    "default_controller" => "gantt", 
                    "default_action" => "show_gantt" ,
                    "initial_controller" => "" ,
                    "initial_action" => "" ,
                    "type" => "system",
                    "object_type_id" => 23
            )
    )
);

?>
