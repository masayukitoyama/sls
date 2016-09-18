$(document).on 'ready page:load', ->

  $body = $("body")
  controller = _.str.classify($body.data("controller-name") + "-controller")
  action = $body.data("action-name")

  if window[controller]
    activeController = new window[controller]
    if activeController && $.isFunction(activeController[action])
      activeController[action]()
