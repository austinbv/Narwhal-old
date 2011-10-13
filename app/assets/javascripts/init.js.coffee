# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
window.Narwhal =
  size:
    height: $(window).height()-105
    width: $(window).width()-151

css_offset =
  x: 1
  y: 1
DEBUG = false
ghex = 0
down = false
sync = true
live_id = "live_slide"
Narwhal.global_width = 3
presentation_cookie = $.cookie("created_presentations") ? ""
Narwhal.owns_presentation = presentation_cookie.search($('#drawing').data('presentation')) != -1


palletHeight = $(window).height()-105
palletWidth = $(window).width()-216

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

changeTool = () ->
  $('.tool_select').click ->
    $('.tool_select').removeClass('active')
    $(this).addClass('active')
    $('#drawing').show()
    return
  return

currentTool = () ->
  $(".tool_select.active").data('type')

mouse_draw = (e) ->
  position = find_position(@)
  e._x = e.clientX - position.x
  e._y = e.clientY - position.y
  if currentTool() == 'eraser'
    $('#drawing').hide()
  func = Narwhal.tools[currentTool()][e.type]
  if func?
    func(e)

touchDraw = (e) ->
  position = find_position(@)
  e._x = e.targetTouches[0].clientX - positionX
  e._y = e.targetTouches[0].clientY - positionY
  func = tool[eventMap[e.type]]
  if func?
    func(e)

  if e.type == "touchmove"
    event.preventDefault()
  else if eventMap[e.type] == "down"
    down = true
  else if eventMap[e.type] == "up"
    down = false

resizeCanvas = ->
  containerHeight = $(window).height()-105
  containerWidth = $(window).width()-216

  growth =
    height: containerHeight / Narwhal.size.height
    width: containerWidth / Narwhal.size.width

  if containerWidth < containerHeight
    palletWidth = containerWidth
    palletHeight = ( 3 * palletWidth ) / 4
    leftOffset = 0
  else
    palletHeight = containerHeight
    palletWidth = ( 4 * palletHeight ) / 3
    leftOffset = ( containerWidth / 2 ) - ( palletWidth / 2 )

  leftOffset = 0 if leftOffset < 0
  $('#container').height(containerHeight)
    .width(containerWidth).css(
      background: '#C4C4C4'
      left: 215
      position: "relative"
    )
  $('#drawing').attr('height', palletHeight)
    .attr('width', palletWidth)
    .css(
      position: "absolute"
      left: leftOffset
    )
  $('#live_canvas').height(palletHeight)
    .width(palletWidth)
    .css(
      position: "absolute"
      left: leftOffset
    )
  Narwhal.liveCanvas.setSize(palletWidth, palletHeight)
  Narwhal.size =
    height: containerHeight
    width: containerWidth

strokeExample = (width) ->
  Narwhal.examplePallet.clear()
  Narwhal.examplePallet.path("M0 11L100 11").attr({stroke: "#000", 'stroke-linecap': 'round', 'stroke-width': width})

  Narwhal.miniExamplePallet.clear()
  Narwhal.miniExamplePallet.path("M0 6L40 6").attr({stroke: "#000", 'stroke-linecap': 'round', 'stroke-width': width})

turn_collaberation = (onOff) ->
  if onOff == "on"
    $("#collaberation_enabled_disabled span#on_off").text('On')
    $("#drawing").data("collaberation_on", true)
    $('#drawing').show()
  else
    $("#collaberation_enabled_disabled span#on_off").text('Off')
    if !Narwhal.owns_presentation
      $("#drawing").data("collaberation_on", false)
      $('#drawing').hide()

troolean = (bool, options = {}) ->
  if bool
    options.true ? "True"
  else
    options.false ? ""

init = ->
  $("#collaboration_switch").iphoneSwitch(troolean($('#drawing').data('collaberation_on'), {true: "on", false: "off"}), ->
    $.ajax(
      url: "/presentations/#{$('#drawing').data('presentation')}"
      data:
        presentation:
          collaberation_on: true
      type: "put"
    )
  , ->
    $.ajax(
      url: "/presentations/#{$('#drawing').data('presentation')}"
      data:
        presentation:
          collaberation_on: false
      type: "put"
    )
  )

  turn_collaberation(troolean($('#drawing').data('collaberation_on'), {true: "on", false: "off"}))

  $("#notice").delay(5000).slideUp(1000)
  Narwhal.examplePallet = Raphael("stroke_example", 100, 21)
  Narwhal.miniExamplePallet = Raphael("mini_stroke_example", 40, 11)
  strokeExample(3)
  $("#stroke_width_slider").slider(
    max: 10
    min: 3
    step: 1
    value: 3
    slide: (e, ui) ->
      Narwhal.global_width = ui.value
      strokeExample(ui.value)
  )

  $("#stroke_width_select").click( ->
    $("#tool_pallet").slideToggle('slow')
  )

  Narwhal.liveCanvas = Raphael("live_canvas", palletWidth, palletHeight)
  resizeCanvas()
  changeTool()
  $(window).resize ->
    resizeCanvas()

  $("#drawing").bind('mousedown mousemove mouseup', mouse_draw)

  pusher = new Pusher('b106769bbea5c2e08e77')
  channel = pusher.subscribe($("#drawing").data("presentation"))
  channel.bind('squiggle_create_event', (data) ->
    shape = new Narwhal.Squiggle()
    shape.addPointsBlob(data.points)
      .draw("#{data.hash}", data.stroke_width)
  )

  channel.bind('squiggle_destroy_event', (data) ->
    $("#id_#{data.hash}").get(0)?.raphael.remove()
  )

  channel.bind('collaberation_toggle', (data) ->
    if data == true
      turn_collaberation "on"
    else
      turn_collaberation "off"
  )

  channel.bind('survey_redirect', (data) ->
    $('#notice p').text "Thanks for working with me, I will redirect you to a survey now"
    $('#notice').slideDown('slow', ->
      setTimeout(->
        Narwhal.location = '/survey'
      , 3000)
    )
  )

  $('#tool').change ->
    if currentTool() == 'eraser'
      $('#drawing').hide()
    else
      $('#drawing').show()

Narwhal.runShapes = (slide) ->
  for shape in slide
    squiggle = new Narwhal.Squiggle()
    squiggle.addPointsBlob(shape.points)
      .draw("#{shape.hash}", shape.stroke_width)

$(document).ready =>
  init()

