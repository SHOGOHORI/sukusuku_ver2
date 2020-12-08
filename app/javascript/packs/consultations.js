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
    if ($(this).hasClass('sign_up_button')) {
      $('.sign_up_modal').show();
    } else {
      $('.sign_in_modal').show();
    }
  });
});
