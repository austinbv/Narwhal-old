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

palletHeight = $(window).height()-100
palletWidth = $(window).width()

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

currentTool = () ->
  $("#tool option:selected").attr('value') ? "pencil"

mouse_draw = (e) ->
  position = find_position(@)
  e._x = e.clientX - position.x
  e._y = e.clientY - position.y
  if currentTool() == 'eraser'
    $('#drawing').hide()
  func = tools[currentTool()][e.type]
  if func?
    func(e)

resize_canvas = ->
  $('#drawing').attr('height', palletHeight).attr('width', palletWidth)
  $('#live_canvas').height(palletHeight).width(palletWidth)

init = ->
  resize_canvas()
  window.liveCanvas = Raphael("live_canvas", palletWidth, palletHeight)
  window.c = $("#drawing").loadCanvas()
  $("#drawing").bind('mousedown mousemove mouseup', mouse_draw)

  window.pusher = new Pusher('b106769bbea5c2e08e77')
  window.channel = pusher.subscribe('test_channel')
  channel.bind('my_event',(thing) ->
    shape = new Squiggle()
    shape.addPointsBlob(thing.points)
         .draw("live_canvas")
  )
  channel.bind('survey_redirect', (data) ->
    $('#notice p').text "Thanks for working with me, I will redirect you to a survey now"
    $('#notice').slideDown('slow', ->
      setTimeout(->
        window.location = '/survey'
      , 3000)
    )
  )

  $('#tool').change ->
    if currentTool() == 'eraser'
      $('#drawing').hide()
    else
      $('#drawing').show()

$(window).ready =>
  init()
