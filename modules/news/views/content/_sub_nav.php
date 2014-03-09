<?php if (has_permission('Permission.News.Manage')):?>
    <ul>
        <li><a href="<?php echo site_url(MODULE_URL.'/category'); ?>"><i class="icos-list2"></i><span><?php echo lang('Category Manage'); ?></span> </a> </li>
        <li><a href="<?php echo site_url(MODULE_URL) ?>" title=""><i class="icos-list"></i><span><?php echo lang('News Manage'); ?></span></a></li>
        <li><a href="<?php echo site_url(MODULE_URL.'/create') ?>" title=""><i class="icos-add"></i><span><?php echo lang('Create News'); ?></span></a></li>
    </ul>
<?php endif;?>