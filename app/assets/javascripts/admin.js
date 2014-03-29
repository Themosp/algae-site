// This is a manifest file that'll be compiled into admin.js, which will include all the files
// listed below.
//
// Any JavaScript file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require ckeditor/override
//= require ckeditor/init
//= require_self

$(function () {
    function randomString(length) {
        var chars = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXTZabcdefghiklmnopqrstuvwxyz'.split('');

        if (!length) {
            length = Math.floor(Math.random() * chars.length);
        }

        var str = '';
        for (var i = 0; i < length; i++) {
            str += chars[Math.floor(Math.random() * chars.length)];
        }
        return str;
    }

    $('textarea[role="wysiwyg"]').each(function (index, element) {
        if (!$(element).attr('id')) {
            $(element).attr('id', randomString(8))
        }
        CKEDITOR.replace($(element).attr('id'));
    });

    $('[data-polymorphic="true"]').each(function (index, element) {
        var $element = $(element),
            id_field = $element.find('[data-polymorphic="id"]'),
            type_field = $element.find('[data-polymorphic="type"]'),
            master_select = $element.find('[data-polymorphic="master"]');

        master_select.on('change', function () {
            var selectedOption = master_select.find('option:selected'),
                selectedOptionValue = selectedOption.val(),
                selections = selectedOptionValue.split('::'),
                selectedType = selections[0],
                selectedId = selections[1];

            type_field.val(selectedType);
            id_field.val(selectedId);
        });
    });
});
