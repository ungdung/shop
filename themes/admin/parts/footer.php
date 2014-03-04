<?php echo Assets::css(); ?>
<?php echo Assets::js(); ?>
<script type="text/javascript">

    $(document).ready(function() {
        $('#notification .contentNotification').mCustomScrollbar();
        var loadNotification = function() {
            var url = '<?php echo site_url(SITE_AREA.'/settings/activity/getNotification'); ?>/';
            $.get(url,function(response) {
                var res = JSON.parse(response);
                $('#notification ul').append(res.result);
                $('.notification').append(res.total_unread);
                $('img.mImage').fakecrop({wrapperWidth:50,wrapperHeight:50});
            });
        }
        loadNotification(0);
    });
</script>
</body>
</html>