class AddUserInfoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :google_uid, :string
    add_column :users, :avatar_url, :text
  end
end
