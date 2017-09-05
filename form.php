<?PHP
include_once 'Schedule.php';
$schedule = new Schedule();
$couriers = $schedule->get_couriers();
$regions = $schedule->get_regions();
?>
<!DOCTYPE html>
<html>
    <head>
        <title>Добавление поездки</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="/assets/style/bootstrap.min.css">
        <script src="/assets/script/jquery-3.2.1.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
        <script src="/assets/script/bootstrap.min.js"></script>
        <script src="/assets/script/moment.js"></script>
        <script src="/assets/script/main.js"></script>
        <style>
            .result_send.result_window {
                display:none;
                height: 50px;
                width: 100%;
                background-color: aquamarine;
                padding: 13px;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h1>Добавление поездки</h1>
            <div>
                <form class="add_send">
                    <div class="form-group">
                        <select name="region" class="form-control" required="">
                            <option value="">Город</option>
                            <?PHP if ($regions) : ?>
                                <?PHP foreach ($regions as $_region): ?>
                                    <option value="<?= $_region['id']; ?>" data-days="<?= $_region['days_send']; ?>"><?= $_region['name']; ?></option>
                                <?PHP endforeach; ?>
                            <?PHP endif; ?>
                        </select>
                    </div>
                    <div  class="form-group">
                        <input type="date" name="date_start" class="form-control" required="">
                    </div>
                    <div  class="form-group">
                        <select name="courier" class="form-control" required="">
                            <option value="">Курьер</option>
                            <?PHP foreach ($couriers as $_courier): ?>
                                <option value="<?= $_courier['id']; ?>"><?= $_courier['name']; ?></option>
                            <?PHP endforeach; ?>
                        </select>
                    </div>
                    <div  class="form-group">
                        <input type="submit" class="btn btn-default">
                    </div>
                    <div class="result_send result_window"></div>
                </form>
            </div>
        </div>
    </body>
</html>
