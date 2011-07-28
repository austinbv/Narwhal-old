class Slide < ActiveRecord::Base
  belongs_to :project
  has_many :shapes
end
