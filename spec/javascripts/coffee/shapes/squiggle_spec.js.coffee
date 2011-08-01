describe "Squiggle", ->
  it "should be creatable", ->
    squiggle = new Squiggle
    expect(squiggle).toBeDefined()

  describe "that is new", ->
    beforeEach ->
      window.squiggle = new Squiggle("1,1:2,2")

    it "should have points 1,1:2,2", ->
      expect(squiggle.points).toEqual "1,1:2,2"