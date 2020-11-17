$(function() {
  $('#children').on('cocoon:after-insert', function() {
    check_to_hide_or_show_add_link();
  });

  $('#children').on('cocoon:after-remove', function() {
    check_to_hide_or_show_add_link();
  });

  check_to_hide_or_show_add_link();

  function check_to_hide_or_show_add_link() {
    if ($('#children .nested-fields').length == 3) {
      $('#add-child a').hide();
    } else {
      $('#add-child a').show();
    }
  }
})
