class CreateShapes < ActiveRecord::Migration
  def change
    create_table :shapes do |t|
      t.references :slide

      t.string :shape_type
      t.integer :stroke_width
      t.string :stroke_color
      t.string :fill_color
      t.integer :height
      t.integer :width
      t.integer :radius
      t.text :points

      t.timestamps
    end
  end
end
