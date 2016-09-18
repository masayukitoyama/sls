class @Resources
  get: (url, params, success, error) ->
    $.ajax
      url: url
      type: "GET"
      data: params
      dataType: "json"
      success: (data) ->
        success(data.data)
      error: (XMLHttpRequest, textStatus, errorThrown) =>
        if error
          error(XMLHttpRequest, textStatus, errorThrown)



  post: (url, params, success, error) ->
    $.ajax
      url: url
      type: "POST"
      data: params
      dataType: "json"
      success: (data) ->
        success(data.data)
      error: (XMLHttpRequest, textStatus, errorThrown) =>
        if error
          error(XMLHttpRequest, textStatus, errorThrown)



  put: (url, params, success, error) ->
    $.ajax
      url: url
      type: "PUT"
      data: params
      dataType: "json"
      success: (data) ->
        success(data.data)
      error: (XMLHttpRequest, textStatus, errorThrown) =>
        if error
          error(XMLHttpRequest, textStatus, errorThrown)



  delete: (url, params, success, error) ->
    $.ajax
      url: url
      type: "DELETE"
      data: params
      dataType: "json"
      success: (data) ->
        success(data.data)
      error: (XMLHttpRequest, textStatus, errorThrown) =>
        if error
          error(XMLHttpRequest, textStatus, errorThrown)

  createUser: (params, success) ->
    url = "/api/users"
    @post(url, params, success, null)

  updateUser: (params, success) ->
    url = "/api/user/" + params.id
    @put(url, params, success, null)

  createLike: (params, success) ->
    url = "/api/likes"
    @post(url, params, success, null)

  createRequire: (params, success) ->
    url = "/api/requires"
    @post(url, params, success, null)
