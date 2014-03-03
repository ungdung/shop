<?php echo Assets::css(); ?>
<?php echo Assets::js(); ?>
<script type="text/javascript">

    $(document).ready(function() {
        var offset = 0;
        var isLoading = false;
        $('#notification .contentNotification').mCustomScrollbar({
            callbacks:{
                onScroll: function(){
                    console.log(isLoading);
                    if(isLoading) return;
                    loadNotification(offset);
                }
            }
        });
        var loadNotification = function(offset) {
            isLoading = true;
            var url = '<?php echo site_url(SITE_AREA.'/settings/activity/getNotification'); ?>/'+offset;
            $.get(url,function(response) {
                var res = JSON.parse(response);
                $('#notification ul').append(res.result);
                $('img.mImage').fakecrop({wrapperWidth:50,wrapperHeight:50});
                offset+=15;
                isLoading = false;
            });
        }
        loadNotification(0);
    });
</script>
</body>
</html>