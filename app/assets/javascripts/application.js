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

function setup() {
    /* Activating Best In Place */
    $(".best_in_place").best_in_place()
    /* When deleted, things go away */
    $('.delete_button').bind('ajax:success', function() {
            $(this).closest('tr').fadeOut()
    })
}

$(document).ready(function(){
    setup()
    /* Hiding the flash if empty */
    $('#notice:empty').hide()
    /* Fading the flash */
    $('#notice').delay(2500).fadeOut()
})

function refresh_flash(flash){
    $('#notice').html(flash)
    $('#notice').show()
    $('#notice').delay(2500).fadeOut()
}
function flash_green(flash){
    $('#notice').css('backgroundColor', '#CFC')
    refresh_flash(flash)
}
function flash_red(flash){
    $('#notice').css('backgroundColor', '#FCC')
    refresh_flash(flash)
}