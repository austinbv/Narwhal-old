window.tools = {}

tools.pencil =
  started: false
  shape: null
  mousedown: (e) ->
    $("#drawn").draw((ctx) ->
      ctx.beginPath()
      ctx.strokeStyle = "#000"
      ctx.moveTo(e._x, e._y)
    )
    @started = true
    @shape = new Shape({x: e._x, y: e._y})
    return
  mousemove: (e) ->
    if @started
      @shape.addPoints({x: e._x, y: e._y})
      $("#drawn").draw((ctx) ->
        ctx.lineTo(e._x, e._y)
        ctx.stroke()
      )

  mouseup: (e) ->
    if @started
      @started = false
      $.post('/presentations/9/slides/1/shapes',
            shape: 
              type: 'squiggle' 
              points: @shape.points 
              stroke_width: @shape.stroke_width 
              fill_color: @shape.fill_color
              stroke_color: @shape.stroke_color 
      )
