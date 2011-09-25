class ShapesPointsFromStringToText < ActiveRecord::Migration
  def up
    change_column :shapes, :points, :text
  end

  def down
    change_column :shapes, :points, :string
  end
end
