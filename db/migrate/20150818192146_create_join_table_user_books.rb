class CreateJoinTableUserBooks < ActiveRecord::Migration
  def change
    create_join_table :users, :books, table_name: :user_books do |t|
      t.index :user_id
      t.index :book_id
      t.boolean :read
    end
  end
end
