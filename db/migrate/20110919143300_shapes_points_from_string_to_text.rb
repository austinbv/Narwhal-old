class ShapesPointsFromStringToText < ActiveRecord::Migration
  def up
    change_column :shapes, :points, :text
  end

  def down
    remove_column :shapes, :points
    add_column :shapes, :points, :string
  end
end
