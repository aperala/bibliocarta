class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def index
    @books = Book.all
    @title = "All Books"
  end

  def show

  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.valid?
      @book.avatar_remote_url("http://covers.openlibrary.org/b/isbn/#{@book.isbn}-M.jpg")
      @book.save!
      redirect_to book_path(@book), notice: "Book was successfully added"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @book.update(book_params)
      @book.avatar_remote_url("http://covers.openlibrary.org/b/isbn/#{@book.isbn}-M.jpg")
      @book.save!
      redirect_to @book, notice: "Book was successfully updated"
    else
      render :edit
    end
  end

  def destroy

  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :author, :isbn, :pub_date, :genre, :format, :publisher, :summary, :avatar)
  end
end
