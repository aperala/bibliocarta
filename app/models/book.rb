class Book < ActiveRecord::Base
  attr_reader :avatar_remote_url

  has_many :book_places, dependent: :destroy
  has_many :places, -> { uniq }, through: :book_places
  
  validates :isbn,   :isbn_format => true
  validates_uniqueness_of :isbn
  validates_presence_of :title

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/book-6x.png"
  validates_attachment_content_type :avatar, :content_type => [ "application/octet-stream", /\Aimage\/.*\Z/ ]

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

  def self.to_csv
    CSV.generate do |csv|
      csv << column_names
      all.each do |book|
        csv << book.attributes.values_at(*column_names)
      end
    end
  end

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Book.create! row.to_hash
    end
  end
end
