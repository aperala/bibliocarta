class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  before_filter :is_curator, only: [:new, :create, :import, :edit, :destroy]
  autocomplete :book, :title, :full => true, :display_value => :prettify

  def index
    @title = "All Books"
    if params[:search]
      @books = Book.search(params[:search]).order("title ASC")
    else
      @books = Book.all.order("title ASC")
    end
    respond_to do |format|
      format.html
      format.csv {render text: @books.to_csv}
    end
  end

  def show
    @readers = User.joins(:books).where(books: {id: @book.id}).select('id', 'username')
  end

  def new
    @book = Book.new    
  end

  def import
    Book.import(params[:file])
    redirect_to books_path, notice: "Books imported"
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
   @book.destroy
   redirect_to books_path
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :author, :isbn, :genre, :summary, :avatar, :avatar_file_name)
  end
end
