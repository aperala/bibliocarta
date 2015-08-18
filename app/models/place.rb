class Place < ActiveRecord::Base
  has_many :book_places, dependent: :destroy
  has_many :books, -> { uniq }, through: :book_places

  validates :name, uniqueness: true
end