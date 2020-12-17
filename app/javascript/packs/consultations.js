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
$(function(){
  $('#q_pregnant_eq').change(function(){
    if ($(this).val() == 1) {
      $('#q_child_age_eq').prop('disabled', true);
      $('#q_child_moon_age_eq').prop('disabled', true);
      } else {
      $('#q_child_age_eq').prop('disabled', false);
      $('#q_child_moon_age_eq').prop('disabled', false);
    }
  })
});


$(function() {
  $(document).on('click', '.comment_button', function() {
    $('.modal_wrapper').show();
    $('.comment_modal').fadeIn();
  });

  $(document).on('click', '.reply_button', function() {
    $('.modal_wrapper').show();
    $('.reply_modal').fadeIn();
    let comment_id = $('.reply_button').attr('value');
    $('.reply_hidden').val(comment_id);
  });

  $(document).on('click', '.modal_wrapper, .fa_wrapper', function() {
    $('.modal_wrapper').fadeOut();
    $('.comment_modal').fadeOut();
    $('.comment_modal_content').fadeOut();
    $('.reply_modal').fadeOut();
    $('.reply_modal_content').fadeOut();
  })
});
