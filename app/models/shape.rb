class Shape < ActiveRecord::Base
  belongs_to :slide
  attr_accessible :points, :fill_color, :stroke_width, :stroke_color, :height, :width, :radius, :type
end
