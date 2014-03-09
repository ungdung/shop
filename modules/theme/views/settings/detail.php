<div class="fluid">
    <div class="widget">
        <div class="whead"><h6><?php echo $theme->theme_name; ?></h6><div class="clear"></div> </div>

        <div class="fluid">
            <div class="grid8"><img src="<?php echo file_url($theme->theme_image); ?>" class="fluid" /></div>
            <div class="grid4">
                <div class="formRow">
                    <div class="grid12">
                        <strong><?php echo lang('Theme Name'); ?></strong>: <?php echo $theme->theme_name; ?>
                    </div>
                    <div class="clear"></div>
                </div>
                <?php if(!empty($theme->categories)): ?>
                <div class="formRow">
                    <div class="grid12">
                        <strong><?php echo lang('Category'); ?></strong>:
                        <?php foreach($theme->categories as $i=> $cat): ?>
                            <?php if($i>0) echo ', '; echo anchor(MODULE_URL.'?category[]='.$cat->category_id,$cat->category_name); ?>
                        <?php endforeach; ?>
                    </div>
                    <div class="clear"></div>
                </div>
                <?php endif; ?>

                <?php if(!empty($theme->tags)): ?>
                <div class="formRow">
                    <div class="grid12">
                        <strong><?php echo lang('Tags'); ?></strong>:
                        <?php foreach($theme->tags as $i=> $item): ?>
                            <?php if($i>0) echo ', '; echo anchor(MODULE_URL.'?tags[]='.$item->tags,$item->tags); ?>
                        <?php endforeach; ?>
                    </div>
                    <div class="clear"></div>
                </div>
                <?php endif; ?>

                <div class="formRow">
                    <div class="grid12">
                        <strong><?php echo lang('Installs'); ?></strong>: <?php echo $theme->theme_installs; ?>
                    </div>
                    <div class="clear"></div>
                </div>
                <div class="formRow">
                    <div class="grid12">
                        <strong><?php echo lang('Author'); ?></strong>: <?php echo $theme->theme_author; ?>
                    </div>
                    <div class="clear"></div>
                </div>

                <div class="formRow">
                    <div class="grid6"><input type="button" name="submit" value="<?php echo lang("Install"); ?>" data-id="<?php echo $theme->theme_id; ?>" class="buttonM bRed install" style="cursor: pointer" /></div>
                    <div class="grid6">
                        <?php if($theme->theme_demo!=''): ?>
                            <a href="<?php echo site_url($theme->theme_demo); ?>" target="_blank">
                                <input type="button" name="submit" value="<?php echo lang("View Demo"); ?>" class="buttonM bBlue" />
                            </a>
                        <?php endif; ?>
                    </div>
                    <div class="clear"></div>
                </div>
            </div>
            <div class="clear"></div>
        </div>
    </div>
</div>