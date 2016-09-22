class @BorrowHistoriesController

  index: ->
    new Vue
      el: "#borrow-history"
      methods:
        showBookDetail: (book_history_id) ->
          url = Utility.getHost() + '/borrow_history/' + book_history_id
          window.location.href = url
