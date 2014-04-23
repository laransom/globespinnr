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

function fixDropdown() {
    var maxheight = $(window).height() - 20;
    var dropdown = $('ul.dropdown');
    dropdown.css({ 'max-height': maxheight });
    console.log('called fix dropdown');
};
$(window).on('load', fixDropdown);
$(window).on('resize', fixDropdown);
