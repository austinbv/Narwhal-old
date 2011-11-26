class AddUsersPresentationsTable < ActiveRecord::Migration
  def change
    create_table :presentations_users do |t|
      t.integer :user_id
      t.integer :presentation_id
    end
  end
end
