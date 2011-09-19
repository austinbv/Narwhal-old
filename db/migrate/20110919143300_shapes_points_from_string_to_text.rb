class ShapesPointsFromStringToText < ActiveRecord::Migration
  def change
    change_column :shapes, :points, :text
  end
end
