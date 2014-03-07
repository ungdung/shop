<?php if (validation_errors()) : ?>
<div class="nNote error">
    <p>Please fix the following errors :</p>
    <?php echo validation_errors(); ?>
</div>
<?php endif; ?>

<?php echo form_open($this->uri->uri_string(), 'id="validate" autocomplete="off"'); ?>
<div class="fluid" id="webConfig">
    <div class="widget grid12">

        <div class="whead">
            <h6><?php echo lang("Basic Information"); ?></h6>
            <div class="clear"></div>
        </div>

        <div class="formRow">
            <div class="grid3"><label><?php echo lang("Site Title"); ?>:</label></div>
            <div class="grid9"><input type="text" name="title" id="title" class="validate[required]" value="<?php echo set_value('title',$settings['meta.title']); ?>" /></div>
            <div class="clear"></div>
        </div>

        <div class="formRow">
            <div class="grid3"><label><?php echo lang("Meta Keyword"); ?>:</label></div>
            <div class="grid9"><input type="text" name="keyword" id="keyword" class="validate[required] tags" value="<?php echo set_value('keyword',$settings['meta.keyword']); ?>" /></div>
            <div class="clear"></div>
        </div>

        <div class="formRow">
            <div class="grid3"><label><?php echo lang("Meta Description"); ?>:</label></div>
            <div class="grid9">
                <textarea name="description" id="description" class="validate[required]"><?php echo set_value('description',$settings['meta.description']); ?></textarea>
            </div>
            <div class="clear"></div>
        </div>

        <div class="formRow">
            <div class="grid12"><input type="submit" name="webConfig" value="<?php echo lang("Submit"); ?>" class="buttonM bBlue formSubmit" /></div><div class="clear"></div>
        </div>
    </div>
</div>

<?php echo form_close(); ?>




<?php echo form_open($this->uri->uri_string().'#maintenance', 'id="validate" autocomplete="off"'); ?>
<div class="fluid" id="maintenance" style="display: none;">
    <div class="widget grid12">

        <div class="whead">
            <h6><?php echo lang("Maintenance"); ?></h6>
            <div class="clear"></div>
        </div>

        <div class="formRow">
            <div class="grid3"><label><?php echo lang("Mode"); ?>:</label></div>
            <div class="grid9">
                <select name="opMaintenance" id="opMaintenance" class="validate[required]">
                    <option value="0"><?php echo lang("Off"); ?></option>
                    <option value="1"><?php echo lang("On"); ?></option>
                </select>
                <script type="text/javascript">
                    cbo_Selected('opMaintenance','<?php echo set_value('opMaintenance',$settings['maintenance.mode']); ?>');
                </script>
            </div>
            <div class="clear"></div>
        </div>

        <div class="formRow">
            <div class="grid3"><label><?php echo lang('Content'); ?>:<span class="req">*</span></label></div>
            <div class="grid9">
                <?php echo $this->ckeditor->editor("maintenance_content",html_entity_decode(set_value('maintenance_content',$settings['maintenance.content']))); ?>
            </div>
            <div class="clear"></div>
        </div>


        <div class="formRow">
            <div class="grid12"><input type="submit" name="btnMaintenance" value="<?php echo lang("Submit"); ?>" class="buttonM bBlue formSubmit" /></div><div class="clear"></div>
        </div>
    </div>
</div>

<?php echo form_close(); ?>