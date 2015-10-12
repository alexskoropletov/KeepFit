@addRage = ->
  data =
    createdAt: new Date
  RagePoints.insert data


@getRage = ->
  count = RagePoints.find {}
  count.count()

@reduceRage = ->
  removeIt = (item) ->
    if item
      RagePoints.remove item._id
  removeIt RagePoints.findOne {}

@getCurrentLevel = ->
  option = AppOptions.findOne {key: 'level'}
  if option
    option.value
  else
    defaultLevel =
      key: 'level'
      value: 'veryeasy'
    AppOptions.insert defaultLevel, ->
      'veryeasy'

@setCurrentLevel = (level) ->
  option = AppOptions.findOne {key: 'level'}
  if option
    set =
      value: level
    AppOptions.update option._id, $set: set
    level
  else
    defaultLevel =
      key: 'level'
      value: level
    AppOptions.insert defaultLevel, ->
      level