class window.Shape
  constructor: (points, @fill_color = "#ffffff", @stroke_color = "#000000", @stroke_width = global_width) ->
    @points = []
    if points?
      @points.push(points)
    @

  addPoints: (points) -> 
    @points.push(points)
    @

  addPointsBlob: (points) ->
    for point, xy of points
      @points.push(xy)
    @

  upload: (url) ->
    $.post(url,
      shape:
        shape_type: @shape_type
        points: @points
        stroke_width: @stroke_width
        stroke_color: @stroke_color
        fill_color: @fill_color
      channel: $("#drawing").data("presentation")
    )
    @

  destroy: (url) ->
    $.ajax(
      type: 'delete'
      url: url
    )
