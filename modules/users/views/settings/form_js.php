
var uploader = new plupload.Uploader({
    runtimes : 'html5,flash,silverlight,html4',
    browse_button : 'uploader',
    url : '<?php echo site_url('uploader'); ?>',
    flash_swf_url : '<?php echo Template::theme_url('js/plugins/plupload/Moxie.swf'); ?>',
    silverlight_xap_url : '<?php echo Template::theme_url('js/plugins/plupload/Moxie.xap'); ?>',
    multipart_params : {folder: 'avatars'},
    //if multiple upload. enable this.
    /*
    multi_selection: true,
    max_file_count:false,
    */
    filters : {
        max_file_size : '1mb',
        mime_types: [
            {title : "Image files", extensions : "<?php echo system_item('upload.images'); ?>"}
            /*
            {title : "Document files", extensions : "<?php echo system_item('upload.documents'); ?>"},
            {title : "Media files", extensions : "<?php echo system_item('upload.media'); ?>"},
            */
        ]
    },

    init: {
        FilesAdded: function(up, files) {
            $('.contentProgress #bar').css('width','0%');
            $('.contentProgress').show();
            uploader.start();
        },
        UploadProgress: function(up, file) {
            $('.contentProgress #bar').css('width',file.percent+'%');
        },
        Error: function(up, err) {
            $.jGrowl(err.message);
        },
        FileUploaded:function(up,files,response)
        {
            $('.contentProgress').hide();
            try {

                var res = JSON.parse(response.response);
                if(res.status=='success') {
                    //single upload
                    $('#avatar').val(res.file_url);
                    if($('.preview').get(0)) {
                        $('.preview').attr('src','<?php echo file_url(); ?>'+res.file_url);
                    } else {
                        $('#avatar').after('<br /><img class="preview" src="<?php echo file_url(); ?>'+res.file_url+'" />');
                    }
                }
                else {
                    $.jGrowl(res.error);
                }

            }
            catch(e) {
                console.log(response.response);
                $.jGrowl('Response Error');
            }
        }
    }
});

uploader.init();
