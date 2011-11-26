class User < ActiveRecord::Base
  has_many :created_presentations, :class_name => "Presentation", :foreign_key => :creator_id
  has_and_belongs_to_many :presentations
  attr_accessible :email, :google_uid, :first_name, :last_name, :avatar_url
  def name
    "#{first_name} #{last_name}"
  end
end
