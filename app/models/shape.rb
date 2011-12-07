require 'digest/sha1'
class Shape < ActiveRecord::Base
  belongs_to :slide
  attr_accessible :points, :fill_color, :stroke_width, :stroke_color, :height, :width, :radius, :shape_type
  serialize :points

  before_create :build_hash
  
# named_scope :all_upto, lambda { |created_at| { conditions: ["created_at < ?", created_at] } }
  
  def points_to_path(scale = 0.25)
    path = "M"
    path << "#{points.first[1]["x"].to_i*scale} #{points.first[1]["y"].to_i*scale}"
    points.each_value do |point|
      path << "L#{point["x"].to_i*scale} #{point["y"].to_i*scale}"
    end
    path
  end

  private

  def build_hash
    self.hash = Digest::SHA1.hexdigest(self.points.to_s)
  end
end
