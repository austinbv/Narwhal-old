# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

css_offset =
  x: 1
  y: 1
DEBUG = false
ghex = 0
url = 'test'
down = false
sync = true
live_id = "live_slide"

eventMap =
  mousemove: "move",
  touchmove: "move",
  mousedown: "down",
  touchstart: "down",
  mouseup: "up",
  touchend: "up"

event_map =
  mousemove: "move",
  touchmove: "move",
  mousedown: "down",
  touchstart: "down",
  mouseup: "up",
  touchend: "up"

find_position = (obj) ->
  curleft = 0
  curtop = 0
  curleft = $(obj).offset().left - $(window).scrollLeft()
  curtop = $(obj).offset().top - $(window).scrollTop()
  { x: curleft, y: curtop }

mouse_draw = (e) ->
  position = find_position(@)
  e._x = e.clientX - position.x
  e._y = e.clientY - position.y
  func = tools.pencil[e.type]
  if func?
    func(e)

init = ->
  window.liveCanvas = Raphael("live_canvas", 810, 608)
  window.c = $("#drawing").loadCanvas()
  $("#drawing").bind('mousedown mousemove mouseup', mouse_draw)

  window.pusher = new Pusher('b106769bbea5c2e08e77')
  window.channel = pusher.subscribe('test_channel')
  channel.bind('my_event',(thing) ->
#    $('#drawing').draw((ctx) -> 
#      ctx.beginPath()
#      ctx.strokeStyle = thing.stroke_style
#      ctx.moveTo(thing.points['0'].x, thing.points['0'].y)
#      for point, xy of thing.points
#        ctx.lineTo(xy.x, xy.y)
#      ctx.stroke()
#    )
    shape = new Squiggle()
    shape.addPointsBlob(thing.points)
    shape.draw("live_canvas")
  )

$(window).ready =>
  init()
