class @UsersController

  index: ->
    resource = new Resources()

    new Vue
      el: '#user-list'
      data:
        is_edit: false
        new_modaldata:
          user_name: ""
          email: ""
          password: ""
          job_type: ""
        modaldata:
          user_name: ""
          email: ""
          password: ""
          job_type: ""


      created: ->
        this.init()

      methods:
        init: ->
          this.resetModalData()

        resetModalData: ->
          this.is_edit = false
          this.modaldata.user_name = ""
          this.modaldata.email = ""
          this.modaldata.password = ""
          this.modaldata.job_type = ""

        onUserNewClicked: ->
          this.resetModalData()
          $("#newUserCreateBtn").blur()
          this.deleteErrorText()
          $('#newModal').modal()

        showConfirmModal: ->
          $('#newModal').modal('hide')
          $('#confirmModal').modal()

        showNewModal: ->
          $('#confirmModal').modal('hide')
          $('#newModal').modal()

        createUser: ->
          this.deleteErrorText()
          $("createUserBtn").blur()
          that = this
          params =
            user_name: this.modaldata.user_name
            email: this.modaldata.email
            password: this.modaldata.password
          resource.createUser params, (data) ->
            if data.errors
              this.errors = data.errors
              that.insertErrorText()
            else
              $('#confirmModal').modal('hide')
              window.location.reload()

        deleteErrorText: ->
          $('.error_msg').html("")

        insertErrorText: (errors) ->
          for error in errors
            el = '<div class="callout callout-danger margin-bottom-10 margin-top-10">' + error.message + '</div>'
            $('#error_' + error.key ).html(el)
