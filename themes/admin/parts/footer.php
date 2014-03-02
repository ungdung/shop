<?php echo Assets::css(); ?>
<?php echo Assets::js(); ?>
<script type="text/javascript">

    $(document).ready(function() {
        $.ajax({
            url: '<?php echo site_url(SITE_AREA.'/settings/activity/getNotification'); ?>',
            dataType: 'json',
            success: function(res) {
                $('.notification').html(res.total_unread);
                $('#notification ul').append(res.result);
                $('img.mImage').fakecrop({wrapperWidth:50,wrapperHeight:50});
            }
        });
    });
</script>
</body>
</html>