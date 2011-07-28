class RenameProjectToPresentation < ActiveRecord::Migration
  def up
    rename_table :projects, :presentations
    rename_column :slides, :project_id, :presentation_id
  end

  def down
    rename_table :presentations, :projects
    rename_column :slides, :presentation_id, :project_id
  end
end
