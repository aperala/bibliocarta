class BookPlace < ActiveRecord::Base
  belongs_to :place
  belongs_to :book
end
