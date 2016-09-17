class @BooksController

  index: ->
    swiper = new Swiper('.swiper-container', {
      pagination: '.swiper-pagination',
      nextButton: '.swiper-button-next',
      prevButton: '.swiper-button-prev',
      paginationClickable: true,
      spaceBetween: 30,
      centeredSlides: true,
      autoplay: 2000,
      autoplayDisableOnInteraction: false
    });

  search: ->
    $('input').iCheck
      checkboxClass: 'icheckbox_flat-green',
      radioClass: 'iradio_flat-green'
