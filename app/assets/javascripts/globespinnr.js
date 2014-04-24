function fixDropdown() {
    var maxheight = $(window).height() - 20;
    var dropdown = $('ul.dropdown');
    dropdown.css({ 'max-height': maxheight });
}

$(window).on('load', fixDropdown);
$(window).on('resize', fixDropdown);
