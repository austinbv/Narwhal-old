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

# function slide_view(response) {
#   $('#newslide').after('<div id="slide_'+response+'" height="610" width="810"></div>')
# }

# function upload_shape(shape){
#   slideid = $('.activeSlide').attr('id')
#   slideid = slideid.replace(/slide_/, '')
#   $.ajax({
#     url: '/index.php/main/add_shape/'+url+'/'+slideid,
#     type: 'POST',
#     data: shape,
#     dataType: "json",
#     beforeSend: function(x) {
#       x.overrideMimeType("application/j-soncharset=UTF-8");
#     }
#   })
# }

# // Event Map used for events
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



# //Shape object created basic shell for pushing on points with action
# function Shape(type, lineWidth, color, height, width, radius, x, y) {
#   this.type = type
#   this.lineWidth = lineWidth
#   this.color = color
#   this.h = height
#   this.w = width
#   this.r = radius
#   this.points = {x: [x], y: [y]}
# }

# //Designed to change the current tool whenever a new radio button is clicked
# function toolSelect() {
#   oldTool = $('.selected').parent('label').attr('for')
#   $('.selected')
#     .attr('src', '/static/img/tools/'+oldTool+'.png')
#     .removeClass('selected')
#   curTool = $("input:checked").attr('id')
#   $('label[for='+curTool+'] > img')
#     .attr('src', '/static/img/tools/'+curTool+'_clicked.png')
#     .addClass("selected")
# }

# //Finds current mouse position
# function findPos(obj) {
# //   cssScale = [canvas.getSize().x / canvas.get('width'),
# //                  canvas.getSize().y / canvas.get('height')]
#    curleft = 0
#    curtop = 0
#   curleft = $(obj).offset().left - $(window).scrollLeft()
#   curtop = $(obj).offset().top - $(window).scrollTop()
#   return { x: curleft, y: curtop }
# }


# //Initialiaze all the canvas's and bind the propper events
# function init () {
#   canvas = $('#drawn').get(0)
#   c = canvas.getContext('2d')
#   $('#drawn').parent().append($('<canvas id="temp" height="'+canvas.height+'" width="'+canvas.width+'"></canvas>'))
#   d = $('#temp').get(0).getContext('2d')
#   c.lineJoin = "round"
#   c.lineCap = "round"
#   c.strokeStyle = "#"+ghex
#   c.lineWidth = 1
#   d.lineJoin = "round"
#   d.lineCap = "round"
#   d.strokeStyle = c.strokeStyle
#   d.lineWidth = c.lineWidth
#
# //  c.setDims(x*cssScale[0], y*cssScale[1], w*cssScale[0], h*cssScale[1])
#   tool = new tools.pencil()
#   $('#container canvas').bind('mousedown mousemove mouseup', mouse_Draw)
#   $('#container canvas').bind('touchstart touchmove touchend', touch_Draw)
# }

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
  
  # window.canvas = document.getElementById('drawn')
  # window.c = canvas.getContext('2d')
  window.c = $("#drawn").loadCanvas()
  $("#drawn").bind('mousedown mousemove mouseup', mouse_draw)

  window.pusher = new Pusher('b106769bbea5c2e08e77')
  window.channel = pusher.subscribe('test_channel')
  channel.bind('my_event',(thing) ->
    $('#drawn').draw((ctx) -> 
      ctx.beginPath()
      ctx.strokeStyle = thing.stroke_style
      ctx.moveTo(thing.points['0'].x, thing.points['0'].y)
      for point, xy of thing.points
        console.log xy.x, xy.y
        ctx.lineTo(xy.x, xy.y)
      ctx.stroke()
    )
  )
  # tool = tools.pencil

# function mouse_Draw (e) {
#    pos = findPos(this)
#   e._x = e.clientX - pos.x
#   e._y = e.clientY - pos.y
#   e._x = e._x*cssOffset.x
#   e._y = e._y*cssOffset.y
#    func = tool[eventMap[e.type]]
#   if (func) {
#     func(e)
#   }
#
#   if (eventMap[e.type] === "down"){
#     down = true
#   } else if (eventMap[e.type]  === "up") {
#     down = false
#     $('#'+liveID).html('<img src="'+$('#drawn').get(0).toDataURL()+'" height="80px" width="110px" alt="Live Slide"></img>')
#   }
# }


# function fit_inside() {
#   height = $('#container').height()-60
#   width = $('#container').width()-60
#   $('#one').html("H: "+height+" W:"+width)
#   if (Math.min(height, width) === height) {
#     $('#container canvas').css({'height': height,
#                   'width': Math.floor(height/0.75),
#                   'margin-left': -$('#container canvas').width()/2,
#                   'margin-top': -$('#container canvas').height()/2
#                   })
#   } else {
#     $('#container canvas').css({'height': Math.floor(width*0.75),
#                   'width': width,
#                   'margin-left': -$('#container canvas').width()/2,
#                   'margin-top': -$('#container canvas').height()/2
#                   })
#
#   }
#   cssOffset = {"x":$('#drawn').attr("width")/$('#drawn').outerWidth(), "y":$('#drawn').attr("height")/$('#drawn').outerHeight()}
# }


# $(window).ready(function () {
$(window).ready =>
#   init()
  init()
#
#    curTool = $("input:checked").attr('id')
#   toolSelect(curTool)
#   $(":radio").click(function() {
#     toolSelect(curTool)
#     tool = new tools[$(this).attr('id')]()
#   })
#
#
#   //Change the current tool based on a click
#   $('#tool').change(function () {
#     tool = new tools[$(this).val()]()
#   })
#
#   $('#width').change(function () {
#     c.lineWidth = +($(this).val())
#     d.lineWidth = c.lineWidth
#   })
#   $.post('/index.php/main/get_slide_in/'+url, function (data) {
#     $('#liveSlide').attr('id', 'slide_'+data)
#     liveID = "slide_"+data
#   })
# })
