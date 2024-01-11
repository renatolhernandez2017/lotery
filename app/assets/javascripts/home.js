$(document).ready(function() {
  if ($('#messages').length > 0) {
    var total = $('#total')[0].innerText.replace(/R\$\s*/, '');

    // if (total === '0,00') {
    //   $('#send_message').hide('fast');
    //   $('#no_send_message').show('fast');
    // }
    // else {
    //   $('#send_message').show('fast');
    //   $('#no_send_message').hide('fast');
    // }
  }
});
