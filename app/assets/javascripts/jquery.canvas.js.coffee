do ($ = jQuery) ->
  $.fn.canvasize = ->
    canvas = @.get(0).getContext('2d')
    canvas.lineJoin = "round";
    canvas.lineCap = "round";
    canvas.strokeStyle = "#000000";
    canvas.lineWidth = 10;

    find_position = (obj) ->
      curleft = 0
      curtop = 0
      curleft = $(obj).offset().left - $(window).scrollLeft()
      curtop = $(obj).offset().top - $(window).scrollTop();
      { x: curleft, y: curtop };

    mouse_draw = (e) ->
      position = find_position(@)
      e._x = e.clientX - position.x;
      e._y = e.clientY - position.y;
      func = tools.pencil[e.type];
      if func?
        func(e)

    @.bind('mousedown mousemove mouseup', mouse_draw);

    canvas