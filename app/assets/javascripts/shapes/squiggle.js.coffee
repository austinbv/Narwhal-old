class window.Squiggle extends Shape
  constructor: () ->
    @drawnShape = 
      started: false
    @type = 'squiggle'
    super

  draw: (id) ->
    @drawnShape.shape = liveCanvas.path("#{@pointsToPath()}")
    @drawnShape.shape.attr({stroke: @stroke_color})
    # $('#drawing').clearCanvas()
    $('#live_canvas').mousedown( (e) =>
      console.log 'down', @drawnShape
      @drawnShape.started = true
    )
    @drawnShape.shape.mouseover( (e) =>
      if @drawnShape.started = true
        console.log 'move', @drawnShape
        @drawnShape.shape.remove()
    )
    $('#live_canvas').mouseup( (e) =>
      console.log 'up', @drawnShape
      @drawnShape.started = false
    )
    @

  pointsToPath: () ->
    path = 'M'
    path += "#{@points[0].x} #{@points[0].y}"
    for point, xy of @points
      path += "L#{xy.x} #{xy.y}"
    path
