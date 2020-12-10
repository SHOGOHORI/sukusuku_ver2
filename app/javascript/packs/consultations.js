document.addEventListener("turbolinks:load"
, function () {
  $(function(){
    $('#consultation_pregnant').click(function(){
    if($("#consultation_pregnant").prop('checked')) {
        $('#consultation_child_age').prop('disabled', true);
        $('#consultation_child_moon_age').prop('disabled', true);
      }
      else {
        $('#consultation_child_age').prop('disabled', false);
        $('#consultation_child_moon_age').prop('disabled', false);
      }
    })
  });
})

$(function() {
  $(document).on('click', '.button', function() {
    $('.modal_wrapper').show();
    $('.modal').show();
  });
});

$(document).on('click', '.modal_wrapper, .fa_wrapper', function() {
  $('.modal_wrapper').hide();
  $('.modal').hide();
  $('.modal_content').hide();
})
