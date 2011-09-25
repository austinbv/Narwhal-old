require 'digest/sha1'
class AddShapeHashToShapes < ActiveRecord::Migration
  def up
    add_column :shapes, :hash, :string
    Shape.all.each do |shape|
      shape.hash = Digest::SHA1.hexdigest(shape.points.to_s)
      shape.save
    end
  end

  def down
    remove_column :shapes
  end
end
