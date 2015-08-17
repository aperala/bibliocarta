require 'isbn_validation'

class Book < ActiveRecord::Base
  
  validates :isbn,   :isbn_format => true
  
end
