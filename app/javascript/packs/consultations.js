document.addEventListener("turbolinks:load"
, function () {
  $(function(){
    $('#consultation_pregnant').click(function(){
    if($("#consultation_pregnant").prop('checked')) {
        $('#consultation_age').prop('disabled', true);
        $('#consultation_moon_age').prop('disabled', true);
      }
      else {
        $('#consultation_age').prop('disabled', false);
        $('#consultation_moon_age').prop('disabled', false);
      }
    })
  });
})
document.addEventListener("turbolinks:load"
, function () {
  $(function(){
    $('#query_pregnant_eq').change(function(){
      if ($(this).val() == 1) {
        $('#query_child_age_moon_age_gteq').prop('disabled', true);
        $('#query_child_age_moon_age_lteq').prop('disabled', true);
      } else {
        $('#query_child_age_moon_age_gteq').prop('disabled', false);
        $('#query_child_age_moon_age_lteq').prop('disabled', false);
      }
    })
    $('.pregnant_eq').change(function(){
      if ($(this).val() == 1) {
        $('.child_age_moon_age').prop('disabled', true);
      } else {
        $('.child_age_moon_age').prop('disabled', false);
      }
    })
  });
})

document.addEventListener("turbolinks:load"
, function () {
  $(function() {
    $('input:radio[name="model"]').change(function(){
      if ($('#vote_search').prop('checked')) {
        $('.category .vote_search').show();
        $('.category .consultation_search').hide();
        console.log('foo');
      } else {
        $('.category .vote_search').hide();
        $('.category .consultation_search').show();
        console.log('bar');
      }
    });
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
    var comment_id = $(this).attr('value');
    $('.reply_hidden').val(comment_id);
    console.log('foo');
  });

  $(document).on('click', '.modal_wrapper, .fa_wrapper', function() {
    $('.modal_wrapper').fadeOut();
    $('.comment_modal').fadeOut();
    $('.comment_modal_content').fadeOut();
    $('.reply_modal').fadeOut();
    $('.reply_modal_content').fadeOut();
  })
});
