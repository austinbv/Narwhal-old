describe "Slide", ->
  beforeEach ->
    window.s = new Slide

  it "should be creatable", ->
    expect(s).toBeDefined()

  it "should not be active", ->
    expect(s.active).toEqual 0

  it "should have no shapes", ->
    expect(s.shapes.length).toEqual 0
