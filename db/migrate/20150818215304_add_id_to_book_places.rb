class AddIdToBookPlaces < ActiveRecord::Migration
  def change
    add_column :book_places, :id, :primary_key, first: true
  end
end
