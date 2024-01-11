// All this logic will automatically be available in via-cep.js.
//
$(document).ready(function(){
  setup_cep();
  setup_custom_cep();
});

function setup_cep(){
  $('.via-cep').on('change', function() {

    var cep    = this.value;
    var parent = $(this).closest(".address-container");

    if (cep.length > 0) {
      via_cep(cep, parent);
    }
  });
}

function via_cep(cep, parent) {
  // show_loading();
  if( cep == null )
    return;

  var url = 'https://viacep.com.br/ws/' + cep + '/json/';

  $.ajax({
    url,
    type: 'GET',
    crossDomain: true,
    dataType: 'jsonp',
    success: function(data) {
      var address  = "";
      var city     = "";
      var state    = "AC";
      var district = "";

      if (data.logradouro !== undefined) {
        address  = data.logradouro;
        city     = data.localidade;
        state    = data.uf;
        district = data.bairro;
        country  = 'Brasil';
      }

      parent.find('.via-cep-address').val(address);
      parent.find('.via-cep-district').val(district);
      parent.find('.via-cep-city').val(city);
      parent.find('.via-cep-state').val(state);
      parent.find('.select2.via-cep-state').val(state).trigger('change.select2');
      parent.find('.via-cep-country').val(country).trigger('change.select2');
      parent.find('.via-cep-address').focus();


    },
    error: function(e) {
      console.log("Não foi possível localizar o CEP informado! Erro: " + e);
    },
    beforeSend: function(page) {
      page.setRequestHeader('Content-Type: application/json');
    }
  });

  // hide_loading();
}



function setup_custom_cep(){
  $('.custom-via-cep').on('change', function() {
    var cep = this.value;
    if (cep.length > 0) {
      custom_via_cep(cep);
    }
  });
}

function custom_via_cep(cep) {
    // show_loading();
    if( cep == null )
    return;

    var url = 'https://viacep.com.br/ws/' + cep + '/json/';

    $.ajax({
        url,
        type: 'GET',
        crossDomain: true,
        dataType: 'jsonp',
        success: function(data) {
          var address  = "";
          var city     = "";
          var state    = "AC";
          var district = "";

          if (data.logradouro !== undefined) {
            address  = data.logradouro;
            city     = data.localidade;
            state    = data.uf;
            district = data.bairro;
            country  = 'Brasil';
          }
          $('.custom-via-cep-address').val(address);
          $('.custom-via-cep-district').val(district);
          $('.custom-via-cep-city').val(city);
          $('.custom-via-cep-state').val(state);
        },
        error: function(e) {
          console.log("Não foi possível localizar o CEP informado! Erro: " + e);
        },
        beforeSend: function(page) {
          page.setRequestHeader('Content-Type: application/json');
        }
    });

    // hide_loading();
}
