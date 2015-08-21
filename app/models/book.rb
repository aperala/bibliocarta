class Book < ActiveRecord::Base
  attr_reader :avatar_remote_url

  has_many :book_places, dependent: :destroy
  has_many :places, -> { uniq }, through: :book_places
  
  validates :isbn,   :isbn_format => true
  validates_presence_of :title

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  def avatar_remote_url(url_value)
    self.avatar = URI.parse(url_value)
    # @avatar_remote_url = url_value
  end

  def add(place)
    self.places << place
  end

  def toss(place)
    self.places.destroy(place)
  end

end
