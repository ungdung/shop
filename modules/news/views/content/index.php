<div class="widget ">
    <div class="whead">
        <h6><?php echo isset($toolbar_title) ? $toolbar_title : ''; ?></h6>
        <div class="clear"></div>
    </div>
    <table width="100%" cellspacing="0" cellpadding="0" class="tDefault tMedia kTableFull" data-source="<?php echo site_url(MODULE_URL.'/loadTable'); ?>">
        <thead>
        <tr>
            <th data-Keith="news_title"><?php echo lang('Title'); ?></th>
            <th data-Keith="category_name"><?php echo lang('Category'); ?></th>
            <th data-Keith="news_tags"><?php echo lang('Tags'); ?></th>
            <th data-Keith="efox_news__K__active" style="width: 11em"><?php echo lang('Active'); ?></th>
        </tr>
        </thead>

    </table>
</div>