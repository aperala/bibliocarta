class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.integer :isbn
      t.date :pub_date
      t.string :genre
      t.string :format, default: "pb"
      t.string :publisher
      t.text :summary
    end
  end
end
