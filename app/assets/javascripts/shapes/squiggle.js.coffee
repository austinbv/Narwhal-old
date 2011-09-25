class window.Squiggle extends Shape
  constructor: () ->
    @drawnShape = 
      started: false
    @shape_type = 'squiggle'
    super

  draw: (id, stroke_width) ->
    @drawnShape.shape = liveCanvas.path("#{@pointsToPath()}")
    @drawnShape.shape.attr({stroke: @stroke_color, 'stroke-linecap': 'round', 'stroke-width': stroke_width, id: id})
    $(@drawnShape.shape.node).attr('id', "id_#{id}").data('hash', id)
    $('#drawing').clearCanvas()
    $('#live_canvas').mousedown( (e) =>
      @drawnShape.started = true
    )
    @drawnShape.shape.mouseover( (e) =>
      if @drawnShape.started == true
        console.log @remove
        if @remove()
          @delete("/projects/#{$("#drawing").data("presentation")}/slides/#{$("#drawing").data("current-slide")}/#{id}")
    )
    $('#live_canvas').mouseup( (e) =>
      @drawnShape.started = false
    )
    @

  remove: ->
    if @drawnShape.shape.remove()
      true
    else
      false

  pointsToPath: () ->
    path = 'M'
    path += "#{@points[0].x} #{@points[0].y}"
    for point, xy of @points
      path += "L#{xy.x} #{xy.y}"
    path
