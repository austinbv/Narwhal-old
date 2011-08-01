describe "Canvas", ->
  beforeEach ->
    loadFixtures("canvas.html")
  it "should handle mousedown/up/move events", ->
    $("#drawn").canvasize()
    expect($("#drawn")).toHandle("mousedown")
    expect($("#drawn")).toHandle("mouseup")
    expect($("#drawn")).toHandle("mousemove")
