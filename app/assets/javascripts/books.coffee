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
    resources = new Resources()

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
        likes: ""
        requires: ""
        asin: ""
        title: ""
        author: ""
        image_url: ""
        detail_page_url: ""

      created: ->
        this.init()

      methods:
        init: ->
          this.user_id = gon.user.id
          this.likes = 0

        onLikeBtnClicked: (id) ->
          this.book_id = id
          this.submitLike()

        onRequireBtnClicked: (book) ->
          this.asin = book["asin"]
          this.title = book["title"]
          this.author = book["author"]
          this.image_url = book["image_url"]
          this.detail_page_url = book["detail_page_url"]
          this.submitRequire()

        submitLike: ->
          that = this
          params =
            user_id: this.user_id
            book_id: this.book_id

          resources.createLike params, (data) ->
            if data.errors
              this.errors = data.errors
            else
              that.likes += 1

        submitRequire: ->
          that = this
          params =
            user_id: this.user_id
            asin: this.asin
            title: this.title
            author: this.author
            image_url: this.image_url
            detail_page_url: this.detail_page_url
          resources.createRequire params, (data) ->
            if data.errors
              this.errors = data.errors
            else
              that.requires += 1
