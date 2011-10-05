Narwhal.tools = {}

Narwhal.tools.pencil =
  started: false
  shape: null
  mousedown: (e) ->
    $("#drawing").draw((ctx) ->
      ctx.beginPath()
      ctx.strokeStyle = "#000"
      ctx.lineWidth = Narwhal.global_width
      ctx.lineCap = 'round'
      ctx.moveTo(e._x, e._y)
    )
    @started = true
    @shape = new Narwhal.Squiggle({x: e._x, y: e._y})
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

Narwhal.tools.line =
  started: false
  shape: null
  startX: null
  startY: null
  mousedown: (e) ->
    @startX = e._x
    @startY = e._y
    @started = true
    @shape = new Narwhal.Squiggle({x: e._x, y: e._y})
  mousemove: (e) ->
    if @started
      $("#drawing").clearCanvas()
      $("#drawing").draw((ctx) ->
        ctx.beginPath()
        ctx.strokeStyle = '#000000'
        ctx.lineWidth = Narwhal.global_width
        ctx.lineCap = 'round'
        ctx.moveTo(startX, startY)
        ctx.lineTo(e._x, e._y)
        ctx.stroke()
      )
  mouseup: (e) ->
    if @started
      @shape.addPoints({x: e._x, y: e._y})
      @started = false
      @shape.upload("/presentations/#{$("#drawing").data("presentation")}/slides/#{$("#drawing").data("current-slide")}/shapes")
