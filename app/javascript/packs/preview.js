$(function() {
  $('#preview').on('click', function() {
    let text = $('#md-textarea').val();
    if (text == "") {
      return;
    }
    $.ajax({
      url: '/api/consultations/preview',
      type: 'GET',
      dataType: 'json',
      data: { body: text }
    })
    .done(function(html) {
      $('#md-textarea').parent().css('display', 'none');
      $('#preview-area').append(html.body);
      $('#markdown').removeClass('disabled');
      $('#preview').addClass('disabled');
      console.log('foo')
    })
    .fail(function() {
      alert('failed for markdown preview');
    })
  })

  $('#markdown').on('click', function() {
    $('#md-textarea').parent().css('display', '');
    $('#preview-area').empty();
    $('#preview').removeClass('disabled');
    $('#markdown').addClass('disabled');
  })
})
