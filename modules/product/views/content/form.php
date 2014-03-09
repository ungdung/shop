<?php if (validation_errors()) : ?>
    <div class="nNote error">
        <p>Please fix the following errors :</p>
        <?php echo validation_errors(); ?>
    </div>
<?php endif; ?>

<?php echo form_open($this->uri->uri_string(), 'id="validate"'); ?>
    <div class="fluid">
        <div class="widget grid6">
            <div class="whead"><h6><?php echo lang('Basic Information'); ?></h6><div class="clear"></div> </div>

            <div class="formRow">
                <div class="grid3"><label><?php echo lang('Image'); ?>:</label></div>
                <div class="grid9">
                    <input type="button" class="buttonM bBlue" value="<?php echo lang("Upload"); ?>" id="uploader" />
                    <input type="hidden" name="image" id="image" value="<?php echo is_file($file = set_value('image',isset($slider) ? $slider->image : false)) ? $file : ''; ?>" />

                </div>
                <div class="clear"></div>
            </div>

            <div class="formRow">
                <div class="grid3"><label><?php echo lang('Title'); ?>:<span class="req">*</span></label></div>
                <div class="grid9"><input type="text" name="title" id="title" class="validate[required]" value="<?php echo set_value('title',isset($slider) ? $slider->title : ''); ?>" /></div>
                <div class="clear"></div>
            </div>

            <div class="formRow">
                <div class="grid3"><label><?php echo lang('Intro'); ?>:<span class="req"></span></label></div>
                <div class="grid9"><input type="text" name="intro" id="intro" value="<?php echo set_value('intro',isset($slider) ? $slider->intro : ''); ?>" /></div>
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
        </div>
        <div class="widget grid6">
            <div class="whead"><h6><?php echo lang('History'); ?></h6><div class="clear"></div> </div>

            <div class="formRow">
                <div class="grid12">
                    <?php if(is_file($file)): ?>
                        <br /><img class="l-preview" src="<?php echo file_url($file); ?>" />
                    <?php endif; ?>
                    <div class="contentProgress mt8"><div class="barB" id="bar"></div></div>
                </div>
                <div class="clear"></div>
            </div>
            <div class="formRow">
                <div class="grid3"><label><?php echo lang('Created By'); ?>:</label></div>
                <div class="grid9">
                    <?php echo (isset($slider) AND $fullname = $this->auth->name($slider->created_by)) ? anchor(SITE_AREA.'/settings/users/profile/'.$slider->created_by,$fullname).' '.lang('at').' '.datetimeToStr($slider->created_on) : ''; ?>
                </div>
                <div class="clear"></div>
            </div>
            <div class="formRow">
                <div class="grid3"><label><?php echo lang('Modify By'); ?>:</label></div>
                <div class="grid9">
                    <?php echo (isset($slider) AND $fullname = $this->auth->name($slider->modify_by)) ? anchor(SITE_AREA.'/settings/users/profile/'.$slider->modify_by,$fullname).' '.lang('at').' '.datetimeToStr($slider->modify_on) : ''; ?>
                </div>
                <div class="clear"></div>
            </div>
            <div class="formRow">
                <div class="grid12"><input type="submit" name="submit" value="<?php echo lang("Save"); ?>" class="buttonM bBlue formSubmit" /></div><div class="clear"></div>
            </div>
        </div>
    </div>
<?php echo form_close(); ?>