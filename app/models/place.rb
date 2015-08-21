class Place < ActiveRecord::Base
  has_many :book_places, dependent: :destroy
  has_many :books, -> { uniq }, through: :book_places

  validates :name, uniqueness: true

  geocoded_by :name
  after_validation :geocode, if: :name_changed?

  def add(book)
    self.books << book
  end

  def toss(book)
    self.books.destroy(book)
  end

end