// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require jquery.purr
//= require best_in_place
//= require_tree .

$(document).ready(function() {
    /* Activating Best In Place */
    jQuery(".best_in_place").best_in_place();

    /* Fading the flash */
    $('#notice').delay(2500).fadeOut();

    /* When deleted, things go away */
    $('.delete_button').bind('ajax:success', function() {
        $(this).closest('tr').fadeOut();
    });
});

