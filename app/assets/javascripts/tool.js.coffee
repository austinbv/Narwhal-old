window.tools = {}

tools.pencil =
  started: false
  mousedown: (e) ->
    c.beginPath()
    c.moveTo(e._x, e._y)
    @.started = true

  mousemove: (e) ->
    if @.started
      c.lineTo(e._x, e._y)
      c.stroke()

  mouseup: (e) ->
    if @.started
      @.started = false

# tools.pencil = function () {
#   var tool = this;
#   tool.started = false;
#
#   tool.down = function (e) {
#     c.beginPath();
#     c.moveTo(e._x, e._y);
#     tool.started = true;
#   };
#
#   tool.move = function (e) {
#     if (tool.started) {
#       c.lineTo(e._x, e._y);
#       c.stroke();
#     }
#   };
#
#   tool.up = function (e) {
#     if (tool.started) {
#       tool.started = false;
#     }
#   };
# }