class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :name
      t.string :region
      t.float :latitude
      t.float :longitude
    end
  end
end
