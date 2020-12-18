document.addEventListener("turbolinks:load"
, function () {
  $(function(){
    $('#vote_pregnant').click(function(){
    if($("#vote_pregnant").prop('checked')) {
        $('#vote_child_age').prop('disabled', true);
        $('#vote_child_moon_age').prop('disabled', true);
        console.log('foo');
      }
      else {
        $('#vote_child_age').prop('disabled', false);
        $('#vote_child_moon_age').prop('disabled', false);
      }
    })
  });
})
