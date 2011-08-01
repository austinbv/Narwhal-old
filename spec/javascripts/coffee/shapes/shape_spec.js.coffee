describe "Generic Shape", ->
  describe "that is new", ->
    beforeEach ->
      window.shape = new Shape

    it "should be creatable", ->
      expect(shape).toBeDefined()

    describe "points", ->
      it "should have no points", ->
        expect(shape.points.length).toEqual 0

    describe "canvas specifics", ->
      it "should have a white fill color", ->
        expect(shape.fill_color).toEqual "#ffffff"

      it "should have a black stroke", ->
        expect(shape.stroke_color).toEqual "#000000"

      it "should have a line width of 1", ->
        expect(shape.line_width).toEqual 1