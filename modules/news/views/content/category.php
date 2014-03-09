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
                    <input type="text" name="category_name" id="category_name" class="validate[required]" value="<?php echo set_value('category_name',isset($category) ? $category->category_name : ''); ?>" />
                </div>
                <div class="clear"></div>
            </div>

            <div class="formRow">
                <div class="grid3"><label><?php echo lang('Parent'); ?>:</label></div>
                <div class="grid9">
                    <select name="parent_id" id="parent_id" class="validate[required]">
                        <option value="0">-- -- Root -- --</option>
                        <?php echo $this->news_category_model->buildOptionsCatalogHTML(isset($category) ? $category->category_id : false); ?>
                    </select>
                    <script type="text/javascript">
                        cbo_Selected('parent_id','<?php echo set_value('parent_id',isset($category) ? $category->parent_id : 0); ?>');
                    </script>
                </div>
                <div class="clear"></div>
            </div>

            <div class="formRow">
                <div class="grid3"><label><?php echo lang('Image'); ?>:</label></div>
                <div class="grid9">
                    <input type="button" class="buttonM bBlue" value="<?php echo lang("Upload"); ?>" id="uploader" />
                    <input type="hidden" name="category_image" id="category_image" value="<?php echo is_file($file = set_value('category_image',isset($category) ? $category->category_image : false)) ? $file : ''; ?>" />
                    <?php if(is_file($file)): ?>
                        <br /><img class="preview" src="<?php echo file_url($file); ?>" />
                    <?php endif; ?>
                    <div class="contentProgress mt8"><div class="barB" id="bar"></div></div>
                </div>
                <div class="clear"></div>
            </div>

            <div class="formRow">
                <div class="grid3"><label><?php echo lang('Description'); ?>:</label></div>
                <div class="grid9">
                    <textarea name="category_description" id="category_description" class="validate[required]"><?php echo set_value('category_description',isset($category) ? $category->category_description : ''); ?></textarea>
                </div>
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
                        cbo_Selected('active','<?php echo set_value('active',isset($category) ? $category->active : 1); ?>');
                    </script>
                </div>
                <div class="clear"></div>
            </div>

            <div class="formRow">
                <div class="grid3"><label><?php echo lang('Meta Title'); ?>:</label></div>
                <div class="grid9">
                    <input type="text" name="category_meta_title" id="category_meta_title" class="validate[required]" value="<?php echo set_value('category_meta_title',isset($category) ? $category->category_meta_title : ''); ?>" />
                </div>
                <div class="clear"></div>
            </div>

            <div class="formRow">
                <div class="grid3"><label><?php echo lang('Meta Keyword'); ?>:</label></div>
                <div class="grid9">
                    <input type="text" name="category_meta_keyword" id="category_meta_keyword" class="validate[required] tags" value="<?php echo set_value('category_meta_keyword',isset($category) ? $category->category_meta_keyword : ''); ?>" />
                </div>
                <div class="clear"></div>
            </div>

            <div class="formRow">
                <div class="grid3"><label><?php echo lang('Meta Description'); ?>:</label></div>
                <div class="grid9">
                    <textarea name="category_meta_description" id="category_meta_description" class="validate[required]"><?php echo set_value('category_meta_description',isset($category) ? $category->category_meta_description : ''); ?></textarea>
                </div>
                <div class="clear"></div>
            </div>

            <div class="formRow">
                <div class="grid12">
                    <?php if(isset($category)): ?>
                    <input type="submit" name="submit" value="<?php echo lang("Save"); ?>" class="buttonM bBlue formSubmit" />
                    <?php endif; ?>
                    <input type="submit" name="submit" value="<?php echo lang("Create New"); ?>" class="buttonM bBlue formSubmit" style="margin-right:20px;" />
                    <?php if(isset($category)): ?>
                    <a href="<?php echo site_url(MODULE_URL.'/category/'.$category->category_id.'/delete    '); ?>" onclick="return confirm('<?php echo lang('Are you sure?'); ?>');" class="buttonM bRed formSubmit" style="margin-right:20px;"><?php echo lang('Delete'); ?></a>
                    <?php endif; ?>
                </div>
                <div class="clear"></div>
            </div>
        </div>
    </div>
    <?php echo form_close(); ?>
    <div class="widget grid8">
        <div class="whead"><h6><?php echo lang('Order Category'); ?></h6><div class="clear"></div> </div>
        <div class="body">

            <div class="dd" id="nestable">
                <?php echo $this->news_category_model->buildListCatalogHTML(); ?>
            </div>

        </div>
    </div>
</div>