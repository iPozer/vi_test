<?php

include_once('safemysql.class.php');

/**
 * Class for schedule input information.
 *
 * @author ibvd
 */
class Schedule {

    public $db;

    function __construct() {
        //init database
        $opts = require(__DIR__ . '/config.php');
        $this->db = new SafeMySQL($opts);
    }

    public function record_delivery() {
        $region = null;
        $courier = null;
        $send_date = null;
        if (!empty($_GET['region'])) {
            $region = (int) $_GET['region'];
        } else {
            $this->error('Регион не указан',200);
        }

        if (!empty($_GET['courier'])) {
            $courier = (int) $_GET['courier'];
        } else {
            $this->error('Курьер не указан',200);
        }

        if (!empty($_GET['send_date'])) {
            $send_date = $_GET['send_date'];
        } else {
            $this->error('Дата отправки не указана',200);
        }

        //check recording
        $sql = "SELECT count(*) FROM shipment 
                WHERE region=?i AND courier=?i AND date_start<=?s AND date_end>=?s";
        $count_record = (int) $this->db->getOne($sql, $region, $courier, $send_date, $send_date);
        if ($count_record > 0) {
            $this->error('В данный промежуток времени курьер занят.',200);
        }
        $sql = "SELECT (days_send+days_back) as day FROM region WHERE id=?i";
        $days_in = (int) $this->db->getOne($sql, $region);
        $t_date = date_create_from_format('Y-m-d', $send_date);
        if (!$t_date) {
            $this->error('Дата указана неправильно',200);
        }
        $t_date->add(new DateInterval('P' . $days_in . 'D'));

        $next_date = $t_date->format('Y-m-d');
        $sql = "SELECT count(*) FROM shipment 
                WHERE region=?i AND courier=?i AND date_start<=?s AND date_end>=?s";
        $count_record = (int) $this->db->getOne($sql, $region, $courier, $next_date, $next_date);
        if ($count_record > 0) {
            $this->error('В данный промежуток времени курьер занят.',200);
        }
        //add information
        $data = [
            'courier' => $courier,
            'region' => $region,
            'date_start' => $send_date,
            'date_end' => $next_date,
        ];
        $sql = "INSERT INTO shipment SET ?u";
        $this->db->query($sql, $data);
        echo 'Поездка добавлена';
    }

    function get_regions() {
        $region = $this->db->getAll("SELECT id,name,days_send FROM region");
        return $region;
    }

    function get_couriers() {
        $courier = $this->db->getAll("SELECT id,name FROM courier WHERE end_work is NULL");
        return $courier;
    }

    function get_schedule() {
        $start = date('Y-m-d');
        $end = date('Y-m-d');

        if (!empty($_GET['start'])) {
            $date = date_create_from_format('Y-m-d', $_GET['start']);
            if ($date) {
                $start = $date->format('Y-m-d');
            }
        }
        if (!empty($_GET['end'])) {
            $date = date_create_from_format('Y-m-d', $_GET['end']);
            if ($date) {
                $end = $date->format('Y-m-d');
            }
        }

        $sql = "SELECT s.id,c.name as courier,r.name as region,s.date_start,s.date_end,DATE_ADD(s.date_start,Interval r.days_send DAY) as delivered FROM shipment s
            LEFT JOIN courier c
            ON s.courier=c.id
            LEFT JOIN region r
            ON s.region=r.id
            WHERE s.date_start>=?s AND s.date_end<=?s
            ORDER BY s.date_start";
        $data = $this->db->getAll($sql, $start, $end);
        if ($data) {
            foreach ($data as $key_data => $_data) {
                $list_field = [
                    'date_start',
                    'date_end',
                    'delivered'
                ];
                foreach ($list_field as $lf) {
                    $data[$key_data][$lf] = date_create_from_format('Y-m-d', $_data[$lf])->format('d.m.Y');
                }
            }
        }
        $this->ajax_send($data);
    }

    public function ajax_send($array) {
        header('Content-Type: application/json');
        echo json_encode($array);
        die();
    }

    public function generate($start_date, $end_date = null) {
        $start = null;
        $end = null;
        $date = date_create_from_format('Y-m-d', $start_date);
        if (!$date) {
            $this->error('Неправильно указана дана начала');
        } else {
            $start = $date;
        }
        if ($end_date) {
            $date = date_create_from_format('Y-m-d', $end_date);
            if (!$date) {
                $this->error('Неправильно указана дата окончания');
            } else {
                $end = $date;
            }
        }

        if (!$end) {
            $end = date_create_from_format('Y-m-d', date('Y-m-d'));
        }

        $courier = $this->db->getAll("SELECT * FROM courier");
        //starting date set
        $list_courier = [];
        if ($courier) {
            foreach ($courier as $_courier) {
                $id = (int) $_courier['id'];
                $start_work = date_create_from_format('Y-m-d', $_courier['start_work']);
                $end_work = null;
                if ($_courier['end_work']) {
                    $end_work = date_create_from_format('Y-m-d', $_courier['end_work']);
                }
                if ($start > $start_work) {
                    $current_date = $start;
                } else {
                    $current_date = $start_work;
                }
                $list_courier[$id] = [
                    'start' => $current_date,
                    'end' => $end_work
                ];
            }
        } else {
            $this->error('Укажите курьеров для генерации расписания');
        }
        $region = $this->db->getAll("SELECT id,(days_send+days_back) as day FROM region");
        //list region
        $list_region = [];
        if ($region) {
            foreach ($region as $_region) {
                $id = (int) $_region['id'];
                $day = (int) $_region['day'];
                $list_region[$id] = $day;
            }
        } else {
            $this->error('Укажите города для генерации расписания');
        }
        $count_add_list = 0;
        //generate schedule
        if ($list_courier && $list_region) {
            foreach ($list_courier as $key_courier => $lc) {
                $need_adding = true;
                $courier = $key_courier;
                while ($need_adding) {
                    $region = array_rand($list_region);
                    $regions_days = (int) $list_region[$region];
                    $t_date = $lc['start'];
                    $t_start = $t_date->format('Y-m-d');
                    $t_date->add(new DateInterval('P' . $regions_days . 'D'));
                    $t_end = $t_date->format('Y-m-d');
                    if ($t_date < $end) {
                        $this->add_shipment($courier, $region, $t_start, $t_end);
                        $count_add_list++;
                    } else {
                        $need_adding = false;
                    }
                }
            }
        }
        echo 'Добавлено поездок в расписание: ' . $count_add_list;
    }

    public function error($text,$code=500) {
        http_response_code($code);
        echo $text;
        die();
    }

    public function add_shipment($courier, $region, $start, $end) {
        $data = [
            'courier' => (int) $courier,
            'region' => (int) $region,
            'date_start' => $start,
            'date_end' => $end,
        ];
        $sql = "INSERT INTO shipment SET ?u";
        $this->db->query($sql, $data);
    }

}
