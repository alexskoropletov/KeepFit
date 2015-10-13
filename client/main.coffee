rage = getRage()
level = getCurrentLevel()
$( ->
  #document ready
  setTimeout appStart, 100
)
######### functions #########
#function that fires after document ready event
appStart = ->
  rage = getRage()
  level = getCurrentLevel()
  draw()
# function that gets current exercise info
draw = ->
  $(".currentRage").text rage #display current rage points
  drawPercent() #display level
  if rage
    $("#pushups").text(MODES[level].pushup)
    $("#pullups").text(MODES[level].pullup)
    $(".reduce").attr "disabled", null
  else
    $("#pushups").text(0)
    $("#pullups").text(0)
    $(".reduce").attr "disabled", "disabled"
drawPercent = ->
  $("#progress-bar")
  .attr("aria-valuenow", MODES[level].percent)
  .css("width", MODES[level].percent + "%")
  .text MODES[level].name
  .attr("class", "progress-bar")
  .addClass(MODES[level].class)

getPercent = (e) ->
  parentOffset = $("#progress").parent().offset()
  Math.round((e.pageX - parentOffset.left) / ($("#progress").width() / 100))
getLevelByPercent = (percent) ->
  if (percent <= 20)
    level = "veryeasy"
  else if (percent <= 40)
    level = "easy"
  else if (percent <= 60)
    level = "normal"
  else if (percent <= 80)
    level = "hard"
  else if (percent <= 100)
    level = "veryhard"
  level
#events
bodyEvents =
  "click #addrage": ->
    #rage increase
    rage = addRage()
    draw()
  "click .reduce": ->
    #rage reduce
    rage = reduceRage()
    draw()
  "click #progress": (e) ->
    percent = getPercent(e)
    level = getLevelByPercent percent
    setCurrentLevel level
    draw()

Template.body.events bodyEvents