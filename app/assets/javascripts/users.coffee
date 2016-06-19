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
        users: ""


      created: ->
        this.init()

      methods:
        init: ->
          this.resetModalData()
          this.users = gon.users

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
          $('#userModal').modal()

        showConfirmModal: ->
          $('#userModal').modal('hide')
          $('#confirmModal').modal()

        showUserModal: ->
          $('#confirmModal').modal('hide')
          $('#userModal').modal()

        createUser: ->
          this.deleteErrorText()
          $("createUserBtn").blur()
          that = this
          params =
            user_name: this.modaldata.user_name
            email: this.modaldata.email
            password: this.modaldata.password
          resource.createUser params, (data) ->
            $('#confirmModal').modal('hide')
            if data.errors
              this.errors = data.errors
              $('#userModal').modal()
              that.insertErrorText()
            else
              window.location.reload()

        showEditModal: (user_id) ->
          this.deleteErrorText()
          editUser = this.findUser(user_id)
          this.setEditData(editUser)
          $('#userModal').modal()

        findUser: (user_id) ->
          for user in this.users
            if user.id == parseInt(user_id)
              return user

        setEditData: (editUser) ->
          this.modaldata.id = editUser.id
          this.modaldata.user_name = editUser.user_name
          this.modaldata.email = editUser.email
          this.is_edit = true

        updateUser: () ->
          that = this
          params =
            id: this.modaldata.id
            user_name: this.modaldata.user_name
            email: this.modaldata.email
          resource.updateUser params, (data) ->
            $('#confirmModal').modal('hide')
            if data.errors
              this.errors = data.errors
              that.insertErrorText()
              $('#userModal').modal()
            else
              window.location.reload()


        deleteErrorText: ->
          $('.error_msg').html("")

        insertErrorText: (errors) ->
          for error in errors
            el = '<div class="callout callout-danger margin-bottom-10 margin-top-10">' + error.message + '</div>'
            $('#error_' + error.key ).html(el)
