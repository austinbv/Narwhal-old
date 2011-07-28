class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :permalink, :unique => true

      t.timestamps
    end
  end
end
