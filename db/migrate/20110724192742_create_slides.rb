class CreateSlides < ActiveRecord::Migration
  def change
    create_table :slides do |t|
      t.references :project

      t.timestamps
    end
  end
end
