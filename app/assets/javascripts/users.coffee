class @UsersController

  index: ->


  new: ->
    resource = new Resources()

    new Vue
      el: "#user-new"
      data:
        is_edit: false
        modaldata:
          id: ""
          user_name: ""
          email: ""
          job_type: ""
          user_memo: ""
