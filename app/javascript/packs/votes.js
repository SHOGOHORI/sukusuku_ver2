document.addEventListener("turbolinks:load"
, function () {
  $(function(){
    $('#vote_pregnant').click(function(){
    if($("#vote_pregnant").prop('checked')) {
        $('#vote_age').prop('disabled', true);
        $('#vote_moon_age').prop('disabled', true);
        console.log('foo');
      }
      else {
        $('#vote_age').prop('disabled', false);
        $('#vote_moon_age').prop('disabled', false);
      }
    })
  });
  const resetNumber = () => {
    $('.itemNumber').each((i, el) => {
      el.innerText = i + 1;
    })
    $('#vote_items .item_hidden').each((i, el) => {
      el.value =  i + 1;
    })
  }
  $(function(){
    $('#vote_items')
      .on('cocoon:after-insert', resetNumber)
      .on('cocoon:after-remove', resetNumber)
  });

  const check_to_hide_or_show_add_link = () => {
    if ($('#vote_items .nested-fields').length == 4) {
      $('#vote_items .links').hide();
    } else {
      $('#vote_items .links').show();
    }
  }
  $(function() {
    $('#vote_items').on('cocoon:after-insert', function() {
      check_to_hide_or_show_add_link();
    });

    $('#vote_items').on('cocoon:after-remove', function() {
      check_to_hide_or_show_add_link();
    });
  })
})
document.addEventListener("turbolinks:load"
, function () {
  $(document).ready(function() {
    $('.aggregate').fadeIn(700);
  });
})
