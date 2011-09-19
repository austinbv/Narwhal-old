describe "Testing the canvas", ->
  beforeEach ->
    loadFixtures("canvas.html")

  describe "#get_pixel_data", ->
    pixel_datas = []
    beforeEach ->
      pixel_datas = $("#drawing").test_draw('get_pixel_data', {p1:[1,1]})

    it "should return an array of arrays length 4", ->
      expect(typeof pixel_datas is "object").toBeTruthy()
      for pixel in pixel_datas
        expect(typeof pixel is "object").toBeTruthy()
        expect(pixel.length).toEqual(4)

    it "should have an int for each value", ->
      for pixel in pixel_datas
        for color in pixel
          expect(typeof color is "number").toBeTruthy()

    it "should return the right color", ->
      $("#drawing").drawLine({strokeStyle: "#000", strokeWidth: 1, points:{p1:[0,0],p2:[20,20]}})
      x = $("#drawing").test_draw("get_pixel_data", {p1:[0,0]})

  describe "#color_is", ->
    canvas = {}
    is_white = {}
    beforeEach ->
      canvas = $("#drawing").loadCanvas()
      is_white = $("#drawing").test_draw('color_is', {p1:[1,1]}, 255, 255, 255, 255)

    it "should return boolean for two points", ->
        expect(typeof is_white is "boolean").toBeTruthy()

    it "should return boolean for more than two points", ->
      is_white = $("#drawing").test_draw('color_is', {p1:[1,1], p2:[2,2]}, 255, 255, 255, 255)
      expect(typeof is_white is "boolean").toBeTruthy()

    it "should draw a bunch of black points then pass that they are back", ->
      $("#drawing").drawLine({strokeStyle: '#000', strokeWidth: 2, points: {p1: [100,100], p2: [110, 110], p3: [115, 115]}})
      pass = $("#drawing").test_draw('color_is', {p1:[100,100],p2:[110,110],p3:[114,114]}, 0, 0, 0, 255)
      expect(pass).toBeTruthy()
