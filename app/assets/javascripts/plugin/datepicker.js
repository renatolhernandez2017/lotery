// This is a manifest file that'll be compiled into datepicker.js, which will include all the files
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
//= require plugin/moment
//= require lang/moment_pt-br
//= require plugin/daterangepicker
$(document).ready(function() {
  datepicker();
});

function datepicker() {
  $("input.datepicker").singleDatePicker();

  $("input.datepicker").on("apply.daterangepicker", function(e, picker) {
    picker.element.val(picker.startDate.format(picker.locale.format));
  });
}

$.fn.singleDatePicker = function() {
  return $(this).daterangepicker({
    autoUpdateInput:  false,
    drops:            "down",
    singleDatePicker: true,
    showDropdowns:    true,
  });
};
