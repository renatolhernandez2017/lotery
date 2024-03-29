// This is a manifest file that'll be compiled into select2.js, which will include all the files
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
//= require select2
//= require select2_locale_pt-BR
$(document).ready(function(){
  select2();
});

function select2() {
  $(".select2").select2({
    allowClear:   true,
    language:     "pt-BR",
    placeholder:  "Selecione o usuário aqui...",
    theme:        "bootstrap",
    width:        "100%"
  });
}
