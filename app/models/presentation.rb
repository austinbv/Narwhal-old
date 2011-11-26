class Presentation < ActiveRecord::Base
  has_many :slides
  belongs_to :creator, :class_name => "User"
  has_and_belongs_to_many :users
  validates :permalink,
            :presence => true,
            :uniqueness => true
  after_initialize :create_permalink

  attr_accessible :collaberation_on

  def to_param
    permalink
  end

  private

  def create_permalink
    if self.permalink.nil?
      max = 0
      (0..7).each {|power| max += 36 ** power}
      self.permalink = rand(max).to_s(36)
    end
  end
end
