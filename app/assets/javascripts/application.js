// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require jquery
//= require jquery-ui/core
//= require jquery-ui/widget
//= require jquery-ui/position
//= require jquery-ui/widgets/autocomplete
//= require jquery-ui/widgets/menu
//= require twitter/bootstrap/dropdown
//= require jasny-bootstrap.min
//= require activestorage
//= require turbolinks
//= require toastr
//= require_tree .

$( document ).on('turbolinks:load', function() {
  $('#term').autocomplete({
    source: "/contacts/autocomplete",
    minlength: 3,
    select: function (event, ui) {
      $('#term').val(ui.item.value);
      $(this).closest('form').submit();
    }
  })
});

$(document).on('click', '.pagination a[data-remote=true], a.list-group-item', function() {
  history.pushState({}, '', $(this).attr('href'));
});

$(window).on('popstate', function() {
  $.get(document.location.href);
});