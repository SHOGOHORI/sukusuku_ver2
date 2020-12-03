$(document).ready(function() {
  $('.consultation_new').on('drop', function(e) {
    e.preventDefault();
    f = e.originalEvent.dataTransfer.files[0];
    var formData = new FormData();
    formData.append('image', f);

    $.ajax({
      url  : "/images",
      type : "POST",
      data : formData,
      dataType    : "json",
      contentType: false,
      processData: false
    })
    .done(function(data, textStatus, jqXHR){
      setImage(data['name'], data['url'])
    })
    .fail(function(jqXHR, textStatus, errorThrown){
      alert("fail");
    });
  });

  function setImage(name, url) {
    var textarea = document.querySelector('textarea');
    var sentence = textarea.value;
    var len      = sentence.length;
    var pos      = textarea.selectionStart;
    var before   = sentence.substr(0, pos);
    var word     = '![' + name + '](' + url + ')';
    var after    = sentence.substr(pos, len);

    sentence = before + word + after;

    textarea.value = sentence;
  }
});
