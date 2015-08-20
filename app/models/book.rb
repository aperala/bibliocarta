class Book < ActiveRecord::Base

  has_many :book_places, dependent: :destroy
  has_many :places, -> { uniq }, through: :book_places
  
  validates :isbn,   :isbn_format => true
  validates_presence_of :title

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  def add(place)
    places << place
  end

  def toss(place)
    places.destroy(place)
  end

end
