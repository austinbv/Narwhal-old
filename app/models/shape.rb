require 'digest/sha1'
class Shape < ActiveRecord::Base
  belongs_to :slide
  attr_accessible :points, :fill_color, :stroke_width, :stroke_color, :height, :width, :radius, :shape_type
  serialize :points

  before_create :build_hash
  private

  def build_hash
    self.hash = Digest::SHA1.hexdigest(self.points.to_s)
  end
end
