class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :user_books, dependent: :destroy
  has_many :books, through: :user_books
  has_many :places, through: :books

  def add(book)
    return if user.books.include?(book)
    user.books << book
  end

end
