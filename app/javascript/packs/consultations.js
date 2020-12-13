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
