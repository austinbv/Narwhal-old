class XPointsYPointsToPoints < ActiveRecord::Migration
  def up
    remove_column :shapes, :y_points
    rename_column :shapes, :x_points, :points
  end

  def down
    add_column :shapes, :y_points
    rename_column :shapes, :points, :x_points
  end
end
