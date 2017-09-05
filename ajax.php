<?php
ini_set('error_reporting', E_ALL);
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);

include_once('Schedule.php');
$schedule = new Schedule();
$schedule->get_schedule();

