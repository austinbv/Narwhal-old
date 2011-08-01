describe "Rectangle", ->
  it "should be creatable", ->
    rect = new Rectangle("100,100", 10, 20)
    expect(rect).toBeDefined()