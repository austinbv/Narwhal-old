class window.Squiggle extends Shape
  constructor: () ->
    @type = 'squiggle'
    super

  draw: (id) ->
    @drawnShape = liveCanvas.path("#{@pointsToPath()}")
    @drawnShape.attr({stroke: @stroke_color})
    $('#drawing').clearCanvas()

  pointsToPath: () ->
    path = 'M'
    path += "#{@points[0].x} #{@points[0].y}"
    for point, xy of @points
      path += "L#{xy.x} #{xy.y}"
    path
