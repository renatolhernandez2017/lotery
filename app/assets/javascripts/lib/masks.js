$(function() {
  setMasks()
})

function setMasks() {
  $('.mask.money, .mask.percent').on('focusin', function() {
    if ($(this).val() == '0,00') $(this).val('')
  })

  $('.mask.money, .mask.percent').on('keyup', function() {
    var currency = $(this).val()
    if (currency.length >= 4)
      $(this).val(currency.replace(/^[0]+([\.\d])/, '$1'))
  })

  $('.mask.money, .mask.percent').on('focusout', function() {
    if ($(this).val() == '') $(this).val('0,00')
  })

  $('.mask.cpf').mask('000.000.000-00', { reverse: false });
  $('.mask.rg').mask('00.000.000-0', { reverse: false });
  $('.mask.cnpj').mask('00.000.000/0000-00', { reverse: true });
  $('.mask.cep').mask('00000-000', { reverse: false });
  $('.mask.ceps').mask('00000-000 0####-### #');
  $('.mask.home_phonenumber').mask('(00) 0000-0000', { reverse: false });
  $('.mask.mobile_phonenumber').mask('00 00000-0000', { reverse: false });
  $('.mask.datepicker').mask('00/00/0000', { reverse: false });
  $('.mask.time').mask('00:00', { reverse: false });
  $('.mask.state').mask('aa', { 'translation': { a: {pattern: /[a-zA-Z]/}} });
  $('.mask.money').mask("#.##0,00", { reverse: true });
  $('.mask.percent').mask("0.00", { reverse: true });
  $('.mask.percent_float').mask("000.00", { reverse: true });
  $('.mask.percent_integer').mask("000", { reverse: true });
  $('.mask.percent_integer.limited').mask("A00", { reverse: true, 'translation': { A: {pattern: /[0-9]/}} });
  $('.mask.limit.3-digits').mask("999", { reverse: true });
  $('.mask.phone_country_code').mask("+99", { reverse: false, default: '+55' });
  $('.mask.phone_area_code').mask("99", { reverse: false });
  $('.mask.phone_number').mask("00000-0000", { reverse: false });
}
