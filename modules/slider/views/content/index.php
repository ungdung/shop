<div class="widget ">
    <div class="whead">
        <h6><?php echo isset($toolbar_title) ? $toolbar_title : ''; ?></h6>
        <div class="clear"></div>
    </div>
    <table width="100%" cellspacing="0" cellpadding="0" class="tDefault tMedia kTableFull" data-source="<?php echo site_url(MODULE_URL.'/loadTable'); ?>">
        <thead>
        <tr>
            <th data-Keith="image"><?php echo lang('Image'); ?></th>
            <th data-Keith="title"><?php echo lang('Title'); ?></th>
            <th data-Keith="active" style="width: 11em"></th>
        </tr>
        </thead>

    </table>
</div>