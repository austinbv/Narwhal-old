class Narwhal.Presentation
  constructor: (@name = @generateName(5)) ->
    @slides.push(new Slide())

  generateName: (length) ->
    chars = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "T", "Z", "a", "b", "c", "d", "e", "f", "g", "h", "i", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"];
    str = ""
    length.times ->
      random = Math.floor(Math.random()*chars.length)
      str += chars[random]
    str
  slides: []
