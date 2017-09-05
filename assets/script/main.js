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
                    start: start_date,
                    end: end_date
                },
                success: function (data) {
                    if (data)
                    {
                        $.each(data,function (i,val){
                            var t_text='<tr><td>'+
                                    val.id+
                                    '</td><td>'+
                                    val.courier+
                                    '</td><td>'+
                                    val.region+
                                    '</td><td>'+
                                    val.date_start+
                                    '</td><td>'+
                                    val.delivered+
                                    '</td><td>'+
                                    val.date_end+
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
});