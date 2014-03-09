<?php if($hasView): ?>
<ul>
    <li><a href="<?php echo site_url(MODULE_URL) ?>" title=""><i class="icos-list"></i><span><?php echo lang('List Themes'); ?></span></a></li>
</ul>
<?php else: ?>
<ul>
    <li><a href="#" onclick="window.history.back();"><i class="icos-list"></i><span><?php echo lang('List Themes'); ?></span></a></li>
</ul>
<?php endif; ?>