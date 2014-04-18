$(document).ready(function() {
  var str = '';
  $('#country').change(function() {
    $('select option:selected').each(function() {
      str = $(this).val();
    });
  });


  $('#submit').click(function() {
    var path = $('#country').val();
    window.location.assign("/locations/" + str);
  });
});

