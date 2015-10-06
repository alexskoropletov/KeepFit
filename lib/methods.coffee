@addRage = ->
  data =
    createdAt: new Date
  RagePoints.insert data

@getRage = ->
  count = RagePoints.find {}
  count.count()

@reduceRage = ->
  removeIt = (item) ->
    item.remove
  RagePoints.findOne {}, removeIt

@getCurrentLevel = ->
  'veryeasy'
#  Options.find {key: 'level'}, (err, option) ->
#    console.log err
#    console.log option
#    if option
#      option.value
#    else
#      defaultLevel =
#        key: 'level'
#        value: 'veryeasy'
#      Options.insert defaultLevel, ->
#        'veryeasy'

@setCurrentLevel = (level) ->
  AppOptions.find {}, (err, app_options) ->
    console.log app_options
    level
#    if options
#      option.level = level
#      option.save (err) ->
#        level
#    else
#  defaultLevel =
#    key: 'level'
#    value: level
#  Options.insert defaultLevel, ->
#    level