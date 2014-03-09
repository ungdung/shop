<?php if (validation_errors()) : ?>
    <div class="nNote error">
        <p>Please fix the following errors :</p>
        <?php echo validation_errors(); ?>
    </div>
<?php endif; ?>

<?php echo form_open($this->uri->uri_string(), 'method="get"'); ?>
<div class="fluid">
    <div class="widget grid12">
        <div class="whead"><h6><?php echo lang('Search'); ?></h6><div class="clear"></div> </div>

        <div class="formRow">
            <div class="grid3"><label><?php echo lang('Category'); ?></label></div>
            <div class="grid9">
                <?php $k=0; $total_category = count($categories); foreach($categories as $category): ++$k; ?>
                    <?php if($k%3==1): ?>
                    <div class="fluid">
                    <?php endif; ?>
                    <div class="grid4 check">
                        <input type="checkbox" name="category[]" <?php if(in_array($category->category_id,$categorySelected)) echo 'checked="checked"'; ?> value="<?php echo $category->category_id; ?>" id="category_<?php echo $category->category_id; ?>" />
                        <label for="category_<?php echo $category->category_id; ?>"><?php echo $category->category_name; ?></label>
                    </div>
                    <?php if($k%3==0 || $k==$total_category ): ?>
                    <div class="clear"></div>
                    </div>
                    <?php endif; ?>
                <?php endforeach; ?>
            </div>
            <div class="clear"></div>
        </div>

        <div class="formRow">
            <div class="grid3"><label><?php echo lang('Tags'); ?></label></div>
            <div class="grid9">
                <?php $k=0; $total_tags = count($tags); foreach($tags as $item): ++$k; ?>
                    <?php if($k%3==1): ?>
                    <div class="fluid">
                    <?php endif; ?>
                    <div class="grid4 check">
                        <input type="checkbox" name="tags[]" <?php if(in_array($item->tags,$tagsSelected)) echo 'checked="checked"'; ?> value="<?php echo $item->tags; ?>" id="tags_<?php echo $k; ?>" />
                        <label for="tags_<?php echo $k; ?>"><?php echo $item->tags; ?></label>
                    </div>
                    <?php if($k%3==0 || $k==$total_tags): ?>
                    <div class="clear"></div>
                    </div>
                    <?php endif; ?>
                <?php endforeach; ?>
            </div>
            <div class="clear"></div>
        </div>

        <div class="formRow">
            <div class="grid12"><input type="submit" name="submit" value="<?php echo lang("Search"); ?>" class="buttonM bBlue formSubmit" /></div><div class="clear"></div>
        </div>
    </div>
</div>
<?php echo form_close(); ?>

<div class="fluid">
    <div class="widget">
        <div class="whead"><h6><?php echo lang('List Themes'); ?></h6><div class="clear"></div> </div>
        <?php if(!empty($themes)): $k=0; $total_record = count($themes);
        foreach($themes as $theme): ++$k; ?>
        <?php if($k%3==1): ?>
        <div class="formRow">
        <?php endif; ?>
            <div class="grid4">
                <div class="template">
                    <a href="<?php echo site_url(MODULE_URL.'/detail/'.$theme->theme_id); ?>"><img src="<?php echo file_url($theme->theme_image); ?>" /></a>
                    <div class="name"><strong><?php echo lang('Theme Name'); ?></strong>: <?php echo $theme->theme_name; ?></div>
                    <?php if(!empty($theme->categories)): ?>
                    <div class="category">
                        <strong><?php echo lang('Category'); ?></strong>:
                        <?php foreach($theme->categories as $i=> $cat): ?>
                            <?php if($i>0) echo ', '; echo anchor(MODULE_URL.'?category[]='.$cat->category_id,$cat->category_name); ?>
                        <?php endforeach; ?>
                    </div>
                    <?php endif; ?>
                    <?php if(!empty($theme->tags)): ?>
                        <div class="theme_tags">
                            <strong><?php echo lang('Tags'); ?></strong>:
                            <?php foreach($theme->tags as $i=> $item): ?>
                                <?php if($i>0) echo ', '; echo anchor(MODULE_URL.'?tags[]='.$item->tags,$item->tags); ?>
                            <?php endforeach; ?>
                        </div>
                    <?php endif; ?>
                    <div class="installs"><strong><?php echo lang('Installs'); ?></strong>: <?php echo $theme->theme_installs; ?></div>
                    <div class="author"><strong><?php echo lang('Author'); ?></strong>: <?php echo $theme->theme_author; ?></div>
                </div>
            </div>
        <?php if($k%3==0 || $k==$total_record): ?>
        <div class="clear"></div>
        </div>
        <?php endif; ?>
        <?php endforeach;
        else: ?>
        <div class="formRow">
            <div class="grid12"><?php echo lang('No matching records found'); ?></div>
            <div class="clear"></div>
        </div>
        <?php endif; ?>
        <?php if($paper = $this->pagination->create_links()): ?>
        <div class="formRow">
            <div class="grid12">
                <?php echo $paper; ?>
            </div>
            <div class="clear"></div>
        </div>
        <?php endif; ?>
    </div>
</div>