class UserBooksController < ApplicationController
  respond_to :html, :js

  def new
    @user_book = UserBook.new
  end

  def create
    @book = Book.find(params[:book_id])
    @user = current_user
    if !@user.books.include?(@book)
      @user.books << @book
    end
    respond_to do |format|
      format.html
      format.js
    end   
  end

  private

  def user_books_params
    params.require(:user_book).permit(:user_id, :book_id)
  end

end