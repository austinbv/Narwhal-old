class AddCreatorIdToPresentations < ActiveRecord::Migration
  def change
    add_column :presentations, :creator_id, :integer
  end
end
