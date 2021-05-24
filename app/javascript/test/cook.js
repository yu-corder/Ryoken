$(document).on('turbolinks:load', function() {
    $(function() {
        $('#bars').on('click', function() {
            $('.global-nav').toggleClass('nav-active');
        });
        $('.user-menu-list').on('click', function() {
            $('.user-menu-hide:not(:animated)').slideToggle();
            $('.user-menu-fa-down').toggleClass('fa-active');

        })
        $('.user-menu-list-2').on('click', function() {
            $('.user-menu-hide-2:not(:animated)').slideToggle();
            $('.user-menu-fa-down-2').toggleClass('fa-active');

        })
        $('.nav-close').on('click', function() {
            $('.global-nav').toggleClass('nav-active');
        });
        $('.fa-times-circle').on('click', function() {
            $('#message').addClass('hide-message');
        })
        $('.image').on('click', function() {
            $(this).parent("div").prev("div").addClass('show');
            $(this).parent("div").prev("div").children("img").addClass('show');
            var imageSrc = $(this).attr('src');
            $(this).parent("div").prev("div").children("img").attr('src', imageSrc);
        });
        $('.modal-wrapper').on('click', function(){
            if (this.classList.contains('show')) {
                this.classList.remove('show');
                $(this).children("img").removeClass('show');
            }
        })
    });
    if ($("nav.pagination a[rel=next]").length){
        $(".cooks-container").infiniteScroll({
          path: "nav.pagination a[rel=next]",
          append: ".cooks-box",
          prefill: false,
          history: false,
          hideNav: "nav.pagination",
          status: '.page-load-status'
        })
    }
    if ($("nav.pagination a[rel=next]").length){
        $(".comment-area").infiniteScroll({
          path: "nav.pagination a[rel=next]",
          append: ".comment-box",
          prefill: false,
          history: false,
          hideNav: "nav.pagination",
          status: '.page-load-status'
        })
    }
});
