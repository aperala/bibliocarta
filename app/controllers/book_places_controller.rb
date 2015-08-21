class BookPlacesController < ApplicationController

  def new
    @books = Book.all
    @book_place = BookPlace.new
  end

  def create
    @book = Book.find(params[:place_id])
    @place = Place.find(params[:place_id])
    @place.books << @book   
    redirect_to book_path(@book)
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :isbn, :pub_date, :genre, :format, :publisher, :summary)
  end

  def book_places_params
    params.require(:book_place).permit(:book_id, :place_id)
  end

end