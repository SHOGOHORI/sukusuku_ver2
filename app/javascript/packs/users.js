let number = 2;

$(document).ready(function() {
  $(function(){
    $('.profile_create').on('cocoon:after-insert', function(e, insertedItem, originalEvent) {
      $('.childNumber:last').text(number);
      $('#children .hidden:last').val(number);
      number += 1
  });

  $('.profile_create').on('cocoon:after-remove', function(e, insertedItem, originalEvent) {
    number -= 1
  });
})})
