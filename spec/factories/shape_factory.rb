Factory.define(:shape) do |sh|
  sh.association :slide
  sh.stroke_color "#000000"
  sh.stroke_width 5
end

Factory.define(:square, :parent => :shape) do |s|
  s.type "rectange"
  s.height 30
  s.width 30
  s.points "30,30"
end

Factory.define(:line, :parent => :shape) do |l|
  l.type "line"
  l.points "30,30:31,31:31,32"
end

Factory.define(:circle, :parent => :shape) do |c|
  c.type "circle"
  c.radius 30
  c.points "30,30"
end