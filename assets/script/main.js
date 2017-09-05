jQuery(document).ready(function ($) {
    $(document).on('submit', '.filter_form', function () {
        var start_date = $(this).find('input[name="start_schedule"]').val();
        var end_date = $(this).find('input[name="end_schedule"]').val();
        if (start_date > end_date)
        {
            alert('Дата начала должна быть меньше даты окончания.');
        } else {
            $('.schedule_table table tbody').html('');
            $.ajax({
                type: 'GET',
                url: '/ajax.php',
                data: {
                    action: 'schedule',
                    start: start_date,
                    end: end_date
                },
                success: function (data) {
                    if (data)
                    {
                        $.each(data, function (i, val) {
                            var t_text = '<tr><td>' +
                                    val.id +
                                    '</td><td>' +
                                    val.courier +
                                    '</td><td>' +
                                    val.region +
                                    '</td><td>' +
                                    val.date_start +
                                    '</td><td>' +
                                    val.delivered +
                                    '</td><td>' +
                                    val.date_end +
                                    '</td></tr>';
                            $('.schedule_table table tbody').append(t_text);
                        });
                    }
                },
                error: function (response) {
                },
                dataType: 'json'
            });
        }
        return false;
    });

    $(document).on('submit', '.add_send', function () {
        var region = $(this).find('select[name="region"]').val();
        var courier = $(this).find('select[name="courier"]').val();
        var send_date = $(this).find('input[name="date_start"]').val();
        if (region && courier && send_date)
        {
            $.ajax({
                type: 'GET',
                url: '/ajax.php',
                data: {
                    action: 'record',
                    region: region,
                    courier: courier,
                    send_date: send_date,
                },
                success: function (data) {
                    alert(data);
                },
                error: function (response) {
                    alert(data);
                },
                dataType: 'html'
            });
        }

        return false;
    });

    $(document).on('change', '.add_send input', function () {
        calculate_delivery();
    });
    $(document).on('change', '.add_send select', function () {
        calculate_delivery();
    });

    function calculate_delivery() {
        var region = $('.add_send select[name="region"]').val();
        var send_date = $('.add_send input[name="date_start"]').val();
        if (region && send_date)
        {
            var days_select = parseInt($('.add_send select[name="region"] option:selected').data('days'));
            var text_send = 'Дата доставки: ';
            moment.locale('ru');
            var date_next = moment(send_date).add(days_select, 'days').format('LL');
            text_send += date_next;
            $('.add_send .result_window').html(text_send).show();
        } else {
            $('.add_send .result_window').hide().html('');
        }
    }
});