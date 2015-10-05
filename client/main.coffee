$( ->
  #menu tabs
  $(".navbar-nav a").click (e) ->
    e.preventDefault()
    $(this).tab('show')
  #rage increase
  $("#addrage").click ->
    addRage()
    $(".badge").text getRage()
  #app start functions
  callback = ->
    $(".badge").text getRage()
    $(".navbar-nav a:eq(0)").tab('show');
  setTimeout callback, 100
)