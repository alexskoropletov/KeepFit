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