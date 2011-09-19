class ChangePointsToString < ActiveRecord::Migration
  def change
    change_column :shapes, :points, :string
  end
end
