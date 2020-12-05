$(function(){
  $('input[id="consultation_pregnant"]').change(function() {
    let val = $(this).prop('disabled');
    if (val == 1) {
      $('#consultation_child_age').prop('disabled', true);
      $('#consultation_child_moon_age').prop('disabled', true);
      console.log('foo')
    } else {
      $('#consultation_child_age').prop('disabled', false);
      $('#consultation_child_moon_age').prop('disabled', false);
      console.log('bar')
    }
  })
})
