class ChangePointsToXAndYPoints < ActiveRecord::Migration
  def change
    add_column :shapes, :x_points, :integer
    add_column :shapes, :y_points, :integer
    remove_column :shapes, :points
  end
end
