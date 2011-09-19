class window.Shape
  constructor: (points, @fill_color = "#ffffff", @stroke_color = "#000000", @stroke_width = 1) ->
    @points = []
    if points?
      @points.push(points)
    return

  addPoints: (points) -> 
    @points.push(points)
    return
