$('.install').click(function() {
    $.ajax({
        type: 'post',
        url: '<?php echo site_url(MODULE_URL.'/install'); ?>',
        data: { theme : $(this).data('id')},
        dataType: 'json',
        success: function(res){
            $.jGrowl(res.message);
        }
    });
});