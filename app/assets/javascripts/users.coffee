class @UsersController

  index: () ->
    resource = new Resources()

    new Vue
      el: "#user-list"
      data:
        message: "hello"

      created: ->
        this.init()

      methods:
        init: () ->
