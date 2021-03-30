$(document).on('turbolinks:load', function() {
    $(function() {
        $('#bars').on('click', function() {
            $('.global-nav').toggleClass('nav-active');
        });
    });
    $(function() {
        $('.nav-close').on('click', function() {
            $('.global-nav').toggleClass('nav-active');
        });
    });
});
