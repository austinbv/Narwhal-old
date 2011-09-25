class ChangePointsToXAndYPoints < ActiveRecord::Migration
  def up
    add_column :shapes, :x_points, :integer
    add_column :shapes, :y_points, :integer
    remove_column :shapes, :points
  end

  def down
    remove_column :shapes, :x_points
    remove_column :shapes, :y_points
    add_column :shapes, :points, :text
  end
end
