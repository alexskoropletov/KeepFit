$( ->
  ########## events ##########
  #document ready
  setTimeout appStart, 100
)
######### functions #########
# function that gets current exercise info
getLevelInfo = (level) ->
  rage = getRage()
  level = getCurrentLevel()
  $(".currentRage").text rage
  if rage
    $("#pushups").text(MODES[level].pushup)
    $("#pullups").text(MODES[level].pullup)
    $(".reduce").attr "disabled", null
  else
    $("#pushups").text(0)
    $("#pullups").text(0)
    $(".reduce").attr "disabled", "disabled"
  level
#function that fires after document ready event
appStart = ->
  level = getLevelInfo()
  $("#selectLevel option").each (item, obj) ->
    if $(obj).val() == level
      $(obj).attr "selected", "selected"
      $(obj).prop "selected", "selected"
    else
      $(obj).removeAttr "selected"
#events
bodyEvents =
  "click #addrage": ->
    #rage increase
    addRage()
    getLevelInfo()
  "click .reduce": ->
    #rage reduce
    reduceRage()
    getLevelInfo()
  "click #selectLevel": ->
    level = $("#selectLevel").val()
    setCurrentLevel level
    getLevelInfo()

Template.body.events bodyEvents