class RemoveDetailsFromBooks < ActiveRecord::Migration
  def change
    remove_column :books, :format, :string
    remove_column :books, :pub_date, :date
  end
end
