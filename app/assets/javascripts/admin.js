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

        if (! length) {
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

    $('[role="polymorphic"]').each(function(index, element) {
        var $element = $(element),
            types = $element.find('[role="polymorphic_type"]'),
            ids = $element.find('[role="polymorphic_id"]');

        ids.on('change', function () {
            var selectedOption = ids.find('option:selected'),
                selectedGroup = selectedOption.closest('optgroup'),
                selectedTypeLabel = selectedGroup.attr('label'),
                selectedTypeOption = types.find('option').filter(function () { return $(this).text() == selectedTypeLabel; }).first().val();

            types.val(selectedTypeOption);
        });
    })
});
