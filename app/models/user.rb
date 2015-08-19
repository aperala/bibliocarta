class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :user_books, dependent: :destroy
  has_many :books, -> { uniq }, through: :user_books
  has_many :places, through: :books

  def add(book)
    self.books << book
  end

  def toss(book)
    self.books.destroy(book)
  end
end
