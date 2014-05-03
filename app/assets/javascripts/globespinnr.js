function fixDropdown() {
    var maxheight = $(window).height() - 40;
    var dropdown = $('ul.dropdown');
    dropdown.css({ 'max-height': maxheight });
}

$(window).on('load', fixDropdown);
$(window).on('resize', fixDropdown);

