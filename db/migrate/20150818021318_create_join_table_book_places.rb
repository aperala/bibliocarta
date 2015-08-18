class CreateJoinTableBookPlaces < ActiveRecord::Migration
  def change
    create_join_table :books, :places, table_name: :book_places do |t|
      t.index :book_id
      t.index :place_id
    end
  end
end
