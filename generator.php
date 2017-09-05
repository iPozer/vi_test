<?php

include_once('Schedule.php');
$schedule = new Schedule();
if (!empty($_GET['start'])) {
    $end_date = null;
    if (!empty($_GET['end'])) {
        $end_date = $_GET['end'];
    }
    $schedule->generate($_GET['start'], $end_date);
} else {
    $schedule->error('Не указана дата начала');
}