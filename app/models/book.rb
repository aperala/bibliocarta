class Book < ActiveRecord::Base
  
  validates :isbn,   :isbn_format => true
  validates_presence_of :title

end
