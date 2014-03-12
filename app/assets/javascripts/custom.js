jQuery(document).ready(function () {
    jQuery('.carousel').carousel();
    $('.btn-navbar').on('click',function(event) {
    $('.nav-collapse').collapse('toggle');
    });
});
