class Narwhal.Squiggle extends Narwhal.Shape
  constructor: () ->
    @drawnShape =
      started: false
    @shape_type = 'squiggle'
    super

  draw: (id, stroke_width) ->
    @drawnShape.shape = Narwhal.liveCanvas.path("#{@pointsToPath()}")
    @drawnShape.shape.attr({stroke: @stroke_color, 'stroke-linecap': 'round', 'stroke-width': stroke_width, id: id})
    $(@drawnShape.shape.node).attr('id', "id_#{id}").data('hash', id)
    $('#drawing').clearCanvas()
    $('#live_canvas').mousedown( (e) =>
      @drawnShape.started = true
    )
    @drawnShape.shape.mouseover( (e) =>
      if @drawnShape.started == true && ( $('#drawing').data('collaberation_on') == true || Narwhal.owns_presentation )
        @remove()
        @destroy("/presentations/#{ $("#drawing").data("presentation") }/slides/#{ $("#drawing").data("current-slide") }/shapes/#{ id }")
    )
    $('#live_canvas').mouseup( (e) =>
      @drawnShape.started = false
    )
    @

  remove: ->
    @drawnShape.shape.remove()

  pointsToPath: () ->
    path = 'M'
    path += "#{@points[0].x} #{@points[0].y}"
    for point, xy of @points
      path += "L#{xy.x} #{xy.y}"
    path
