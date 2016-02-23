intervalIds = {}

stop = (item) ->
  # this will only cancel the most recent animation
  # applied to an object. how do we handle multiple
  # animations on one object?
  intervalIds = intervalIds[item.id]
  clearInterval(id) for id in intervalIds

schedule = (updatesPerSecond, key, func) ->
  millisecondsBetweenUpdates = 1000 / updatesPerSecond
  intervalIds[key] ?= []
  intervalIds[key].push setInterval func, millisecondsBetweenUpdates

scheduleOnce = (updatesPerSecond, key) ->
  if !intervalIds[key]
    schedule(arguments...)

module.exports =
  schedule: schedule
  scheduleOnce: scheduleOnce
  stop: stop
