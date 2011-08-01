describe "Presentation", ->
  describe "that is new", ->
    beforeEach ->
      window.p = new Presentation

    it "should be creatable", ->
      expect(p).toBeDefined();

    it "should not have any slides", ->
      expect(p.slides.length).toEqual(0)

    it "should have a name", ->
      expect(p.name).toBeDefined()

    describe "with a given name", ->
      beforeEach ->
        window.x = new Presentation "My Project"

      it "should have a My Project as a name", ->
        expect(x.name).toEqual("My Project")

    describe "with out a given name", ->
      it "should have a name of length 5", ->
        expect(p.name.length).toEqual(5)

  describe "#generateName(length)", ->
    beforeEach ->
      p = new Presentation

    it "should be defined", ->
      expect(p.generateName).toBeDefined()

    it "should return a string of length 5", ->
      expect(p.generateName(5).length).toEqual(5)
