<?php if (validation_errors()) : ?>
    <div class="nNote error">
        <p>Please fix the following errors :</p>
        <?php echo validation_errors(); ?>
    </div>
<?php endif; ?>

<div class="fluid">
    <?php echo form_open($this->uri->uri_string(), 'id="validate"'); ?>
    <div class="grid4">
        <div class="widget">
            <div class="whead"><h6><?php echo lang('Basic Information'); ?></h6><div class="clear"></div> </div>

            <div class="formRow">
                <div class="grid3"><label><?php echo lang('Name'); ?>:</label></div>
                <div class="grid9">
                    <input type="text" name="name" id="name" class="validate[required]" value="<?php echo set_value('name',isset($menu) ? $menu->name : ''); ?>" />
                </div>
                <div class="clear"></div>
            </div>

            <div class="formRow">
                <div class="grid3"><label><?php echo lang('URL'); ?>:</label></div>
                <div class="grid9">
                    <input type="text" name="url" id="url" value="<?php echo set_value('name',isset($menu) ? $menu->url : ''); ?>" />
                </div>
                <div class="clear"></div>
            </div>

            <div class="formRow">
                <div class="grid3"><label><?php echo lang('Image'); ?>:</label></div>
                <div class="grid9">
                    <input type="button" class="buttonM bBlue" value="<?php echo lang("Upload"); ?>" id="uploader" />
                    <input type="hidden" name="image" id="image" value="<?php echo is_file($file = set_value('image',isset($menu) ? $menu->image : false)) ? $file : ''; ?>" />
                    <?php if(is_file($file)): ?>
                        <br /><img class="preview" src="<?php echo file_url($file); ?>" />
                    <?php endif; ?>
                    <div class="contentProgress mt8"><div class="barB" id="bar"></div></div>
                </div>
                <div class="clear"></div>
            </div>

            <div class="formRow">
                <div class="grid3"><label><?php echo lang('Target'); ?>:</label></div>
                <div class="grid9">
                    <select name="target" id="target" class="validate[required]">
                        <option value="_self">Self</option>
                        <option value="_top">Top</option>
                        <option value="_blank">Blank</option>
                    </select>
                    <script type="text/javascript">
                        cbo_Selected('target','<?php echo set_value('name',isset($menu) ? $menu->target : ''); ?>');
                    </script>
                </div>
                <div class="clear"></div>
            </div>

            <div class="formRow">
                <div class="grid3"><label><?php echo lang('Parent'); ?>:</label></div>
                <div class="grid9">
                    <select name="parent_id" id="parent_id" class="validate[required]">
                        <option value="0">-- -- Root -- --</option>
                        <?php echo $this->menu_model->buildOptionsCatalogHTML(isset($menu) ? $menu->menu_id : false); ?>
                    </select>
                    <script type="text/javascript">
                        cbo_Selected('parent_id','<?php echo set_value('parent_id',isset($menu) ? $menu->parent_id : 0); ?>');
                    </script>
                </div>
                <div class="clear"></div>
            </div>

            <div class="formRow">
                <div class="grid12">
                    <?php if(isset($menu)): ?>
                        <input type="submit" name="submit" value="<?php echo lang("Save"); ?>" class="buttonM bBlue formSubmit" />
                    <?php endif; ?>
                    <input type="submit" name="submit" value="<?php echo lang("Create New"); ?>" class="buttonM bBlue formSubmit" style="margin-right:20px;" />
                    <?php if(isset($menu)): ?>
                        <a href="<?php echo site_url(MODULE_URL.'/index/'.$menu->menu_id.'/delete    '); ?>" onclick="return confirm('<?php echo lang('Are you sure?'); ?>');" class="buttonM bRed formSubmit" style="margin-right:20px;"><?php echo lang('Delete'); ?></a>
                    <?php endif; ?>
                </div>
                <div class="clear"></div>\
            </div>
        </div>
    </div>
    <?php echo form_close(); ?>
    <div class="widget grid8">
        <div class="whead"><h6><?php echo lang('Order Menu'); ?></h6><div class="clear"></div> </div>
        <div class="body">

            <div class="dd" id="nestable">
                <?php echo $this->menu_model->buildListCatalogHTML(); ?>
            </div>

        </div>
    </div>
</div>