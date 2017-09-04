jQuery(document).ready(function($){
    $(document).on('sumbit','.filter_form',function(){
        var start_date=$(this).find('input[name="start_schedule"]').val();
        var end_date=$(this).find('input[name="end_schedule"]').val();
        console.log(start_date);
        console.log(end_date);
        return false;
    });
});