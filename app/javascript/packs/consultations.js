$(function(){
  $('#consultation_pregnant').click(function(){
  if($("#consultation_pregnant").prop('checked')) {
      $('#consultation_child_age').prop('disabled', true);
      $('#consultation_child_moon_age').prop('disabled', true);
      console.log('foo')
    }
    else {
      $('#consultation_child_age').prop('disabled', false);
      $('#consultation_child_moon_age').prop('disabled', false);
      console.log('bar')
    }
  })
});
