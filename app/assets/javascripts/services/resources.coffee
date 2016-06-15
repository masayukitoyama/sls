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
