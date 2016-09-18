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
    that = this
    $('input').iCheck
      checkboxClass: 'icheckbox_flat-green',
      radioClass: 'iradio_flat-green'
    $('#search_from_exist_data').iCheck('check')


    $('#search_from_aws_data').on('ifChecked', ->
      $('.key').attr('disabled', '')
      $('.key').css('background-color', '#dcdcdc')
      $('.keyword').focus()
    )

    $('#search_from_exist_data').on('ifChecked', ->
      $('.key').css('background-color', '')
      $('.key').removeAttr('disabled')
      $('.key').focus()
    )

    $('#data-search-btn').on('click', (e)->
      $('#data-search-btn').attr('disabled', '')
      window.setTimeout( "$('#book-search-form').submit()", 1000 );
    )

    new Vue
      el: "#bookSearchResult"
      data:
        book_id: ""
        user_id: ""
      created: ->
        this.init()
      methods:
        init: ->
          this.user_id = gon.user.id
        onLikeBtnClicked: (id) ->
          this.book_id = id
          
