class Book < ActiveRecord::Base

  has_many :book_places, dependent: :destroy
  has_many :places, -> { uniq }, through: :book_places
  
  validates :isbn,   :isbn_format => true
  validates_presence_of :title

  def add(place)
    self.places << place
  end

  def toss(place)
    self.places.destroy(place)
  end

end
