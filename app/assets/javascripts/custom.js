jQuery(document).ready(function () {
    jQuery('.carousel').carousel();
    $('.btn-navbar').on('click',function(event) {
    $('.nav-collapse').collapse('toggle');
    });
});

// Hacky bootstrap mobile drop-down fix: http://stackoverflow.com/a/25041753/3311366
$(function() {
  return $("a.dropdown-toggle:not(.multiselect)").click(function(e) {
    $("ul.dropdown-menu:not(.multiselect-container)").css("display", "none");
    $(this).next("ul.dropdown-menu").css("display", "block");
    return e.stopPropagation();
  });
});

$(document).on('click click.dropdown.data-api', function(e) {
  if (!$(e.target).closest('.dropdown, .multiselect-container').length) {
    return $("ul.dropdown-menu:not(.multiselect-container)").css("display", "none");
  }
});