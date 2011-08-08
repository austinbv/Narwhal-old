do ($ = jQuery) ->
  methods =
    get_pixel_data: (points, jquery_element = @) ->
      image_data_array = []
      ctx = jquery_element.get(0).getContext("2d")
      for point, x_y of points
        image_data = ctx.getImageData(x_y[0], x_y[1], 1, 1)
        image_data_array.push([image_data.data[0], image_data.data[1], image_data.data[2], image_data.data[3]])
      image_data_array

    color_is: (points_string, r, g, b, a) ->
      pixels = methods.get_pixel_data(points_string, @)
      for pixel in pixels[0...-1]
        if (r is pixel[0] and g is pixel[1] and b is pixel[2] and a is pixel[3]) is false
          return false
      true

  $.fn.test_draw = (method) ->
    if methods[method]
      return methods[ method ].apply( this, Array.prototype.slice.call( arguments, 1 ));
    else if typeof method == 'object'
      return methods.draw.apply( this, arguments )
