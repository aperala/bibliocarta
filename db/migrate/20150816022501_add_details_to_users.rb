class AddDetailsToUsers < ActiveRecord::Migration
  def change
  add_column :users, :username, :string
  add_column :users, :location, :string
  add_column :users, :curator, :boolean, default: false
  end
end
