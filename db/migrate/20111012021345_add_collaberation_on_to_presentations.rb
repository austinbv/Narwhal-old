class AddCollaberationOnToPresentations < ActiveRecord::Migration
  def change
    add_column :presentations, :collaberation_on, :boolean, :default => true
  end
end
