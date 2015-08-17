class BooksController < ApplicationController

  def index
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    #Admin if statement to be added
    @book = Book.new(book_params)
    if @book.save
      redirect_to book_path(@book), notice: "Book was successfully added"
    else
      render :new
    end
  end

  def edit

  end

  def update

  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :isbn, :pub_date, :genre, :format, :publisher, :summary)
  end
end
