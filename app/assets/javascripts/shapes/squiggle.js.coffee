class window.Squiggle extends Shape
  constructor: () ->
    @drawnShape = 
      started: false
    @type = 'squiggle'
    super

  draw: (id) ->
    @drawnShape.shape = liveCanvas.path("#{@pointsToPath()}")
    @drawnShape.shape.attr({stroke: @stroke_color, 'stroke-linecap': 'round', 'stroke-width': 3})
    $('#drawing').clearCanvas()
    $('#live_canvas').mousedown( (e) =>
      @drawnShape.started = true
    )
    @drawnShape.shape.mouseover( (e) =>
      if @drawnShape.started == true
        @drawnShape.shape.remove()
    )
    $('#live_canvas').mouseup( (e) =>
      @drawnShape.started = false
    )
    @

  pointsToPath: () ->
    path = 'M'
    path += "#{@points[0].x} #{@points[0].y}"
    for point, xy of @points
      path += "L#{xy.x} #{xy.y}"
    path
