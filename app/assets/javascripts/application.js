// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
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
//= require_tree .

$(function() {
  $('#check-form').on('submit', function(e) {
    var $form = $(this);
    var stopSubmit = !($form.find('select').val() && $form.find(':text').val());
    if(stopSubmit) return false;
  }).on('ajax:success', function() {
    $('#bonus-valid').fadeIn();
  }).on('ajax:error', function(_, xhr) {
    if(xhr.status == 403) $('#bonus-not-sold').fadeIn();
    else if(xhr.status == 404) $('#bonus-not-found').fadeIn();
  }).on('ajax:beforeSend', function() {
    $('[data-alert]').hide();
  });
});
