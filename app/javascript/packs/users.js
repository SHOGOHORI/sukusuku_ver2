let number = 2;

$(document).ready(function() {
  const resetNumber = () => {
    $('.childNumber').each((i, el) => {
      el.innerText = i + 1;
    })
    $('.childNumber').each((i, el) => {
      el.innerText = i + 1;
    })
  }
  $(function(){
    $('.profile_create')
      .on('cocoon:after-insert', resetNumber)
      .on('cocoon:after-remove', resetNumber)
  });

  const check_to_hide_or_show_add_link = () => {
    if ($('#children .nested-fields').length == 3) {
      $('#children .links').hide();
    } else {
      $('#children .links').show();
    }
  }

  $(function() {
    $('#children').on('cocoon:after-insert', function() {
      check_to_hide_or_show_add_link();
    });

    $('#children').on('cocoon:after-remove', function() {
      check_to_hide_or_show_add_link();
    });
  })
})
