<?php if(!empty($activities)):
foreach($activities as $activity): ?>
    <li class="notificationRow <?php if($activity->read==0) echo "unread"; ?>">
        <a href="<?php echo site_url(SITE_AREA.$activity->target_url.$activity->target_id); ?>">
        <div class="grid3"><img class="mImage" src="<?php echo getAvatar($activity->avatar); ?>" /></div>
        <div class="grid9">
            <strong><?php echo $activity->first_name . ' ' . $activity->last_name; ?></strong> <?php echo lang($activity->action); ?>.
            <span class="relative_time"><?php echo relative_time($activity->created_on); ?></span>
        </div>
        <div class="clear"></div>
        </a>
    </li>
<?php endforeach;
else: ?>
    <li class="notificationRow">
        <div class="grid12 noActivity"><?php echo lang('No New Activity'); ?></div>
        <div class="clear"></div>
    </li>
<?php endif; ?>