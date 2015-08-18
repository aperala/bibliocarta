class AddIdToUserBooks < ActiveRecord::Migration
  def change
    add_column :user_books, :id, :primary_key, first: true
  end
end
