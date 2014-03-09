<?php if (validation_errors()) : ?>
    <div class="nNote error">
        <p>Please fix the following errors :</p>
        <?php echo validation_errors(); ?>
    </div>
<?php endif; ?>

<?php echo form_open($this->uri->uri_string(), 'id="validate"'); ?>
    <div class="fluid">
        <div class="widget">
            <div class="whead"><h6><?php echo lang('Basic Information'); ?></h6><div class="clear"></div> </div>

            <div class="formRow">
                <div class="grid3"><label><?php echo lang('Title'); ?>:<span class="req">*</span></label></div>
                <div class="grid9"><input type="text" name="news_title" id="news_title" class="validate[required]" value="<?php echo set_value('news_title',isset($news) ? $news->news_title : ''); ?>" /></div>
                <div class="clear"></div>
            </div>

            <div class="formRow">
                <div class="grid3"><label><?php echo lang('Category'); ?>:<span class="req">*</span></label></div>
                <div class="grid9">
                    <?php $text = $this->news_category_model->buildOptionsCatalogHTML();
                    if($text!=''): ?>
                    <select name="news_category_id" id="news_category_id" class="validate[required]">
                        <?php echo $text; ?>
                        <script type="text/javascript">
                            cbo_Selected('news_category_id','<?php echo set_value('news_category_id',isset($news) ? $news->news_category_id : ''); ?>');
                        </script>
                    </select>
                    <?php else:
                    echo lang('You need create category before');
                    endif; ?>
                </div>
                <div class="clear"></div>
            </div>

            <div class="formRow">
                <div class="grid3"><label><?php echo lang('Image'); ?>:<span class="req">*</span></label></div>
                <div class="grid9">
                    <input type="button" class="buttonM bBlue" value="<?php echo lang("Upload"); ?>" id="uploader" />
                    <input type="hidden" name="news_image" id="news_image" value="<?php echo is_file($file = set_value('news_image',isset($news) ? $news->news_image : false)) ? $file : ''; ?>" />
                    <?php if(is_file($file)): ?>
                        <br /><img class="preview" src="<?php echo file_url($file); ?>" />
                    <?php endif; ?>
                    <div class="contentProgress mt8"><div class="barB" id="bar"></div></div>
                </div>
                <div class="clear"></div>
            </div>

            <div class="formRow">
                <div class="grid3"><label><?php echo lang('Intro'); ?>:<span class="req">*</span></label></div>
                <div class="grid9">
                    <textarea name="news_intro" id="news_intro" class="validate[required]"><?php echo set_value('news_intro',isset($news) ? $news->news_intro : ''); ?></textarea>
                </div>
                <div class="clear"></div>
            </div>

            <div class="formRow">
                <div class="grid3"><label><?php echo lang('Description'); ?>:<span class="req">*</span></label></div>
                <div class="grid9">
                    <?php echo $this->ckeditor->editor("news_description",html_entity_decode(set_value('news_description',isset($news) ? $news->news_description : ''))); ?>
                </div>
                <div class="clear"></div>
            </div>

            <div class="formRow">
                <div class="grid3"><label><?php echo lang('Tags'); ?>:<span class="req">*</span></label></div>
                <div class="grid9"><input type="text" name="news_tags" id="news_tags" value="<?php echo set_value('news_tags',isset($news) ? $news->news_tags : ''); ?>" class="validate[required] tags" /></div>
                <div class="clear"></div>
            </div>

            <div class="formRow">
                <div class="grid3"><label><?php echo lang('Active'); ?>:<span class="req">*</span> </label></div>
                <div class="grid9">
                    <select name="active" id="active" class="validate[required]">
                        <option value="1"><?php echo lang('Active'); ?></option>
                        <option value="0"><?php echo lang('Deactive'); ?></option>
                    </select>
                    <script type="text/javascript">
                        cbo_Selected('active','<?php echo set_value('active',isset($slider) ? $slider->active : 1); ?>');
                    </script>
                </div>
                <div class="clear"></div>
            </div>

            <div class="formRow">
                <div class="grid3"><label><?php echo lang('Meta Title'); ?>:<span class="req">*</span></label></div>
                <div class="grid9"><input type="text" name="news_meta_title" id="news_meta_title" value="<?php echo set_value('news_meta_title',isset($news) ? $news->news_meta_title : ''); ?>" class="validate[required]" /></div>
                <div class="clear"></div>
            </div>

            <div class="formRow">
                <div class="grid3"><label><?php echo lang('Meta Keyword'); ?>:<span class="req">*</span></label></div>
                <div class="grid9"><input type="text" name="news_meta_keyword" id="news_meta_keyword" value="<?php echo set_value('news_meta_keyword',isset($news) ? $news->news_meta_keyword : ''); ?>" class="validate[required] tags" /></div>
                <div class="clear"></div>
            </div>

            <div class="formRow">
                <div class="grid3"><label><?php echo lang('Meta Description'); ?>:<span class="req">*</span></label></div>
                <div class="grid9">
                    <textarea name="news_meta_description" id="news_meta_description" class="validate[required]"><?php echo set_value('news_meta_description',isset($news) ? $news->news_meta_description : ''); ?></textarea>
                </div>
                <div class="clear"></div>
            </div>

            <div class="formRow">
                <div class="grid3"><label><?php echo lang('Created By'); ?>:</label></div>
                <div class="grid9">
                    <?php echo (isset($news) AND $fullname = $this->auth->name($news->created_by)) ? anchor(SITE_AREA.'/settings/users/profile/'.$news->created_by,$fullname).' '.lang('at').' '.datetimeToStr($news->created_on) : ''; ?>
                </div>
                <div class="clear"></div>
            </div>
            <div class="formRow">
                <div class="grid3"><label><?php echo lang('Modify By'); ?>:</label></div>
                <div class="grid9">
                    <?php echo (isset($news) AND $fullname = $this->auth->name($news->modify_by)) ? anchor(SITE_AREA.'/settings/users/profile/'.$news->modify_by,$fullname).' '.lang('at').' '.datetimeToStr($news->modify_on) : ''; ?>
                </div>
                <div class="clear"></div>
            </div>
            <div class="formRow">
                <div class="grid12"><input type="submit" name="submit" value="<?php echo lang("Save"); ?>" class="buttonM bBlue formSubmit" /></div><div class="clear"></div>
            </div>
        </div>

    </div>
<?php echo form_close(); ?>