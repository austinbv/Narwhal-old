window.tools = {}

tools.pencil =
  started: false
  shape: null
  mousedown: (e) ->
    $("#drawing").draw((ctx) ->
      ctx.beginPath()
      ctx.strokeStyle = "#000"
      ctx.lineWidth = global_width
      ctx.lineCap = 'round'
      ctx.moveTo(e._x, e._y)
    )
    @started = true
    @shape = new Squiggle({x: e._x, y: e._y})
    return
  mousemove: (e) ->
    if @started
      @shape.addPoints({x: e._x, y: e._y})
      $("#drawing").draw((ctx) ->
        ctx.lineTo(e._x, e._y)
        ctx.stroke()
      )

  mouseup: (e) ->
    if @started
      @started = false
      if @shape.points.length > 5 && $("#drawing").data("presentation")
        @shape.upload("/presentations/#{$("#drawing").data("presentation")}/slides/#{$("#drawing").data("current-slide")}/shapes")

tools.eraser =
  started: false
  mousedown: (e) ->
    @started = true
  mousemove: (e) ->
    x = 1
  mouseup: (e) ->
    @started = false
