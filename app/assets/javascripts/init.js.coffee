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
#   $('#newslide').after('<div id="slide_'+response+'" height="610" width="810"></div>');
# }

# function upload_shape(shape){
#   slideid = $('.activeSlide').attr('id');
#   slideid = slideid.replace(/slide_/, '')
#   $.ajax({
#     url: '/index.php/main/add_shape/'+url+'/'+slideid,
#     type: 'POST',
#     data: shape,
#     dataType: "json",
#     beforeSend: function(x) {
#       x.overrideMimeType("application/j-son;charset=UTF-8");
#     }
#   });
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

# //Designed to change the current tool whenever a new radio button is clicked
# function toolSelect() {
#   oldTool = $('.selected').parent('label').attr('for');
#   $('.selected')
#     .attr('src', '/static/img/tools/'+oldTool+'.png')
#     .removeClass('selected');
#   curTool = $("input:checked").attr('id');
#   $('label[for='+curTool+'] > img')
#     .attr('src', '/static/img/tools/'+curTool+'_clicked.png')
#     .addClass("selected");
# }

# //Finds current mouse position
# function findPos(obj) {
# //  var cssScale = [canvas.getSize().x / canvas.get('width'),
# //                  canvas.getSize().y / canvas.get('height')];
#   var curleft = 0;
#   var curtop = 0;
#   curleft = $(obj).offset().left - $(window).scrollLeft();
#   curtop = $(obj).offset().top - $(window).scrollTop();
#   return { x: curleft, y: curtop };
# }

init = ->
  # window.canvas = document.getElementById('drawn')
  # window.c = canvas.getContext('2d')
  window.c = $("#drawn").loadCanvas()
  $("#drawn").drawLine({strokeStyle: '#000', strokeWidth: 2, points: {p1: [599,200], p2: [110, 110], p3: [200, 200]}})
  # tool = tools.pencil

# function mouse_Draw (e) {
#   var pos = findPos(this);
#   e._x = e.clientX - pos.x;
#   e._y = e.clientY - pos.y;
#   e._x = e._x*cssOffset.x;
#   e._y = e._y*cssOffset.y;
#   var func = tool[eventMap[e.type]];
#   if (func) {
#     func(e);
#   }
#
#   if (eventMap[e.type] === "down"){
#     down = true;
#   } else if (eventMap[e.type]  === "up") {
#     down = false;
#     $('#'+liveID).html('<img src="'+$('#drawn').get(0).toDataURL()+'" height="80px" width="110px" alt="Live Slide"></img>');
#   }
# }


# function fit_inside() {
#   height = $('#container').height()-60;
#   width = $('#container').width()-60;
#   $('#one').html("H: "+height+" W:"+width);
#   if (Math.min(height, width) === height) {
#     $('#container canvas').css({'height': height,
#                   'width': Math.floor(height/0.75),
#                   'margin-left': -$('#container canvas').width()/2,
#                   'margin-top': -$('#container canvas').height()/2
#                   });
#   } else {
#     $('#container canvas').css({'height': Math.floor(width*0.75),
#                   'width': width,
#                   'margin-left': -$('#container canvas').width()/2,
#                   'margin-top': -$('#container canvas').height()/2
#                   });
#
#   }
#   cssOffset = {"x":$('#drawn').attr("width")/$('#drawn').outerWidth(), "y":$('#drawn').attr("height")/$('#drawn').outerHeight()};
# }


# $(window).ready(function () {
$(window).ready =>
#   init();
  init()
#
#   var curTool = $("input:checked").attr('id');
#   toolSelect(curTool);
#   $(":radio").click(function() {
#     toolSelect(curTool);
#     tool = new tools[$(this).attr('id')]();
#   });
#
#
#   //Change the current tool based on a click
#   $('#tool').change(function () {
#     tool = new tools[$(this).val()]();
#   });
#
#   $('#width').change(function () {
#     c.lineWidth = +($(this).val());
#     d.lineWidth = c.lineWidth;
#   });
#   $.post('/index.php/main/get_slide_in/'+url, function (data) {
#     $('#liveSlide').attr('id', 'slide_'+data);
#     liveID = "slide_"+data;
#   })
# });