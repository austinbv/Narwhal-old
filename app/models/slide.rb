class Slide < ActiveRecord::Base
  belongs_to :presentation
  has_many :shapes
end
