class Slide < ActiveRecord::Base
  belongs_to :presentation, :touch => true
  has_many :shapes
end
